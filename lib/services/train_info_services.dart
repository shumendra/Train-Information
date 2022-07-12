import 'dart:convert';

import 'package:androgames_assignment/model/train_info_model.dart';
import 'package:http/http.dart' as http;

class TrainInfoServices {
  Future getTrainInfo({String? trainNumber}) async {
    Uri url = Uri.parse(
        'https://androgamesinfotech.com/temp/test.php?train=${trainNumber}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      TrainInfoModel trainInfo =
          TrainInfoModel.fromJson(json.decode(response.body));
      print('train Info = ${trainInfo.data!.quota!.length}');
      return trainInfo;
    } else {
      print("error. statuscode = ${response.statusCode}");
    }
  }
}
