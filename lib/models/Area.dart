part of 'models.dart';

class Area {
  String areaId;
  String area;
  String state;
  String country;
  String countryCode;
  String importance;
  String createdOn;
  String updatedOn;

  Area(
      {this.areaId,
      this.area,
      this.state,
      this.country,
      this.countryCode,
      this.importance,
      this.createdOn,
      this.updatedOn});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      areaId: json['area_id'],
      area: json['area'],
      state: json['state'],
      country: json['country'],
      countryCode: json['country_code'],
      importance: json['importance'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_id'] = this.areaId;
    data['area'] = this.area;
    data['state'] = this.state;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['importance'] = this.importance;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}
