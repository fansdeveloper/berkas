part of 'pages.dart';

class RIDetailDonasiScreen extends StatefulWidget {
  final Donasi donasi;
  RIDetailDonasiScreen({this.donasi});

  @override
  _RIDetailDonasiScreenState createState() => _RIDetailDonasiScreenState();
}

class _RIDetailDonasiScreenState extends State<RIDetailDonasiScreen> {
  Future<Resi> futureResi;
  String name, img;
  void getData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(this.widget.donasi.donaturID)
        .get()
        .then((value) {
      name = value.data()['name'];
      img = value.data()['imgUrl'];
    });
    if (mounted) {
      setState(() {});
    }
  }

  initState() {
    super.initState();
    futureResi = DonasiServices.fetchResi(this.widget.donasi.noResi);
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Pengirim Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                    child: Text(
                      "Pengirim",
                      style: TextStyle(
                        color: HexColor("7A7ADC"),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  //Pengirim detail (Database)
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(img ??
                            "https://miro.medium.com/max/6144/1*SN4G3KhX_foP7Yci023DJg.jpeg"),
                      ),
                      title: Text(name ?? "User"),
                      subtitle: Text(this.widget.donasi.lokasi ?? "Alamat"),
                    ),
                  ),
                  //Daftar Barang Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      "Daftar Barang",
                      style: TextStyle(
                        color: HexColor("7A7ADC"),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  //Keterangan daftar barang (Database)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor("7A7ADC")),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              this.widget.donasi.keterangan ?? "Keterangan"),
                        ),
                      ),
                    ),
                  ),
                  //Keterangan Kategori Barang (Database)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Container(
                      height: 50,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: this
                              .widget
                              .donasi
                              .kategori
                              .map((e) => KategoriContainer(kategori: e))
                              .toList()),
                    ),
                  ),
                  //Lacak Barang (Database)
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("BEBEEA"),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: FutureBuilder<Resi>(
                        future: futureResi,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LacakBarangScreen(
                                            resi: snapshot.data)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    //Lacak Barang Text
                                    Text(
                                      "Lacak Barang",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      snapshot.data.data.history.first.desc,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          // By default, show a loading spinner.
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //Lacak Barang Text
                                Text(
                                  "Lacak Barang",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //Tombol Konfirmasi
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: HexColor("7A7ADC"),
                        onPressed: () async {
                          bool result = await DonasiServices.konfirmasiDonasi(
                              this.widget.donasi);
                          if (result == true) {
                            Fluttertoast.showToast(
                                msg: "Konfirmasi Berhasil",
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG);
                            // setState(() {
                            //   isLoading = false;
                            // });
                            Navigator.pop(context);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Gagal Konfirmasi",
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG);
                            // setState(() {
                            //   isLoading = false;
                            // });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "Konfirmasi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
