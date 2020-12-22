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
                        Text(
                          "Daftar Kebutuhan",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: HexColor("7A7ADC")),
                        ),
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
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Statistik Donasi",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, color: HexColor("7a7adc")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text("hai"),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text("hai"),
                          ),
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
