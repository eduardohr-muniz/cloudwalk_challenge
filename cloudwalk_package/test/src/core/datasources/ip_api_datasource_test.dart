import 'package:flutter_test/flutter_test.dart';
import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:mocktail/mocktail.dart';

class MockHttp extends Mock implements IHttp {}

void main() {
  group('IpApiDatasource Unit', () {
    late IHttp mockHttp;
    late IIpapiDatasource datasource;

    setUp(() {
      mockHttp = MockHttp();
      datasource = IpapiDatasource(http: mockHttp);
    });

    test('getCurrentLocale', () async {
      final mockResponse = {'status': 'success', "lat": -21.7863, "lon": -46.5696};

      when(() => mockHttp.get(any(), headers: any(named: 'headers'), query: any(named: 'query')))
          .thenAnswer((_) async => HttpResponse(data: mockResponse, statusCode: 200));

      final result = await datasource.getCurrentLocale();

      expect(result, isA<Map>());
      expect(result.containsKey('lat') && result.containsKey('lon'), true);
      expect(result['status'], 'success');
    });
  });
  //! Esse cara resolvi comentar pq a api da muito problema,
  //! Status 429 pra ser exato quer dizer que houve muitas solicitaçõe,s porem ta bugado não sei o porque

  // group('IpApiDatasource EndtoEnd', () {
  //   late IpapiDatasource datasource;
  //   late IHttp http;

  //   setUp(() {
  //     http = HttpDio();
  //     datasource = IpapiDatasource(http: http);
  //   });

  //   test('getCurrentLocale ENDTOEND', () async {
  //     final result = await datasource.getCurrentLocale();

  //     expect(result, isA<Map>());
  //     expect(result.containsKey('lat') && result.containsKey('lon'), true);
  //     expect(result['status'], 'success');
  //   });
  // });
}
