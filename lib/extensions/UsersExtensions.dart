part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser({String name = "no name", String imgUrl = ""}) =>
      Users(this.uid, this.email, name: name, imgUrl: imgUrl);
}
