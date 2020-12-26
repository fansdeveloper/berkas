part of 'pages.dart';

class RIHomeScreen extends StatefulWidget {
  @override
  _RIHomeScreenState createState() => _RIHomeScreenState();
}

class _RIHomeScreenState extends State<RIHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dashboard"),
          backgroundColor: HexColor("7A7ADC"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/berkas 2.png'),
          ),
        ),
        body: Container(
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
                                              "assets/category/putih/edit.png"),
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
                                        "Ubah",
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
              height: 20,
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
                    "Statistik Donasi",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: HexColor("7a7adc")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 150,
                              width: double.infinity,
                              // Donasi Baru -> Donasi Baru
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RIDonasiBaruScreen()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: HexColor("7a7adc")),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Donasi Baru",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor("7a7adc")))
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 150,
                              width: double.infinity,
                              // Donasi Selesai -> Riwayat
                              child: FlatButton(
                                onPressed: () {
                                  print("Ke History");
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "14",
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: HexColor("7a7adc")),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Donasi Selesai",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor("7a7adc")))
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class CategoryGrid extends StatelessWidget {
  final String title;
  final String img;
  const CategoryGrid({Key key, this.title, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage(img),
              ),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: HexColor("7a7adc"),
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(color: HexColor("7a7adc")),
            )
          ],
        ),
      ),
    );
  }
}
