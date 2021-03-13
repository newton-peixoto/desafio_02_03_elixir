defmodule GenReport do
  alias GenReport.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(start_report(), &report_acc/2)
  end

  def build_from_many(file_names) do
    report =
      file_names
      |> Task.async_stream(&build/1)
      |> Enum.reduce(start_report(), &merge_reports/2)

    {:ok, report}
  end

  defp merge_reports({:ok, partial}, report) do
    all_hours = merge_all_hours(partial.all_hours, report.all_hours)
    hours_per_month = merge_hours_per_month(partial.hours_per_month, report.hours_per_month)
    hours_per_year = merge_hours_per_year(partial.hours_per_year, report.hours_per_year)

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp report_acc(line, report) do
    all_hours = accumulate_all_hours(line, report.all_hours)
    hours_per_month = accumulate_hours_per_month(line, report.hours_per_month)
    hours_per_year = accumulate_hours_per_year(line, report.hours_per_year)

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_all_hours(partial_all_hours, all_hours) do
    recursive_merge(partial_all_hours, all_hours)
  end

  defp recursive_merge(left, right) when is_map(left) do
    Map.merge(left, right, fn _key, left_value, right_value ->
      recursive_merge(left_value, right_value)
    end)
  end

  defp recursive_merge(left, right), do: left + right

  defp merge_hours_per_month(partial_hours_per_month, hours_per_month) do
    recursive_merge(partial_hours_per_month, hours_per_month)
  end

  defp merge_hours_per_year(partial_hours_per_year, hours_per_year) do
    recursive_merge(partial_hours_per_year, hours_per_year)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end

  defp accumulate_all_hours([freelancer, hours | _tails], all_hours) do
    previous = Map.get(all_hours, freelancer, 0)

    Map.put(all_hours, freelancer, previous + hours)
  end

  defp accumulate_hours_per_month([freelancer, hours, _day, month, _year], hours_per_month) do
    previous_freelancer = Map.get(hours_per_month, freelancer, %{})
    previous_month = Map.get(previous_freelancer, month, 0)
    new_month = Map.put(previous_freelancer, month, previous_month + hours)

    Map.put(hours_per_month, freelancer, new_month)
  end

  defp accumulate_hours_per_year([freelancer, hours, _day, _month, year], hours_per_year) do
    previous_freelancer = Map.get(hours_per_year, freelancer, %{})
    previous_year = Map.get(previous_freelancer, year, 0)
    new_year = Map.put(previous_freelancer, year, previous_year + hours)

    Map.put(hours_per_year, freelancer, new_year)
  end

  defp start_report, do: %{all_hours: %{}, hours_per_month: %{}, hours_per_year: %{}}
end
