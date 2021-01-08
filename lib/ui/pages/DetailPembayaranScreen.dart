part of 'pages.dart';

class DetailPembayaranScreen extends StatefulWidget {
  final String donaturID, pantiID, alamatUser, alamatPanti, origin, destination;
  final List<dynamic> kategori;
  DetailPembayaranScreen(
      {this.origin,
      this.donaturID,
      this.pantiID,
      this.alamatUser,
      this.alamatPanti,
      this.destination,
      this.kategori});
  @override
  _DetailPembayaranScreenState createState() => _DetailPembayaranScreenState();
}

class _DetailPembayaranScreenState extends State<DetailPembayaranScreen> {
  var ctrlLokasi = TextEditingController();
  var ctrlKeterangan = TextEditingController();
  var ctrlBerat = TextEditingController();
  var ctrlTelp = TextEditingController();
  String _selectedVendor; // Option 2
  String _selectedCity; // Option 2
  @override
  void dispose() {
    ctrlLokasi.dispose();
    ctrlKeterangan.dispose();
    ctrlBerat.dispose();
    super.dispose();
  }

  final String area =
      'http://paket.id/apis/v2/area/full?auth-user-email=thefansdeveloper@gmail.com&auth-api-key=8atYTEH8EhjYaHFNnkwe6udDw5MHyr4L';

  final String vendor =
      "http://paket.id/apis/v2/vendor?auth-user-email=thefansdeveloper@gmail.com&auth-api-key=8atYTEH8EhjYaHFNnkwe6udDw5MHyr4L";

