import 'package:cloudwalk_package/cloudwalk_package.dart';

class IpApiDatasource implements IIpApiDatasource {
  final IHttp http;

  IpApiDatasource({required this.http});
  @override
  Future<Map> getCurrentLocale() async {
    final req = await http.get("https://ipapi.co/json/");
    return req.data;
  }
}
