part of 'pages.dart';

class DetailPembayaranScreen extends StatefulWidget {
  final String name, img;
  DetailPembayaranScreen({this.name, this.img});
  @override
  _DetailPembayaranScreenState createState() => _DetailPembayaranScreenState();
}

class _DetailPembayaranScreenState extends State<DetailPembayaranScreen> {
  @override
  Widget build(BuildContext context) {
    List kategori = ["Pakaian", "Mainan"];
    String _bayar;

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
                    //Lokasi
                    TextFormField(
                      initialValue: "Babatan Pilang GG22",
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.location_on, color: HexColor("7a7adc")),
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
                    SizedBox(height: 5),
                    //Tujuan
                    TextFormField(
                      initialValue: "Jl. Babatan Sari Apple no 89",
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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: ListView(
                          children: [
                            Row(children: [
                              Icon(
                                Icons.circle,
                                color: HexColor("7a7adc"),
                                size: 10,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(kategori[0],
                                  style: TextStyle(
                                    color: HexColor("7a7adc"),
                                  ))
                            ]),
                            Row(children: [
                              Icon(
                                Icons.circle,
                                color: HexColor("7a7adc"),
                                size: 10,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(kategori[1],
                                  style: TextStyle(
                                    color: HexColor("7a7adc"),
                                  ))
                            ]),
                            FlatButton(
                                onPressed: () {},
                                child: Row(children: [
                                  Icon(
                                    Icons.add,
                                    color: HexColor("7a7adc"),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Tambah Kategori Baru",
                                      style: TextStyle(
                                        color: HexColor("7a7adc"),
                                      )),
                                ]))
                          ],
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
                            maxLines: 4,
                            decoration: InputDecoration.collapsed(
                                hintText: "Enter your text here"),
                          ),
                        )),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Berat",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "3 kg",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ongkos Kirim",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Rp. 7000",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total : ",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Rp. 21000",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Cara Bayar",
                      style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    //Keterangan Kategori Barang (Database)
                    DropdownButton<String>(
                        style: TextStyle(
                          color: HexColor("7a7adc"),
                          fontSize: 16,
                        ),
                        isExpanded: true,
                        iconEnabledColor: HexColor("7a7adc"),
                        hint: Text(
                          "Cara Bayar",
                          style: TextStyle(
                            color: HexColor("7a7adc"),
                          ),
                        ),
                        value: _bayar,
                        items: ["OVO", "COD"].map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (e) {
                          setState(() {
                            _bayar = e;
                          });
                        })
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
              color: HexColor("7A7ADC"),
              child: RaisedButton(
                onPressed: null,
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
