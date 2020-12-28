part of 'services.dart';

class DonasiServices {
  static CollectionReference donasiReference =
      FirebaseFirestore.instance.collection("donations");

  static Future<bool> konfirmasiDonasi(Donasi donasi) async {
    await Firebase.initializeApp();

    if (donasi.id != null) {
      donasiReference.doc(donasi.id).update({'isConfirmed': true});
      return true;
    } else {
      return false;
    }
  }
}
