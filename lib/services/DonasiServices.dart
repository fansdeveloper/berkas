part of 'services.dart';

class DonasiServices {
  static CollectionReference donasiReference =
      FirebaseFirestore.instance.collection("donations");

  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  static DocumentReference donasiDoc;

  static Future<bool> konfirmasiDonasi(Donasi donasi) async {
    await Firebase.initializeApp();
    var token = await userReference
        .doc(donasi.donaturID)
        .get()
        .then((value) => value.data()['token']);
    var panti = await userReference
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => value.data()['name']);

    var donatur = await userReference
        .doc(donasi.donaturID)
        .get()
        .then((value) => value.data()['name']);
    if (donasi.id != null) {
      callOnFcmApiSendPushNotifications(token, panti, donatur);
      donasiReference.doc(donasi.id).update({'isConfirmed': true});

      return true;
    } else {
      return false;
    }
  }

  // static String token =
  //     "fbMfktZcRHmouBocAM2bdf:APA91bHl0yVrO83q9tNwlaRb0Eoyqx7GgY0zy3sjAZWBftBW4-DjkUt82NhX7I4ae6uakdcGR9yt64Gf6kZfIszoHBPj_Jm-UKIKO4-o3aQGoOFvPvdxetZGgSykPVG1_XzHJ3ljsacH";

  //fix url: endpoint hit API
  String url = "fcm.googleapis.com";

  //server key yg dilihat Project Overview > Tombol Setting > Tab Cloud Messaging
  static String key =
      "AAAAV9S9ZJg:APA91bFmlJRs3xCikbG2MvApedgmrKaVTnTjpmiasgi-bgcIpJi5nQ3Iw2YK7w3mmvtr9vJUaoUYlnwwBVvHJjX6yJ9uq5G_Mj30H3eYCjQMGTL73N990NeHjVtKtgL65GvtD_PBfccQ";

  static Future<bool> callOnFcmApiSendPushNotifications(
      String token, String panti, String donatur) async {
    final postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "to": token,
      "collapse_key": "type_a",
      "notification": {
        "title": 'Hai ' + donatur + ' 😊 Kabar baik nih!',
        "body": 'Donasimu sudah diterima oleh ' + panti + ' 💕!',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=' + key // 'key=YOUR_SERVER_KEY'
    };

    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }

  static Future<bool> addDonasi(Donasi donasi) async {
    await Firebase.initializeApp();

    donasiDoc = await donasiReference.add({
      'id': "",
      'pantiID': donasi.pantiID,
      'donaturID': donasi.donaturID,
      'keterangan': donasi.keterangan,
      'lokasi': donasi.lokasi,
      'tujuan': donasi.tujuan,
      'fee': donasi.fee,
      'weight': donasi.weight,
      'date': donasi.date,
      'kategori': donasi.kategori,
      'isConfirmed': donasi.isConfirmed,
      'noResi': donasi.noResi,
    });

    if (donasiDoc.id != null) {
      donasiReference.doc(donasiDoc.id).update({'id': donasiDoc.id});
      return true;
    } else {
      return false;
    }
  }

  static Future<Resi> fetchResi(String noResi) async {
    final response = await http.get(
        'https://api.binderbyte.com/v1/track?api_key=6e3f9afe1884fd24204d0fce16cdf88c5e8b11b1fa4d3840e36242f636533cd3&courier=jne&awb=$noResi');
    print(response);
    if (response.statusCode == 200) {
      return Resi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Ongkir> fetchOngkir(
      String origin, String destination, String weight) async {
    String client = "https://api.rajaongkir.com/starter/cost";
    Map<String, String> header = {
      "content-type": "application/x-www-form-urlencoded",
      "key": "b9f5d86e3f93058d2ae6dabf53641d34",
    };
    String body =
        "origin=$origin&destination=$destination&weight=$weight&courier=jne";

    http.Response responses = await http.post(Uri.parse(client),
        headers: header, body: body, encoding: Encoding.getByName("utf-8"));

    print(responses.body);
    if (responses.statusCode == 200) {
      print("200 BRUH");
      return Ongkir.fromJson(jsonDecode(responses.body));
    } else {
      print(Ongkir.fromJson(jsonDecode(responses.body)));
      throw Exception('Gagal Memuat Ongkos Kirim');
    }
  }

  static Future<City> fetchKota() async {
    String url = "https://api.rajaongkir.com/starter/city";
    Map<String, String> headers = {
      "key": "b9f5d86e3f93058d2ae6dabf53641d34",
    };
    http.Response response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("200 BRUH");
      return City.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(City.fromJson(jsonDecode(response.body)));
      throw Exception('Failed to load album');
    }
  }
}
