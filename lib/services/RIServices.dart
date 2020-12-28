part of 'services.dart';

class RIServices {
  static CollectionReference pantiReference =
      FirebaseFirestore.instance.collection("panti");

  static Future<bool> updateGoodsNeeded(ResidentialInstitutions panti) async {
    await Firebase.initializeApp();

    pantiReference.doc("CdM3SJPkXE3IUEnQRovm").update({
      'neededGoods': panti.neededGoods,
    });
    return true;
  }
}
