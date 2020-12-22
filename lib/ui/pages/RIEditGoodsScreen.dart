part of 'pages.dart';

class RIEditGoodsScreen extends StatefulWidget {
  @override
  _RIEditGoodsScreenState createState() => _RIEditGoodsScreenState();
}

class _RIEditGoodsScreenState extends State<RIEditGoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edit Kebutuhan",
          style: TextStyle(color: HexColor("7A7ADC")),
        ),
        centerTitle: true,
        backgroundColor: HexColor("E7E7E7"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HexColor("7A7ADC")),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(color: HexColor("E7E7E7")),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 330,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Daftar Kebutuhan",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("7A7ADC"), fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 250,
                            child: GridView.count(crossAxisCount: 3, children: [
                              CategoryGrid(
                                title: "Alat Tulis",
                                img: "assets/category/putih/1.png",
                              ),
                              CategoryGrid(
                                title: "Mainan",
                                img: "assets/category/putih/2.png",
                              ),
                              CategoryGrid(
                                title: "Pakaian",
                                img: "assets/category/putih/3.png",
                              ),
                              CategoryGrid(
                                title: "Sembako",
                                img: "assets/category/putih/8.png",
                              ),
                              Container(
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/category/putih/add.png"),
                                        ),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: HexColor("bebeea"),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tambah",
                                        style: TextStyle(
                                            color: HexColor("7a7adc")),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]))
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            //
            //
            //
            //
            //
            //
            //STATISTIK DONASI
            //
            //
            //
            //
            //
            Padding(
              padding: EdgeInsets.only(left: 30, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keterangan",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: HexColor("7a7adc")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    child: TextFormField(
                      initialValue:
                          "Pakaian anak-anak, buku tulis kosong, panci, kompor",
                      decoration: InputDecoration(
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
                  ),
                ],
              ),
            ),
          ]),
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
                "Simpan Perubahan",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
