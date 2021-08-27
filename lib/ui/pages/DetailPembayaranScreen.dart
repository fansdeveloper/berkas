part of 'pages.dart';

class DetailPembayaranScreen extends StatefulWidget {
  final String donaturID, pantiID, alamatUser, alamatPanti, origin, destination;
  final List<dynamic> kategori;

  DetailPembayaranScreen({
    this.origin,
    this.donaturID,
    this.pantiID,
    this.alamatUser,
    this.alamatPanti,
    this.destination,
    this.kategori,
  });
  @override
  _DetailPembayaranScreenState createState() => _DetailPembayaranScreenState();
}

class _DetailPembayaranScreenState extends State<DetailPembayaranScreen> {
  var ctrlLokasi = TextEditingController();
  var ctrlKeterangan = TextEditingController();
  var ctrlBerat = TextEditingController();
  var ctrlTelp = TextEditingController();
  String _selectedVendor;
  int deliveryFee;
  String berat;
  bool active = true;
  @override
  void dispose() {
    ctrlLokasi.dispose();
    ctrlKeterangan.dispose();
    ctrlBerat.dispose();
    super.dispose();
  }

  List data, vendors;
  Future<Ongkir> futureOngkir;
  Future<City> futureCity;

  Future<String> getData() async {
    var res = await http.get(
        Uri.encodeFull(
            "http://paket.id/apis/v2/area/list?auth-user-email=thefansdeveloper@gmail.com&auth-api-key=8atYTEH8EhjYaHFNnkwe6udDw5MHyr4L"),
        headers: {'accept': 'application/json'});

    setState(() async {
      var content = await json.decode(res.body);
      data = content;
      print(content);
    });
    return 'success!';
  }

  Future<String> getVendor() async {
    var ven = await http.get(
        Uri.encodeFull(
            "http://paket.id/apis/v2/vendor?auth-user-email=thefansdeveloper@gmail.com&auth-api-key=8atYTEH8EhjYaHFNnkwe6udDw5MHyr4L"),
        headers: {'accept': 'application/json'});

    setState(() async {
      var content = await json.decode(ven.body);
      vendors = content['vendor'];

      print(vendors);
    });
    return 'success!';
  }

  void fetchOngkir() {
    //444 = Surabaya
    //501 = Yogyakarta
    futureOngkir = DonasiServices.fetchOngkir("444", "501", berat ?? "1000");
    futureCity = DonasiServices.fetchKota();
  }

