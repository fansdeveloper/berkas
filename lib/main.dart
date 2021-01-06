import 'package:berkas/ui/pages/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void main() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        color: Colors.green,
        child: Text(
          details.toString(),
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CheckTipeUser(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      );
    }
  }

  // ini ceritanya masih nyoba" biat keep logged it
  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [
  //       Provider<AuthenticationProvider>(
  //         create: (_) => AuthenticationProvider(FirebaseAuth.instance),
  //       ),
  //       StreamProvider(
  //         create: (context) => context.read<AuthenticationProvider>().authState,
  //       )
  //     ],
  //     child: MaterialApp(
  //       title: 'Firebase Authentication',
  //       home: Authenticate(),
  //     ),
  //   );
  // }
}

// ini ceritanya masih nyoba" biat keep logged it
// class Authenticate extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return Home();
//     }
//     return SignIn();
//   }
// }
