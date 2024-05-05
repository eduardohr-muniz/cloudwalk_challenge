import 'dart:convert';

class IpApiModel {
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as_;
  final String query;
  IpApiModel({
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as_,
    required this.query,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'countryCode': countryCode,
      'region': region,
      'regionName': regionName,
      'city': city,
      'zip': zip,
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'isp': isp,
      'org': org,
      'as_': as_,
      'query': query,
    };
  }

  factory IpApiModel.fromMap(Map map) {
    return IpApiModel(
      country: map['country'] ?? '',
      countryCode: map['countryCode'] ?? '',
      region: map['region'] ?? '',
      regionName: map['regionName'] ?? '',
      city: map['city'] ?? '',
      zip: map['zip'] ?? '',
      lat: map['lat'],
      lon: map['lon'],
      timezone: map['timezone'] ?? '',
      isp: map['isp'] ?? '',
      org: map['org'] ?? '',
      as_: map['as_'] ?? '',
      query: map['query'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IpApiModel.fromJson(String source) => IpApiModel.fromMap(json.decode(source));

  IpApiModel copyWith({
    String? country,
    String? countryCode,
    String? region,
    String? regionName,
    String? city,
    String? zip,
    double? lat,
    double? lon,
    String? timezone,
    String? isp,
    String? org,
    String? as_,
    String? query,
  }) {
    return IpApiModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      region: region ?? this.region,
      regionName: regionName ?? this.regionName,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      isp: isp ?? this.isp,
      org: org ?? this.org,
      as_: as_ ?? this.as_,
      query: query ?? this.query,
    );
  }

  @override
  String toString() {
    return 'IpApiModel(country: $country, countryCode: $countryCode, region: $region, regionName: $regionName, city: $city, zip: $zip, lat: $lat, lon: $lon, timezone: $timezone, isp: $isp, org: $org, as_: $as_, query: $query)';
  }
}
