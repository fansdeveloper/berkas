part of 'models.dart';

class Resi {
  String message;
  int status;
  Data data;

  Resi({this.message, this.status, this.data});

  factory Resi.fromJson(Map<String, dynamic> json) {
    return Resi(
      message: json['message'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  Kesimpulan summary;
  List<Tracking> history;
  Detail detail;

  Data({this.summary, this.history, this.detail});

  factory Data.fromJson(Map<String, dynamic> json) {
    var historyJson = json['history'] as List;
    List<Tracking> _history =
        historyJson.map((e) => Tracking.fromJson(e)).toList();

    return Data(
      summary: Kesimpulan.fromJson(json['summary']),
      detail: Detail.fromJson(json['detail']),
      history: _history,
    );
  }
}

class Kesimpulan {
  String awb = '';
  String courier = '';
  String service = '';
  String status = '';
  String desc = '';
  String date = '';
  String amount = '';
  String weight = '';

  Kesimpulan(
      {this.awb,
      this.courier,
      this.service,
      this.status,
      this.date,
      this.desc,
      this.amount,
      this.weight});

  factory Kesimpulan.fromJson(Map<String, dynamic> json) {
    print("Kesimpulan");
    return Kesimpulan(
      awb: json['awb'] as String,
      courier: json['courier'] as String,
      service: json['service'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
      desc: json['desc'] as String,
      amount: json['amount'] as String,
      weight: json['weight'] as String,
    );
  }
}

class Tracking {
  String desc;
  String location;
  String date;

  Tracking({this.desc, this.location, this.date});

  factory Tracking.fromJson(Map<String, dynamic> json) {
    print("Tracking");
    return Tracking(
      desc: json['desc'] as String,
      location: json['location'] as String,
      date: json['date'] as String,
    );
  }
}

class Detail {
  String origin = '';
  String destination = '';
  String shipper = '';
  String reciever = '';

  Detail({
    this.origin,
    this.destination,
    this.shipper,
    this.reciever,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    print("Detail");
    return Detail(
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      shipper: json['shipper'] as String,
      reciever: json['reciever'] as String,
    );
  }
}
