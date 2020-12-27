part of 'pages.dart';

class RIEditProfileScreen extends StatefulWidget {
  @override
  RIEditProfileScreen({Key key, this.users}) : super(key: key);
  final Users users;

  _RIEditProfileScreenState createState() => _RIEditProfileScreenState();
}

class _RIEditProfileScreenState extends State<RIEditProfileScreen> {
  Users users;
  TextEditingController ctrlName,
      ctrlAlamat,
      ctrlKota,
      ctrlDesc,
      ctrlLaki,
      ctrlPerempuan;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  void initState() {
    users = widget.users;
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
                        child: Image.network(
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

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       Icons.location_on,
                //       color: HexColor("BEBEEA"),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: 10, right: 20),
                //       child: TextFormField(
                //         initialValue: "Jl. Babatan Sari Apple no 89",
                //         decoration: InputDecoration(
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: HexColor("7a7adc")),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: HexColor("7a7adc")),
                //           ),
                //           border: UnderlineInputBorder(
                //             borderSide: BorderSide(color: HexColor("7a7adc")),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
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
                onPressed: null,
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
