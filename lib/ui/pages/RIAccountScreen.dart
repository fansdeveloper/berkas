part of 'pages.dart';

class RIAccountScreen extends StatefulWidget {
  @override
  _RIAccountScreenState createState() => _RIAccountScreenState();
}

class _RIAccountScreenState extends State<RIAccountScreen> {
  @override
  Users users;
  String name, alamat, email, kota, tipeUser, imgUrl;
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);
  bool isLoading = false;
  String uid = FirebaseAuth.instance.currentUser.uid;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  void fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      name = value.data()['name'];
      alamat = value.data()['alamat'];
      kota = value.data()['kota'];
      email = value.data()['email'];
      tipeUser = value.data()['tipeUser'];
      if (mounted) {
        setState(() {});
      }
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((event) {
      imgUrl = event.data()['profilePicture'];
      if (imgUrl == "") {
        imgUrl = null;
      }
      setState(() {});
    });
  }

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  void initState() {
    fetchUserData();

    super.initState();
  }

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
                      builder: (context) => RIEditProfileScreen(
                            users: users,
                          ),
                      settings: RouteSettings(arguments: users)));
            },
          ),
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
                              height: 80,
                            ),
                            Text(
                              name == null ? "" : name,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(alamat == null ? "" : alamat),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: HexColor("7a7adc"),
                                ),
                                Text(
                                  kota == null ? "" : kota,
                                  style: TextStyle(
                                    color: HexColor("7a7adc"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PengaturanScreen();
                              }));
                            },
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
              alignment: Alignment(0, -0.75),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(imgUrl ??
                      "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg"),
                ),
              ),
            ),
            isLoading == true
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    child: SpinKitFadingCircle(size: 50, color: Colors.blue),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
