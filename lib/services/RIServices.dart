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

  static Future<bool> deleteGoodsNeeded(ResidentialInstitutions panti) async {
    await Firebase.initializeApp();

    pantiReference
        .doc("CdM3SJPkXE3IUEnQRovm")
        .update({'neededGoods': FieldValue.arrayRemove(panti.neededGoods)});
    return true;
  }
}
