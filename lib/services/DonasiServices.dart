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
}
