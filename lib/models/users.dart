part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String email;
  // final String password;
  final String name;
  final String alamat;
  final String kota;
  final String tipeUser;
  final String imgUrl;
  final String token;

  Users(this.uid, this.email,
      {this.name,
      this.alamat,
      this.kota,
      this.tipeUser,
      this.imgUrl,
      this.token});

  @override
  List<Object> get props =>
      [uid, email, name, alamat, kota, tipeUser, imgUrl, token];
}
