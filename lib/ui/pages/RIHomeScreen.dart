part of 'pages.dart';

class RIHomeScreen extends StatefulWidget {
  @override
  _RIHomeScreenState createState() => _RIHomeScreenState();
}

class _RIHomeScreenState extends State<RIHomeScreen> {
  var id = FirebaseAuth.instance.currentUser.uid;
  int donasiBaru, donasiSelesai;

  List<dynamic> kategori;

  bool s1 = false,
      s2 = false,
      s3 = false,
      s4 = false,
      s5 = false,
      s6 = false,
      s7 = false,
      s8 = false,
      s9 = false;

  FirebaseMessaging fm = FirebaseMessaging();
  _RIHomeScreenState() {
    fm.getToken().then((value) => print('token: $value'));
    fm.configure(
      onMessage: //app is bein used (foreground)
          (Map<String, dynamic> msg) async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    content: Container(
                      width: 160.0,
                      height: 130.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xFFFFFF),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(32.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(msg['notification']['title'],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("7A7ADC"))),
                          Text(msg['notification']['body'],
                              style: TextStyle(
                                  fontSize: 18, color: HexColor("7A7ADC"))),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                          color: HexColor("7A7ADC"),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "ok",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ))
                    ]));
      },
      onResume: //app is in background
          (Map<String, dynamic> msg) async {
        print('Notification : $msg');
      },
      onLaunch: //app isnt used at all
          (Map<String, dynamic> msg) async {
        print('Notification : $msg');
      }, //
    );
  }

  //Ambil data buat Statistik
  void getData() async {
    var donationCollection = FirebaseFirestore.instance
        .collection("donations")
        .where('pantiID', isEqualTo: id);

    await donationCollection
        .where('isConfirmed', isEqualTo: false)
        .get()
        .then((value) => donasiBaru = value.size);

    await donationCollection
        .where('isConfirmed', isEqualTo: true)
        .get()
        .then((value) => donasiSelesai = value.size);
    if (mounted) {
      setState(() {});
    }
  }

  DocumentSnapshot snapshot;

  void getPanti() async {
    final data = await FirebaseFirestore.instance
        .collection("panti")
        .doc(id)
        .get(); //get the data
    snapshot = data;
    kategori = await snapshot.data()['neededGoods'];

    if (kategori.contains("Alat Tulis")) {
      s1 = true;
    }
    if (kategori.contains("Mainan")) {
      s2 = true;
    }
    if (kategori.contains("Pakaian")) {
      s3 = true;
    }
    if (kategori.contains("Buku")) {
      s4 = true;
    }
    if (kategori.contains("Perlengkapan Kesehatan")) {
      s5 = true;
    }
    if (kategori.contains("Perlengkapan Sekolah")) {
      s6 = true;
    }
    if (kategori.contains("Perlengkapan Bayi")) {
      s7 = true;
    }
    if (kategori.contains("Sembako")) {
      s8 = true;
    }
    if (kategori.contains("Lainnya")) {
      s9 = true;
    }
    if (mounted) {
      setState(() {});
    }
  }

  void initState() {
    super.initState();
    getPanti();
  }

  @override
  Widget build(BuildContext context) {
    //Ambil data
    getData();
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
                                color: HexColor("7A7ADC"),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        if (s1 == false &&
                            s2 == false &&
                            s3 == false &&
                            s4 == false &&
                            s5 == false &&
                            s6 == false &&
                            s7 == false &&
                            s8 == false &&
                            s9 == false)
                          Align(
                            alignment: Alignment.center,
                            child: Text("Maaf, Kebutuhan Belum Diatur",
                                style: TextStyle(
                                    color: HexColor("7A7ADC"),
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal)),
                          ),
                        Container(
                            height: 250,
                            child: GridView.count(crossAxisCount: 3, children: [
                              if (s1)
                                CategoryGrid(
                                  title: "Alat Tulis",
                                  img: "assets/category/putih/1.png",
                                ),
                              if (s2)
                                CategoryGrid(
                                  title: "Mainan",
                                  img: "assets/category/putih/2.png",
                                ),
                              if (s3)
                                CategoryGrid(
                                  title: "Pakaian",
                                  img: "assets/category/putih/3.png",
                                ),
                              if (s4)
                                CategoryGrid(
                                  title: "Buku",
                                  img: "assets/category/putih/4.png",
                                ),
                              if (s5)
                                CategoryGrid(
                                  title: "Perlengkapan Kesehatan",
                                  img: "assets/category/putih/5.png",
                                ),
                              if (s6)
                                CategoryGrid(
                                  title: "Perlengkapan Sekolah",
                                  img: "assets/category/putih/6.png",
                                ),
                              if (s7)
                                CategoryGrid(
                                  title: "Perlengkapan Bayi",
                                  img: "assets/category/putih/7.png",
                                ),
                              if (s8)
                                CategoryGrid(
                                  title: "Sembako",
                                  img: "assets/category/putih/8.png",
                                ),
                              if (s9)
                                CategoryGrid(
                                  title: "Lainnya",
                                  img: "assets/category/putih/9.png",
                                ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RIEditGoodsNeeded(
                                                  kategori: kategori)));
                                },
                                child: Container(
                                  child: Card(
                                    elevation: 0,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image(
                                            image: AssetImage(
                                                "assets/category/putih/edit.png"),
                                          ),
                                          height: 70,
                                          width: 70,
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
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("7a7adc")),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]))
                      ],
                    ),
                  ),
                )),

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
                  Text("Statistik Donasi",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: HexColor("7a7adc"),
                        fontWeight: FontWeight.bold,
                      )),
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
                                      donasiBaru.toString() ?? "0",
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RIDonasiSelesaiScreen()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      donasiSelesai.toString() ?? "0",
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
                height: 20,
              ),
              height: 62,
              width: 70,
              decoration: BoxDecoration(
                  color: HexColor("7a7adc"),
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: HexColor(
                    "7a7adc",
                  )),
            )
          ],
        ),
      ),
    );
  }
}
