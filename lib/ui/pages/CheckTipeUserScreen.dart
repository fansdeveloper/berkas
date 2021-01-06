part of 'pages.dart';

class CheckTipeUser extends StatefulWidget {
  @override
  _CheckTipeUserState createState() => _CheckTipeUserState();
}

class _CheckTipeUserState extends State<CheckTipeUser> {
  String tipeUser = null;

  void fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      tipeUser = value.data()['tipeUser'];
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (tipeUser != null) {
      if (tipeUser == "Panti") {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return RIMainTabBar(
              index: 0,
            );
          }));
        });
      } else if (tipeUser == "Donatur") {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MainTabBar(index: 0);
          }));
        });
      }
    } else {
      return Container(width: 0.0, height: 0.0);
    }
    return Container(
      color: HexColor("7a7adc"),
      child: Center(
        child: Container(
          child: Text("Loading",
              style: TextStyle(color: Colors.white, fontSize: 10)),
        ),
      ),
    );
  }
}
