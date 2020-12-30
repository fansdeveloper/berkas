part of 'services.dart';

class RIServices {
  static CollectionReference pantiReference =
      FirebaseFirestore.instance.collection("panti");

  static Future<bool> updateGoodsNeeded(ResidentialInstitutions panti) async {
    await Firebase.initializeApp();

    pantiReference
        .doc("CdM3SJPkXE3IUEnQRovm")
        .update({'neededGoods': FieldValue.arrayUnion(panti.neededGoods)});
    return true;
  }

  static Future<void> updatePanti(ResidentialInstitutions panti) async {
    pantiReference.doc(panti.id).set({
      'id': panti.id,
      'keterangan': panti.keterangan,
      'laki': panti.laki,
      'perempuan': panti.perempuan,
      'neededGoods': panti.neededGoods,
    });
  }

  static Future<bool> updateProfile(ResidentialInstitutions panti) async {
    await pantiReference.doc(panti.id).update(
      {
        'laki': panti.laki,
        'perempuan': panti.perempuan,
        'keterangan': panti.keterangan
      },
    );
    return true;
  }
}
