part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String name;
  final String alamat;
  final String kota;
  final String email;
  final String tipeUser;
  final String imgUrl;

  Users(this.uid, this.email,
      {this.name, this.imgUrl, this.alamat, this.kota, this.tipeUser});

  @override
  List<Object> get props => [uid, name, alamat, kota, email, imgUrl, tipeUser];
}
