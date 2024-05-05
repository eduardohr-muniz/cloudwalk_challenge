import 'package:cloudwalk_package/cloudwalk_package.dart';

class IpApiRepository implements IIpApiRepository {
  final IIpApiDatasource datasource;

  IpApiRepository({required this.datasource});
  @override
  Future<IpApiModel> getCurrentLocale() async {
    return IpApiModel.fromMap(await datasource.getCurrentLocale());
  }
}
