defmodule ParserTest do
  use ExUnit.Case
  alias GenReport.Parser

  describe "parse_file/1" do
    test "Should return formated lines of the csv file" do
      return =
        "test_report.csv"
        |> Parser.parse_file()
        |> Enum.map(fn line -> line end)

      expected = [
        [:daniele, 7, 29, :Abril, 2018],
        [:mayk, 4, 9, :Dezembro, 2019],
        [:daniele, 5, 27, :Dezembro, 2016],
        [:mayk, 1, 2, :Dezembro, 2017],
        [:giuliano, 3, 13, :Fevereiro, 2017],
        [:cleiton, 1, 22, :Junho, 2020],
        [:giuliano, 6, 18, :Fevereiro, 2019],
        [:jakeliny, 8, 18, :Julho, 2017],
        [:joseph, 3, 17, :Março, 2017],
        [:jakeliny, 6, 23, :Março, 2019],
        [:cleiton, 3, 20, :Junho, 2016],
        [:daniele, 5, 1, :Maio, 2016],
        [:giuliano, 1, 2, :Abril, 2020],
        [:daniele, 3, 5, :Maio, 2017],
        [:daniele, 1, 26, :Junho, 2020],
        [:diego, 3, 11, :Setembro, 2016],
        [:mayk, 7, 28, :Julho, 2017],
        [:mayk, 7, 3, :Setembro, 2016],
        [:danilo, 6, 28, :Fevereiro, 2019],
        [:diego, 4, 15, :Agosto, 2017],
        [:cleiton, 8, 3, :Outubro, 2020],
        [:giuliano, 4, 24, :Maio, 2020],
        [:rafael, 7, 1, :Julho, 2017]
      ]

      assert return == expected
    end
  end
end
