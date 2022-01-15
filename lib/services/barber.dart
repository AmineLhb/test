import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth.dart';
import 'dio.dart';
import 'salon.dart';

class Barber extends ChangeNotifier {
  String _token;
  static List<dynamic> _barber;
  static List<dynamic> get barber => _barber;

  final storage = new FlutterSecureStorage();

  //store barber
  void store({Map creds}) async {
    print(creds);

    try {
      _token = Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/barber',
          data: creds,
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
    } catch (e) {
      print(e.toString());
    }
  }

  void show(int id) async {
    // print(id);
    Dio.Response response = await dio().get('/barber/$id');
    _barber = response.data;
    print(response.data);
  }
}
