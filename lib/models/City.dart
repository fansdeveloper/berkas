class City {
  Rajaongkir rajaongkir;

  City({this.rajaongkir});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(rajaongkir: Rajaongkir.fromJson(json['rajaongkir']));
  }
}

class Rajaongkir {
  Query query;
  Status status;
  List<Results> results;

  Rajaongkir({this.query, this.status, this.results});

  factory Rajaongkir.fromJson(Map<String, dynamic> json) {
    print("Raja Ongkir");
    var resultJson = json['results'] as List;
    print(resultJson);
    List<Results> _results =
        resultJson.map((e) => Results.fromJson(e)).toList();

    return Rajaongkir(
        query: Query.fromJson(json['query']),
        status: Status.fromJson(json['status']),
        results: _results);
  }
}

class Query {
  String province;

  Query({this.province});

  factory Query.fromJson(Map<String, dynamic> json) {
    print("Query");
    return Query(province: json['province']);
  }
}

class Status {
  int code;
  String description;

  Status({this.code, this.description});

  factory Status.fromJson(Map<String, dynamic> json) {
    print("Status");
    return Status(
        code: json['code'] as int, description: json['description'] as String);
  }
}

class Results {
  String cityId;
  String provinceId;
  String province;
  String type;
  String cityName;
  String postalCode;

  Results(
      {this.cityId,
      this.provinceId,
      this.province,
      this.type,
      this.cityName,
      this.postalCode});

  factory Results.fromJson(Map<String, dynamic> json) {
    print("Result");
    return Results(
      cityId: json['city_id'],
      provinceId: json['province_id'],
      province: json['province'] as String,
      type: json['type'] as String,
      cityName: json['city_name'] as String,
      postalCode: json['postal_code'] as String,
    );
  }
}
