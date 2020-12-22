part of 'pages.dart';

class HomeScreenDonatur extends StatefulWidget {
  @override
  _HomeScreenDonaturState createState() => _HomeScreenDonaturState();
}

class _HomeScreenDonaturState extends State<HomeScreenDonatur> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 15.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Saudara yang baru tergabung",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: HexColor("7A7ADC"),
                      )),
                ),
                Column(
                  children: [
                    PantiCard(
                      namaPanti: "Coba",
                      img:
                          "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
                      category: ["Mainan", "Alat Tulis", "Sembako"],
                    ),
                    PantiCard(
                      namaPanti: "Coba",
                      img:
                          "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
                      category: ["Buku", "Perlengkapan Sekolah", "Pakaian"],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Pilih Kategori Barang",
                      style: TextStyle(
                        fontSize: 22,
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
