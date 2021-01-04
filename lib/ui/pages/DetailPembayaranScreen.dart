part of 'pages.dart';

class DetailPembayaranScreen extends StatefulWidget {
  final String origin, destination;
  final List<dynamic> kategori;
  DetailPembayaranScreen({this.origin, this.destination, this.kategori});
  @override
  _DetailPembayaranScreenState createState() => _DetailPembayaranScreenState();
}

class _DetailPembayaranScreenState extends State<DetailPembayaranScreen> {
  TextEditingController ctrlLokasi, ctrlKeterangan, ctrlBerat;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation;
  @override
  void dispose() {
    ctrlLokasi.dispose();
    ctrlKeterangan.dispose();
    ctrlBerat.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ctrlLokasi = TextEditingController(text: widget.origin);
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
                      initialValue: widget.destination,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.location_on, color: HexColor("7a7adc")),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

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

                    SizedBox(height: 20),

                    //Kategori Barang
                    Text("Jenis Barang",
                        style: TextStyle(
                            color: HexColor("7a7adc"),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
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

                    SizedBox(height: 10),

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

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ongkos Kirim via J&T",
                          style: TextStyle(
                              color: HexColor("7a7adc"),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
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
                  print("HAI");
                  if (ctrlBerat.text.isEmpty ||
                      ctrlLokasi.text.isEmpty ||
                      ctrlKeterangan.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Pastikan semua sudah terisi",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG);
                  } else {
                    Donasi donasi = Donasi(
                        "",
                        "pantiID",
                        "donaturID",
                        ctrlKeterangan.text,
                        ctrlLokasi.text,
                        widget.destination,
                        1000,
                        double.parse(ctrlBerat.text),
                        Timestamp.now(),
                        widget.kategori,
                        false);

                    bool result = await DonasiServices.addDonasi(donasi);
                    if (result == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainTabBar(index: 0)));
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
