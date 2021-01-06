part of 'pages.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Users users;
  String uid = FirebaseAuth.instance.currentUser.uid;
  String nama, email, kota, alamat, imgUrl;
  TextEditingController ctrlName, ctrlAlamat, ctrlKota;
  bool isLoading = false;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void fetchUserData() async {
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

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      nama = value.data()['name'];
      email = value.data()['email'];
      alamat = value.data()['alamat'];
      kota = value.data()['kota'];
      ctrlName = TextEditingController(text: nama);
      ctrlAlamat = TextEditingController(text: alamat);
      ctrlKota = TextEditingController(text: kota);
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
        elevation: 0,
        title: Text(
          "Edit Profil Donatur",
          style: TextStyle(color: HexColor("7A7ADC")),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HexColor("7A7ADC")),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Stack(overflow: Overflow.visible, children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: imageFile == null
                            ? Image.network(imgUrl ??
                                "https://image.freepik.com/free-vector/businessman-character-avatar-icon-vector-illustration-design_24877-18271.jpg")
                            : Image.file(
                                File(imageFile.path),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 0,
                      child: ButtonTheme(
                        minWidth: 50,
                        height: 50,
                        child: RaisedButton.icon(
                            onPressed: () {
                              chooseImage();
                            },
                            elevation: 5,
                            padding: EdgeInsets.only(left: 8),
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            label: Text(""),
                            shape: CircleBorder(),
                            color: HexColor("7a7adc")),
                      ),
                    ),
                  ]),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: ctrlName,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: HexColor("7a7adc")),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: ctrlAlamat,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.home, color: HexColor("7a7adc")),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: ctrlKota,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_city,
                                  color: HexColor("7a7adc")),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("7a7adc")),
                              ),
                            ),
                          ),
                        ])),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                color: HexColor("7A7ADC"),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  Users user = Users(uid, email,
                      name: ctrlName.text,
                      alamat: ctrlAlamat.text,
                      kota: ctrlKota.text);

                  bool result = await UserServices.updateProfile(user);
                  if (imageFile != null) {
                    bool result3 =
                        await UserServices.updateProfilePic(uid, imageFile);
                  }

                  if (result == true) {
                    Fluttertoast.showToast(
                        msg: "Update profile successful.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return MainTabBar(index: 2);
                      }),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Update profile failed. Please try again.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text(
                  "Simpan Perubahan",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: HexColor("7a7adc"),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
