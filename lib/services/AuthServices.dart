part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User> get authState => auth.idTokenChanges();
  // <void> jika tidak mengembalikan nilai
  static Future<String> signUp(String email, String password, String name,
      String alamat, String kota, String tipeUser) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users users = result.user.convertToUser(
          name: name,
          alamat: alamat,
          kota: kota,
          tipeUser: tipeUser,
          imgUrl: "");
      ResidentialInstitutions panti = ResidentialInstitutions(
          FirebaseAuth.instance.currentUser.uid, "", 0, 0, null);
      auth.signOut();
      await UserServices.updateUser(users);
      if (tipeUser == "Panti") {
        await RIServices.updatePanti(panti);
      }

      msg = "success";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => msg = "success",
          );
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }

  static Future<bool> signOut() async {
    bool result = false;
    await auth.signOut().whenComplete(() => result = true);
    return result;
  }

  static Future<String> currentUser(String email, String password, String name,
      String alamat, String kota, String tipeUser) async {
    await Firebase.initializeApp();
  }

  
}
