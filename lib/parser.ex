defmodule GenReport.Parser do
  @months %{
    "1" => :Janeiro,
    "2" => :Fevereiro,
    "3" => :Março,
    "4" => :Abril,
    "5" => :Maio,
    "6" => :Junho,
    "7" => :Julho,
    "8" => :Agosto,
    "9" => :Setembro,
    "10" => :Outubro,
    "11" => :Novembro,
    "12" => :Dezembro
  }

  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(0, fn element -> element |> String.downcase() |> String.to_atom() end)
    |> List.update_at(1, fn element -> element |> String.to_integer() end)
    |> List.update_at(2, fn element -> element |> String.to_integer() end)
    |> List.update_at(3, fn element -> @months[element] end)
    |> List.update_at(4, fn element -> element |> String.to_integer() end)
  end
end
