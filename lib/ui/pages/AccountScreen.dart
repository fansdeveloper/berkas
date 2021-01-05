part of 'pages.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);
  bool isLoading = false;
  String name, alamat, kota, imgUrl;

  void fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((event) {
      imgUrl = event.data()['profilePicture'];
      if (imgUrl == "") {
        imgUrl = null;
      }
      setState(() {});
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      name = value.data()['name'];
      kota = value.data()['kota'];
      alamat = value.data()['alamat'];
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Akun"),
        backgroundColor: HexColor("7A7ADC"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo/berkas 2.png'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAccountScreen(),
                    ));
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor("E7E7E7")),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Text(
                              name == null ? "" : name,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(alamat == null ? "" : alamat),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    color: HexColor("7A7ADC")),
                                Text(
                                  kota == null ? "" : kota,
                                  style: TextStyle(
                                    color: HexColor("7A7ADC"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                          color: HexColor("BEBEEA"),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.zero, bottom: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DonasiSayaScreen()));
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Status Donasi",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Divider(
                            color: HexColor("7A7ADC"),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Pengaturan",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Divider(
                            color: HexColor("7A7ADC"),
                          ),
                          FlatButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Konfirmasi Keluar"),
                                      content: Text(
                                          "Apakah anda yakin untuk keluar?"),
                                      actions: [
                                        FlatButton(
                                          onPressed: () async {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            await AuthServices.signOut()
                                                .then((value) {
                                              if (value) {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return SignIn();
                                                }));
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              } else {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              }
                                            });
                                          },
                                          child: Text("Yes"),
                                          textColor: primary,
                                        ),
                                        FlatButton(
                                            child: Text("No"),
                                            textColor: primary,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Keluar",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.8),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(imgUrl ??
                      "https://image.freepik.com/free-vector/businessman-character-avatar-icon-vector-illustration-design_24877-18271.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
