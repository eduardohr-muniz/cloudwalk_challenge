import 'package:cloudwalk_package/cloudwalk_package.dart';

class IpapiRepository implements IIpapiRepository {
  final IpapiDatasource datasource;

  IpapiRepository({required this.datasource});

  @override
  Future<IpApiModel> getCurrentLocale() async {
    return IpApiModel.fromMap(await datasource.getCurrentLocale());
  }
}
