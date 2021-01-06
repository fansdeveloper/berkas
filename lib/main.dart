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
  String tipeUser;

  // void fetchUserData() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .get()
  //       .then((value) {
  //     tipeUser = value.data()['tipeUser'];
  //   });
  // }

  // @override
  // void initState() {
  //   fetchUserData();
  //   this.initState();
  // }

  @override
  Widget build(BuildContext context) {
    /*
    if (FirebaseAuth.instance.currentUser != null) {
      if (tipeUser == "Panti") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return RIMainTabBar(
            index: 0,
          );
        }));
      } else if (tipeUser == "Donatur") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MainTabBar(index: 0);
        }));
      }
      //get tipeUser
      //if tipeuser == donatur
      //else
    } else {
      */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MainTabBar(index: 0),

      home: SignIn(),
    );
    //}
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
