defmodule GenReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "Should return a report from a given filename" do
      return = GenReport.build("test_report.csv")

      expected = %{
        all_hours: %{
          cleiton: 12,
          daniele: 21,
          danilo: 6,
          diego: 7,
          giuliano: 14,
          jakeliny: 14,
          joseph: 3,
          mayk: 19,
          rafael: 7
        },
        hours_per_month: %{
          cleiton: %{Junho: 4, Outubro: 8},
          daniele: %{Abril: 7, Dezembro: 5, Junho: 1, Maio: 8},
          danilo: %{Fevereiro: 6},
          diego: %{Agosto: 4, Setembro: 3},
          giuliano: %{Abril: 1, Fevereiro: 9, Maio: 4},
          jakeliny: %{Julho: 8, Março: 6},
          joseph: %{Março: 3},
          mayk: %{Dezembro: 5, Julho: 7, Setembro: 7},
          rafael: %{Julho: 7}
        },
        hours_per_year: %{
          cleiton: %{2016 => 3, 2020 => 9},
          daniele: %{2016 => 10, 2017 => 3, 2018 => 7, 2020 => 1},
          danilo: %{2019 => 6},
          diego: %{2016 => 3, 2017 => 4},
          giuliano: %{2017 => 3, 2019 => 6, 2020 => 5},
          jakeliny: %{2017 => 8, 2019 => 6},
          joseph: %{2017 => 3},
          mayk: %{2016 => 7, 2017 => 8, 2019 => 4},
          rafael: %{2017 => 7}
        }
      }

      assert return == expected
    end

    test "Should return a report from a list of filenames" do
      return = GenReport.build_from_many(["part_1.csv", "part_2.csv", "part_3.csv"])

      expected =
        {:ok,
         %{
           all_hours: %{
             cleiton: 13797,
             daniele: 13264,
             danilo: 13583,
             diego: 13015,
             giuliano: 13671,
             jakeliny: 13909,
             joseph: 13174,
             mayk: 13526,
             rafael: 13597,
             vinicius: 13412
           },
           hours_per_month: %{
             cleiton: %{
               Abril: 1161,
               Agosto: 1149,
               Dezembro: 1100,
               Fevereiro: 1168,
               Janeiro: 1271,
               Julho: 1236,
               Junho: 1123,
               Maio: 998,
               Março: 1091,
               Novembro: 1266,
               Outubro: 1073,
               Setembro: 1161
             },
             daniele: %{
               Abril: 1138,
               Agosto: 1018,
               Dezembro: 1019,
               Fevereiro: 1003,
               Janeiro: 1130,
               Julho: 1135,
               Junho: 1092,
               Maio: 1170,
               Março: 1177,
               Novembro: 1131,
               Outubro: 1046,
               Setembro: 1205
             },
             danilo: %{
               Abril: 1232,
               Agosto: 1200,
               Dezembro: 1149,
               Fevereiro: 1156,
               Janeiro: 1121,
               Julho: 1114,
               Junho: 966,
               Maio: 1075,
               Março: 1096,
               Novembro: 1122,
               Outubro: 1237,
               Setembro: 1115
             },
             diego: %{
               Abril: 1112,
               Agosto: 1129,
               Dezembro: 1177,
               Fevereiro: 1144,
               Janeiro: 1118,
               Julho: 1099,
               Junho: 1073,
               Maio: 1082,
               Março: 1029,
               Novembro: 995,
               Outubro: 928,
               Setembro: 1129
             },
             giuliano: %{
               Abril: 1152,
               Agosto: 1126,
               Dezembro: 1100,
               Fevereiro: 1173,
               Janeiro: 1107,
               Julho: 1169,
               Junho: 1197,
               Maio: 1182,
               Março: 1097,
               Novembro: 1105,
               Outubro: 1123,
               Setembro: 1140
             },
             jakeliny: %{
               Abril: 1172,
               Agosto: 1098,
               Dezembro: 1122,
               Fevereiro: 1119,
               Janeiro: 1118,
               Julho: 1245,
               Junho: 1182,
               Maio: 1129,
               Março: 1178,
               Novembro: 1085,
               Outubro: 1197,
               Setembro: 1264
             },
             joseph: %{
               Abril: 1047,
               Agosto: 1167,
               Dezembro: 1122,
               Fevereiro: 1202,
               Janeiro: 1084,
               Julho: 1153,
               Junho: 1105,
               Maio: 1082,
               Março: 1038,
               Novembro: 1005,
               Outubro: 1058,
               Setembro: 1111
             },
             mayk: %{
               Abril: 1016,
               Agosto: 1079,
               Dezembro: 1159,
               Fevereiro: 1085,
               Janeiro: 1100,
               Julho: 1093,
               Junho: 1190,
               Maio: 1173,
               Março: 1166,
               Novembro: 1257,
               Outubro: 1094,
               Setembro: 1114
             },
             rafael: %{
               Abril: 1171,
               Agosto: 1199,
               Dezembro: 965,
               Fevereiro: 1042,
               Janeiro: 1125,
               Julho: 1097,
               Junho: 1218,
               Maio: 1141,
               Março: 1220,
               Novembro: 1163,
               Outubro: 1161,
               Setembro: 1095
             },
             vinicius: %{
               Abril: 1149,
               Agosto: 1055,
               Dezembro: 1186,
               Fevereiro: 1102,
               Janeiro: 1036,
               Julho: 979,
               Junho: 1213,
               Maio: 1109,
               Março: 1191,
               Novembro: 1169,
               Outubro: 1113,
               Setembro: 1110
             }
           },
           hours_per_year: %{
             cleiton: %{2016 => 2699, 2017 => 2684, 2018 => 2805, 2019 => 2714, 2020 => 2895},
             daniele: %{2016 => 2573, 2017 => 2862, 2018 => 2633, 2019 => 2562, 2020 => 2634},
             danilo: %{2016 => 2746, 2017 => 2534, 2018 => 2972, 2019 => 2666, 2020 => 2665},
             diego: %{2016 => 2577, 2017 => 2647, 2018 => 2792, 2019 => 2486, 2020 => 2513},
             giuliano: %{2016 => 2784, 2017 => 2696, 2018 => 2693, 2019 => 2850, 2020 => 2648},
             jakeliny: %{2016 => 2869, 2017 => 2625, 2018 => 2765, 2019 => 2709, 2020 => 2941},
             joseph: %{2016 => 2603, 2017 => 2617, 2018 => 2587, 2019 => 2672, 2020 => 2695},
             mayk: %{2016 => 2644, 2017 => 2735, 2018 => 2770, 2019 => 2778, 2020 => 2599},
             rafael: %{2016 => 2684, 2017 => 2570, 2018 => 2628, 2019 => 2786, 2020 => 2929},
             vinicius: %{2016 => 2530, 2017 => 2720, 2018 => 2654, 2019 => 2640, 2020 => 2868}
           }
         }}

      assert return == expected
    end
  end
end
