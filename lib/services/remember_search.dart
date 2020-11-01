import 'dart:convert' as convert;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Remember {
  List<String> remember;
  Remember({this.remember});
  Remember.fromJson(Map<String, dynamic> remembers) {
    this.remember =
        (remembers["list"] as List).map((rem) => rem.toString()).toList();
  }
  Map<String, dynamic> toJson() => {
        'list': remember,
      };
}

Future<List<String>> readRememberSearch() async {
  try {
    final storage = new FlutterSecureStorage();
    String rememberSearch = await storage.read(key: 'rememberSearch');
    var rs = Remember.fromJson(convert.jsonDecode(rememberSearch)).remember;
    if(rs == null) throw Exception("null value");
    return rs;
  } catch (e) {
    throw e;
  }
}

Future<void> saveRememberSearch(String rememberSearch) async {
  try {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'rememberSearch', value: rememberSearch);
    print("saved");
  } catch (e) {
    throw e;
  }
}

Future<void> removeRememberSearch() async {
  final storage = new FlutterSecureStorage();
  await storage.delete(key: "rememberSearch");
}
