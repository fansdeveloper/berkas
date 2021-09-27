part of 'pages.dart';

class HomeScreenDonatur extends StatefulWidget {
  @override
  _HomeScreenDonaturState createState() => _HomeScreenDonaturState();
}

class _HomeScreenDonaturState extends State<HomeScreenDonatur> {
  List<String> pantiList = [];
  var list;
  var a, p1, p2, p3;
  String name1, name2, name3, profile1, profile2, profile3;
  List<dynamic> kategori1, kategori2, kategori3;

  DocumentSnapshot snapshot1, snapshot2, snapshot3;
  FirebaseMessaging fm = FirebaseMessaging();
  _HomeScreenDonaturState() {
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

  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("panti").get();

    Set<int> l = Set();
    while (l.length < 3) {
      l.add(Random().nextInt(querySnapshot.docs.length));
    }
    var list = l.toList();
    for (int i = 0; i < 3; i++) {
      a = querySnapshot.docs[list[i]];

      pantiList.add(a.id);
      print("pantiList $pantiList");
      // print(a.id);
    }

    p1 = await FirebaseFirestore.instance
        .collection("panti")
        .doc(pantiList[0])
        .get();
    snapshot1 = await p1;
    kategori1 = await snapshot1.data()['neededGoods'];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(pantiList[0])
        .get()
        .then((value) {
      name1 = value.data()['name'];
      profile1 = value.data()['profilePicture'];
    });

    p2 = await FirebaseFirestore.instance
        .collection("panti")
        .doc(pantiList[1])
        .get();
    snapshot2 = await p2;
    kategori2 = await snapshot2.data()['neededGoods'];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(pantiList[1])
        .get()
        .then((value) {
      name2 = value.data()['name'];
      profile2 = value.data()['profilePicture'];
    });

    p3 = await FirebaseFirestore.instance
        .collection("panti")
        .doc(pantiList[2])
        .get();
    snapshot3 = await p3;
    kategori3 = await snapshot3.data()['neededGoods'];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(pantiList[2])
        .get()
        .then((value) {
      name3 = value.data()['name'];
      profile3 = value.data()['profilePicture'];
    });

    if (mounted) {
      setState(() {});
    }
  }

  void initState() {
    super.initState();
    getDocs();
  }

  @override
  Widget build(BuildContext context) {
    if (profile1 == "") {
      profile1 = "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png";
    }
    if (profile2 == "") {
      profile2 = "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png";
    }
    if (profile3 == "") {
      profile3 = "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png";
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Donasi"),
          backgroundColor: HexColor("7A7ADC"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/berkas 2.png'),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                // Container(
                //   height: 60,
                //   margin: EdgeInsets.fromLTRB(45, 0, 40, 5),
                //   decoration: new BoxDecoration(
                //       color: HexColor(
                //           "BEBEEA"), //new Color.fromRGBO(255, 0, 0, 0.0),
                //       borderRadius: new BorderRadius.only(
                //         bottomLeft: const Radius.circular(40.0),
                //         bottomRight: const Radius.circular(40.0),
                //       )),
                //   child: Row(
                //     children: [
                //       Container(
                //           margin: EdgeInsets.fromLTRB(55, 0, 10, 5),
                //           child: Row(
                //             children: [
                //               Text("Rp 150,000",
                //                   style: TextStyle(
                //                       fontSize: 22,
                //                       fontWeight: FontWeight.bold)),
                //               RawMaterialButton(
                //                 onPressed: () {},
                //                 fillColor: HexColor("7A7ADC"),
                //                 child: Icon(
                //                   Icons.add,
                //                   color: Colors.white,
                //                 ),
                //                 shape: CircleBorder(),
                //               )
                //             ],
                //           )),
                //     ],
                //   ),
                // ),
                SizedBox(height: 5),

                //main slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 170,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s1.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Tunggu apa lagi?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Donasikan barangmu bagi saudara kita!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s2.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Perjalanan hidup yang indah adalah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Ketika kita mampu berbagi, bukan menikmatinya sendiri",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s3.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hidup ini Indah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Seindah saat kita dapat berbagi dengan sesama",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text("Saudara yang baru tergabung",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: HexColor("7A7ADC"),
                      )),
                ),

                //random 3 panti
                Container(
                  height: 135,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PantiCard(
                        namaPanti: name1 ?? "Panti",
                        img: profile1 ??
                            "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png",
                        category: kategori1 ?? ["Category"],
                        onClick: false,
                      ),
                      PantiCard(
                        namaPanti: name2 ?? "Panti",
                        img: profile2 ??
                            "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png",
                        category: kategori2 ?? ["Category"],
                        onClick: false,
                      ),
                      PantiCard(
                        namaPanti: name3 ?? "Panti",
                        img: profile3 ??
                            "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png",
                        category: kategori3 ?? ["Category"],
                        onClick: false,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                //categories
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text("Pilih Kategori Barang",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: HexColor("7A7ADC"),
                      )),
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      primary: false,
                      children: [
                        CategoryCardMain(
                          title: "Alat Tulis",
                          img: "assets/category/putih/1.png",
                        ),
                        CategoryCardMain(
                          title: "Mainan",
                          img: "assets/category/putih/2.png",
                        ),
                        CategoryCardMain(
                          title: "Pakaian",
                          img: "assets/category/putih/3.png",
                        ),
                        CategoryCardMain(
                          title: "Lainnya",
                          img: "assets/category/putih/9.png",
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}

class CategoryCardMain extends StatelessWidget {
  final String title;
  final String img;
  const CategoryCardMain({Key key, this.title, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChooseCategoryScreen()));
      },
      child: Card(
        color: HexColor("7A7ADC"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Image(
              image: AssetImage(img),
              height: 35,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: HexColor("E7E7E7")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
