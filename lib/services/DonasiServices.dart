part of 'services.dart';

class DonasiServices {
  static CollectionReference donasiReference =
      FirebaseFirestore.instance.collection("donations");

  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  static DocumentReference donasiDoc;

  static Future<bool> konfirmasiDonasi(Donasi donasi) async {
    await Firebase.initializeApp();

    if (donasi.id != null) {
      sendNotif();

      donasiReference.doc(donasi.id).update({'isConfirmed': true});

      return true;
    } else {
      return false;
    }
  }

  static Future<http.Response> sendNotif() {
    //token penerima pada table user
    // var token = userReference
    //     .doc(uid)
    //     .get()
    //     .then((value) => value.data()['token']);

    String token =
        "e7NMKHLbT-WTMy3aJgwAzS:APA91bF5hn7JaO7I4r-EeBsHAI8mLwymGnIvUYsVStvJ8YeYOTe12iVPpYygImX-S7DzXAGygzLASZBnNxXhrvEYJJO8laSGJOzcJUuKe-rRJ7Cx80NsPvQwrfIiKWz_43IZJD3LqvAD";
    //fix url: endpoint hit API
    String url = "fcm.googleapis.com";
    //server key yg dilihat Project Overview > Tombol Setting > Tab Cloud Messaging
    String key =
        "AAAAV9S9ZJg:APA91bFmlJRs3xCikbG2MvApedgmrKaVTnTjpmiasgi-bgcIpJi5nQ3Iw2YK7w3mmvtr9vJUaoUYlnwwBVvHJjX6yJ9uq5G_Mj30H3eYCjQMGTL73N990NeHjVtKtgL65GvtD_PBfccQ";

    return http.post(
      Uri.https(url, "/fcm/send"),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
        'authorization': 'key=' + key,
      },
      body: jsonEncode(<String, String>{
        'to': token,
        'notification': jsonEncode(<String, String>{
          'title': 'Coba FCM',
          'body': 'Halooo',
        }),
      }),
    );
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
        'https://api.binderbyte.com/v1/track?api_key=8163e4c7c9cd3c6941ca0b2f518d2bee3680073e35e3c0d487663e8e3afb75ad&courier=jne&awb=$noResi');
    print(
        'https://api.binderbyte.com/v1/track?api_key=8163e4c7c9cd3c6941ca0b2f518d2bee3680073e35e3c0d487663e8e3afb75ad&courier=jne&awb=$noResi');
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
}