  final String tarif =
      "http://paket.id/apis/v2/tariff/jne/Jakarta/Surabaya/1?auth-user-email=thefansdeveloper@gmail.com&auth-api-key=8atYTEH8EhjYaHFNnkwe6udDw5MHyr4L";

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
      print(data);
    });
    return 'success!';
  }

  Future<String> getVendor() async {
    var ven = await http
        .get(Uri.encodeFull(vendor), headers: {'accept': 'application/json'});

    setState(() async {
      var content = await json.decode(ven.body);
      vendors = content['vendor'];
    });
    return 'success!';
  }

  Future<Area> fetchArea() async {
    final response = await http.get(area);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonresponse = jsonDecode(response.body);
      return Area.fromJson(jsonresponse[0]);
    } else {
      throw Exception('Failed to load area');
    }
  }

  // void fetchOngkir() {
  //   futureOngkir =
  //       DonasiServices.fetchOngkir("444", "299", ctrlBerat.text ?? 0);
  // }

  // Future<City> fetchCity() async {
  //   String url = "https://api.rajaongkir.com/starter/city?province=11";
  //   Map<String, String> headers = {
  //     "key": "b9f5d86e3f93058d2ae6dabf53641d34",
  //   };
  //   http.Response response = await http.get(url, headers: headers);

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     return City.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     print(City.fromJson(jsonDecode(response.body)));
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<Area> futureArea;
  @override
  void initState() {
    super.initState();
    this.getData();
    this.getVendor();
    futureArea = fetchArea();
    // futureCity = fetchCity();
    // fetchOngkir();
    ctrlLokasi = TextEditingController(text: widget.alamatUser);
  }

  @override
  Widget build(BuildContext context) {
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
                    TextFormField(
                      controller: ctrlLokasi,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home, color: HexColor("7a7adc")),
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
                    ),

                    SizedBox(height: 10),

                    DropdownSearch<dynamic>(
                      mode: Mode.BOTTOM_SHEET,
                      items: data,
                      label: "Pilih Kota Anda",
                      onChanged: print,
                      showClearButton: true,
                      selectedItem: widget.origin,
                      showSearchBox: true,
                      popupBackgroundColor: HexColor("E7E7E7"),
                      searchBoxDecoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("7a7adc")))),
                    ),

                    // //Punya feli
                    // FutureBuilder<City>(
                    //   future: futureCity,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Container(
                    //         width: 300,
                    //         height: 300,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             TextFormField(
                    //               controller: ctrlLokasi,
                    //               decoration: InputDecoration(
                    //                 prefixIcon: Icon(Icons.home,
                    //                     color: HexColor("7a7adc")),
                    //                 enabledBorder: UnderlineInputBorder(
                    //                   borderSide:
                    //                       BorderSide(color: HexColor("7a7adc")),
                    //                 ),
                    //                 focusedBorder: UnderlineInputBorder(
                    //                   borderSide:
                    //                       BorderSide(color: HexColor("7a7adc")),
                    //                 ),
                    //                 border: UnderlineInputBorder(
                    //                   borderSide:
                    //                       BorderSide(color: HexColor("7a7adc")),
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(height: 10),
                    //             DropdownSearch<dynamic>(
                    //               mode: Mode.BOTTOM_SHEET,
                    //               items: snapshot.data.rajaongkir.results
                    //                   .map((e) => "${e.cityName} - ${e.cityId}")
                    //                   .toList(),
                    //               label: "Pilih Kota Anda",
                    //               onChanged: print,
                    //               showClearButton: true,
                    //               selectedItem: _selectedCity,
                    //               showSearchBox: true,
                    //               popupBackgroundColor: HexColor("E7E7E7"),
                    //               searchBoxDecoration: InputDecoration(
                    //                   border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: HexColor("7a7adc")))),
                    //             ),
                    //             SizedBox(height: 10),
                    //           ],
                    //         ),
                    //       );
                    //     } else if (snapshot.hasError) {
                    //       // print(snapshot.error);
                    //       return Text("${snapshot.error}");
                    //     }

                    //     // By default, show a loading spinner.
                    //     return CircularProgressIndicator();
                    //   },
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
                      decoration: InputDecoration(
                        hintText: "Masukkan Berat Barang (kg)",
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
                      ),
                    ),

                    SizedBox(height: 10),

                    //
                    //API Cek Ongkir
                    //
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 10),
                    //   child: Container(
                    //       height: 40,
                    //       width: double.infinity,
                    //       child: SingleChildScrollView(
                    //         child: FutureBuilder<Area>(
                    //           future: futureArea,
                    //           builder: (context, snapshot) {
                    //             if (snapshot.hasData) {
                    //               return Text(snapshot.data.area);
                    //             } else if (snapshot.hasError) {
                    //               return Text("${snapshot.error}");
                    //             }
                    //             return CircularProgressIndicator();
                    //           },
                    //         ),
                    //       )),
                    // ),

                    // Angle Punya
                    Text(
                      "Jasa Pengiriman",
                      style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton(
                          hint:
                              Text('Pilih Kurir'), // Not necessary for Option 1
                          value: _selectedVendor,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedVendor = newValue;
                            });
                          },
                          items: vendors.map((v) {
                            return DropdownMenuItem(
                              child: new Text(v),
                              value: v,
                            );
                          }).toList(),
                        ),
                        Text(
                          "Rp. 7000",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),

                    // // Feli punya
                    // FutureBuilder<Ongkir>(
                    //   future: futureOngkir,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           DropdownButton(
                    //             hint: Text(
                    //                 'Pilih Service JNE'), // Not necessary for Option 1
                    //             value: _selectedVendor,
                    //             onChanged: (newValue) {
                    //               setState(() {
                    //                 _selectedVendor = newValue;
                    //               });
                    //             },
                    //             items: snapshot.data.rajaongkir.results[0].costs
                    //                 .map((e) {
                    //               return DropdownMenuItem(
                    //                 child: new Text(
                    //                     "${e.service} - ${e.cost[0].value}"),
                    //                 value: e.cost[0].value.toString(),
                    //               );
                    //             }).toList(),
                    //           ),
                    //           Text(
                    //             "Rp. ${_selectedVendor ?? 0}",
                    //             style: TextStyle(
                    //               color: HexColor("7a7adc"),
                    //               fontSize: 18,
                    //             ),
                    //             textAlign: TextAlign.left,
                    //           ),
                    //         ],
                    //       );
                    //     } else if (snapshot.hasError) {
                    //       return Text("${snapshot.error}");
                    //     }

                    //     // By default, show a loading spinner.
                    //     return CircularProgressIndicator();
                    //   },
                    // ),

                    SizedBox(height: 15),

                    //Pembayaran
                    Text(
                      "Pembayaran dengan OVO",
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
                    ),
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
                      ctrlKeterangan.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Pastikan semua sudah terisi",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else {
                    if (ctrlTelp.text == "081234567890") {
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
                          1000,
                          double.parse(ctrlBerat.text),
                          Timestamp.now(),
                          widget.kategori,
                          false,
                          "400010041369520");

                      bool result = await DonasiServices.addDonasi(donasi);
                      if (result == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainTabBar(index: 0)));
                        setState(() {});
                      }
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
