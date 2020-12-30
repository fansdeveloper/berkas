part of 'pages.dart';

class RIEditProfileScreen extends StatefulWidget {
  @override
  RIEditProfileScreen({Key key, this.users}) : super(key: key);
  final Users users;

  _RIEditProfileScreenState createState() => _RIEditProfileScreenState();
}

class _RIEditProfileScreenState extends State<RIEditProfileScreen> {
  Users users;
  String imgUrl;
  TextEditingController ctrlName,
      ctrlAlamat,
      ctrlKota,
      ctrlDesc,
      ctrlLaki,
      ctrlPerempuan;
  bool chooseImagePressed = false;

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
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((event) {
      imgUrl = event.data()['imgUrl'];
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
      ctrlName = TextEditingController(text: value.data()['name']);
      ctrlAlamat = TextEditingController(text: value.data()['alamat']);
      ctrlKota = TextEditingController(text: value.data()['kota']);
    });
    if (mounted) {
      setState(() {});
    }

    await FirebaseFirestore.instance
        .collection('panti')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      ctrlDesc = TextEditingController(text: value.data()['keterangan']);
      ctrlLaki = TextEditingController(text: value.data()['laki'].toString());
      ctrlPerempuan =
          TextEditingController(text: value.data()['perempuan'].toString());
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    users = widget.users;
    fetchUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edit Profil Panti",
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
                        child: chooseImagePressed == false
                            ? Image.network(imgUrl ??
                                "https://wallpaperaccess.com/full/259715.jpg")
                            : Image.network(imgUrl ??
                                "https://wallpaperaccess.com/full/259715.jpg"),
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
                            controller: ctrlAlamat,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on,
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                                color: HexColor("7a7adc"),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 20),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: HexColor("7a7adc"))),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: ctrlDesc,
                                  maxLines: 4,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Enter your text here"),
                                ),
                              )),
                          SizedBox(height: 20),
                          Text(
                            "Populasi",
                            style: TextStyle(
                                color: HexColor("7a7adc"),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: ctrlLaki,
                            decoration: InputDecoration(
                              labelText: "Laki-laki",
                              labelStyle: TextStyle(color: HexColor("7a7adc")),
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
                          TextFormField(
                            controller: ctrlPerempuan,
                            decoration: InputDecoration(
                              labelText: "Perempuan",
                              labelStyle: TextStyle(color: HexColor("7a7adc")),
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
                SizedBox(height: 100),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              color: HexColor("7A7ADC"),
              child: RaisedButton(
                onPressed: () {
                  Users user = Users(users.uid, users.name);
                  //update users
                  //update panti
                },
                child: Text(
                  "Simpan Perubahan",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
