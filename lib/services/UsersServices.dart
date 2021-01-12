part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  static DocumentReference userDoc;
  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set({
      'uid': users.uid,
      'email': users.email,
      // 'password': users.password,
      'name': users.name,
      'kota': users.kota,
      'alamat': users.alamat,
      'tipeUser': users.tipeUser,
      'profilePicture': users.imgUrl ?? ""
    });
  }

  static Future<bool> updateProfilePic(String uid, PickedFile imgFile) async {
    if (imgFile != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("profilePic")
          .child(uid + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      userCollection.doc(uid).update({'profilePicture': imgUrl});

      return true;
    } else {
      return false;
    }
  }

  static Future<Users> getUserData(String uid) async {
    Users user;
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();

    return user;
  }

  static Future<bool> updateProfile(Users users) async {
    await userCollection.doc(users.uid).update(
      {'name': users.name, 'alamat': users.alamat, 'kota': users.kota},
    );
    return true;
  }

  static Future<bool> updateEmail(String email) async {
    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).update(
      {'email': email},
    );
    return true;
  }
}
