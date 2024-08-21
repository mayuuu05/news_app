// import 'dart:convert';
//
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// class CompanyHelper
// {
//
//   Future<Map> fetchApiData(String search)
//   async {
//     String api = "https://newsapi.org/v2/everything?q=$search&from=2024-07-14&sortBy=publishedAt&apiKey=57c76a4306a342098dd0fd2b6309fb4e";
//     Uri url = Uri.parse(api);
//     Response response = await http.get(url);
//     if(response.statusCode == 200)
//     {
//       final json = response.body;
//       Map data = jsonDecode(json);
//       return data;
//     }
//     else {
//       return {};
//     }
//   }
// }