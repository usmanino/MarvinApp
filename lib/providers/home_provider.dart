import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:marvin_app/ui/core/constant.dart';
import 'package:marvin_app/ui/core/md5.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider.initialize() {}
  Future getComics() async {
    String url = Constants.GET_COMICS +
        "?apikey=" +
        Constants.PUBLIC_KEY +
        "&ts=" +
        "1234" +
        "&hash=" +
        Md5()
            .generateMd5("1234" + Constants.PRIVATE_KEY + Constants.PUBLIC_KEY);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['results'];
    }
    throw Exception("Oops an error occur");
  }
}
