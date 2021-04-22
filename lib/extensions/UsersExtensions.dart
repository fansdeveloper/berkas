part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser(
          {
          // String uid = "no name",
          // String email = "no name",
          // String password = "no name",
          String name = "no name",
          String alamat = "no name",
          String kota = "no name",
          String tipeUser = "no name",
          String imgUrl = "no name",
          String token = ""}) =>
      Users(this.uid, this.email,
          // this.password,
          // this.name,
          // this.alamat,
          // this.kota,
          // this.tipeUser,
          // this.imgUrl
          // password: password,
          name: name,
          alamat: alamat,
          kota: kota,
          tipeUser: tipeUser,
          imgUrl: imgUrl,
          token: token);
}
