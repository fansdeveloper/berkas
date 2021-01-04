part of 'services.dart';

class DonasiServices {
  static CollectionReference donasiReference =
      FirebaseFirestore.instance.collection("donations");
  static DocumentReference donasiDoc;

  static Future<bool> konfirmasiDonasi(Donasi donasi) async {
    await Firebase.initializeApp();

    if (donasi.id != null) {
      donasiReference.doc(donasi.id).update({'isConfirmed': true});
      return true;
    } else {
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
        'https://api.binderbyte.com/v1/track?api_key=8163e4c7c9cd3c6941ca0b2f518d2bee3680073e35e3c0d487663e8e3afb75ad&courier=jnt&awb=$noResi');
    print(
        'https://api.binderbyte.com/v1/track?api_key=8163e4c7c9cd3c6941ca0b2f518d2bee3680073e35e3c0d487663e8e3afb75ad&courier=jnt&awb=$noResi');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("200 BRUH");
      return Resi.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
