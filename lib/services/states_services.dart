import 'dart:convert';

import 'package:covidtracker/model/world_states_model.dart';
import 'package:covidtracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fecthWorldStatesRecords() async {
    final responce = await http.get(Uri.parse(AppUral.worldStatesApi));
    print(responce);
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final responce = await http.get(Uri.parse(AppUral.countriesList));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