  Future<Area> futureArea;
  @override
  void initState() {
    this.getData();
    this.getVendor();
    fetchOngkir();

    ctrlLokasi = TextEditingController(text: widget.alamatUser);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchOngkir();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Detail Donasi",
              style: TextStyle(
                color: HexColor("7A7ADC"),
              )),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: HexColor("7A7ADC"),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Stack(children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Tujuan
                    TextFormField(
                      initialValue: widget.alamatPanti,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.location_on, color: HexColor("7a7adc")),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    //Lokasi
                    // TextFormField(
                    //   controller: ctrlLokasi,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.home, color: HexColor("7a7adc")),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: HexColor("7a7adc")),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: HexColor("7a7adc")),
                    //     ),
                    //     border: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: HexColor("7a7adc")),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 10),

                    FutureBuilder<City>(
                      future: futureCity,
                      builder: (context, snapshot) {
                        print("Masok sini");
                        if (snapshot.hasData) {
                          print("Masok");
                          List data = snapshot.data.rajaongkir.results
                              .map((e) => "${e.cityName}")
                              .toList();
                          print(data);
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownSearch<dynamic>(
                                  mode: Mode.BOTTOM_SHEET,
                                  items: data,
                                  label: "Pilih Kota Anda",
                                  showClearButton: true,
                                  selectedItem: widget.origin,
                                  showSearchBox: true,
                                  popupBackgroundColor: HexColor("E7E7E7"),
                                  onChanged: (newValue) {
                                    setState(() {});
                                  },
                                  searchBoxDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("7a7adc")))),
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          // print(snapshot.error);
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    ),

                    // DropdownSearch<dynamic>(
                    //   mode: Mode.BOTTOM_SHEET,
                    //   items: data,
                    //   label: "Pilih Kota Anda",
                    //   onChanged: print,
                    //   showClearButton: true,
                    //   selectedItem: widget.origin,
                    //   showSearchBox: true,
                    //   popupBackgroundColor: HexColor("E7E7E7"),
                    //   searchBoxDecoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: HexColor("7a7adc")))),
                    // ),

                    SizedBox(height: 10),
                    //Kategori Barang
                    Text("Jenis Barang",
                        style: TextStyle(
                            color: HexColor("7a7adc"),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),

                    Container(
                      height:
                          double.parse(widget.kategori.length.toString()) * 22,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: widget.kategori.length,
                        itemBuilder: (context, index) {
                          return Row(children: [
                            Icon(
                              Icons.circle,
                              color: HexColor("7a7adc"),
                              size: 12,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(widget.kategori[index],
                                style: TextStyle(
                                  color: HexColor("7a7adc"),
                                  fontSize: 16,
                                ))
                          ]);
                        },
                      ),
                    ),

                    //Keterangan
                    Text(
                      "Keterangan",
                      style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),

                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: HexColor("7a7adc"))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: ctrlKeterangan,
                            maxLines: 4,
                            decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                hintText:
                                    "Pakaian anak - anak dan mainan bayi"),
                          ),
                        )),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: ctrlBerat,
                      enabled: active,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukkan Berat Barang (gram)",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.fitness_center,
                            color: HexColor("7a7adc")),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onEditingComplete: () {
                        setState(() {
                          if (ctrlBerat.text == "") {
                            berat = "0";
                          } else {
                            berat = ctrlBerat.text;
                          }
                          active = false;
                          FocusScope.of(context).unfocus();
                        });
                      },
                    ),

                    SizedBox(height: 10),

                    FutureBuilder<Ongkir>(
                      future: futureOngkir,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (active == false)
                                DropdownButton(
                                  hint: Text('Pilih Service JNE'),
                                  value: _selectedVendor,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedVendor = newValue;
                                      deliveryFee = int.parse(_selectedVendor);
                                    });
                                  },
                                  items: snapshot
                                      .data.rajaongkir.results[0].costs
                                      .map((e) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                          "${e.service} - ${e.cost[0].value}"),
                                      value: e.cost[0].value.toString(),
                                    );
                                  }).toList(),
                                ),
                              Text(
                                "Rp. ${deliveryFee ?? 0}",
                                style: TextStyle(
                                  color: HexColor("7a7adc"),
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              HexColor("7a7adc")),
                        );
                      },
                    ),

                    SizedBox(height: 15),

                    //Pembayaran
                    Text(
                      "Biaya Admin",
                      style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Rp. ${6000 ?? 0}",
                      style: TextStyle(
                        color: HexColor("7a7adc"),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Masukkan Nomor Telepon",
                      style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      controller: ctrlTelp,
                      decoration: InputDecoration(
                        hintText: "08123456789",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.phone_android,
                            color: HexColor("7a7adc")),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor("7a7adc")),
                        ),
                      ),
                      onEditingComplete: () {
                        setState(() {
                          if (ctrlTelp.text.length != 12) {
                            Fluttertoast.showToast(
                                msg: "Nomor Telepon Tidak Valid",
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG);
                          }
                        });
                      },
                    ),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                color: HexColor("7A7ADC"),
                onPressed: () async {
                  if (ctrlBerat.text.isEmpty ||
                      ctrlLokasi.text.isEmpty ||
                      ctrlKeterangan.text.isEmpty ||
                      ctrlTelp.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Pastikan semua sudah terisi",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else if (ctrlTelp.text.length != 12) {
                    Fluttertoast.showToast(
                        msg: "Nomor Telepon Tidak Valid",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else if (ctrlTelp.text.length != 12) {
                    Fluttertoast.showToast(
                        msg: "Nomor Telepon Tidak Valid",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else if (ctrlTelp.text == "081234567890") {
                    Fluttertoast.showToast(
                        msg: "Maaf, saldo Anda tidak mencukupi",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else {
                    Donasi donasi = Donasi(
                        "",
                        widget.pantiID,
                        widget.donaturID,
                        ctrlKeterangan.text,
                        ctrlLokasi.text,
                        widget.destination,
                        deliveryFee,
                        double.parse(ctrlBerat.text),
                        Timestamp.now(),
                        widget.kategori,
                        false,
                        "400010041369520");

                    bool result = await DonasiServices.addDonasi(donasi);
                    if (result == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PinScreen(deliveryFee: deliveryFee + 6000)));

                      setState(() {});
                    }
                  }
                },
                child: Text(
                  "Donasi Sekarang",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ]));
  }
}
