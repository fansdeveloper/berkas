part of 'pages.dart';

class RIDetailDonasiScreen extends StatefulWidget {
  final Donasi donasi;
  RIDetailDonasiScreen({this.donasi});

  @override
  _RIDetailDonasiScreenState createState() => _RIDetailDonasiScreenState();
}

class _RIDetailDonasiScreenState extends State<RIDetailDonasiScreen> {
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
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/max/6144/1*SN4G3KhX_foP7Yci023DJg.jpeg"),
                      ),
                      title: Text("User"),
                      subtitle: Text("Alamat"),
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
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor("7A7ADC")),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              "Seragam SD, baju anak, buku tulis, mainan bayi layak pakai"),
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
                        children: [
                          KategoriContainer(
                            kategori: "Pakaian",
                          ),
                          KategoriContainer(
                            kategori: "Mainan Bayi",
                          ),
                          KategoriContainer(
                            kategori: "Alat Tulis",
                          ),
                          KategoriContainer(
                            kategori: "Lain-lain",
                          ),
                        ],
                      ),
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
                      child: Padding(
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
                            Text(
                              "[SURABAYA] Paket akan dikirim ke alamat penerima",
                            )
                          ],
                        ),
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
                        onPressed: () {},
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
