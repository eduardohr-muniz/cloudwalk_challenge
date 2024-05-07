import 'package:cloudwalk_package/cloudwalk_package.dart';

class IpapiDatasource implements IIpapiDatasource {
  final IHttp http;

  IpapiDatasource({required this.http});
  @override
  Future<Map> getCurrentLocale() async {
    final req = await http.get("https://ipapi.co/json", headers: {
      "Content-Type": "application/json",
    });
    return req.data;
  }
}
