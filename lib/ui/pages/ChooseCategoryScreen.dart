part of 'pages.dart';

class ChooseCategoryScreen extends StatefulWidget {
  @override
  _ChooseCategoryScreenState createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  bool s1 = false,
      s2 = false,
      s3 = false,
      s4 = false,
      s5 = false,
      s6 = false,
      s7 = false,
      s8 = false,
      s9 = false;
  List<String> kategori = List<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Pilih Kategori Barang",
            style: TextStyle(color: HexColor("7A7ADC")),
          ),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: HexColor("7A7ADC"),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20, left: 8, right: 8),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 5,
                  primary: false,
                  children: [
                    //categories grid
                    GestureDetector(
                      onTap: () {
                        s1 = !s1;
                        setState(() {
                          if (s1) {
                            kategori.add("Alat Tulis");
                          } else {
                            kategori.remove("Alat Tulis");
                          }
                          s1
                              ? SelectedCategory(
                                  title: "Alat Tulis",
                                  img: "assets/category/putih/1.png",
                                )
                              : CategoryCard(
                                  title: "Alat Tulis",
                                  img: "assets/category/ungu/1.png",
                                );
                        });
                      },
                      child: s1
                          ? SelectedCategory(
                              title: "Alat Tulis",
                              img: "assets/category/putih/1.png",
                            )
                          : CategoryCard(
                              title: "Alat Tulis",
                              img: "assets/category/ungu/1.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s2 = !s2;
                        setState(() {
                          if (s2) {
                            kategori.add("Mainan");
                          } else {
                            kategori.remove("Mainan");
                          }
                          s2
                              ? SelectedCategory(
                                  title: "Mainan",
                                  img: "assets/category/putih/2.png",
                                )
                              : CategoryCard(
                                  title: "Mainan",
                                  img: "assets/category/ungu/2.png",
                                );
                        });
                      },
                      child: s2
                          ? SelectedCategory(
                              title: "Mainan",
                              img: "assets/category/putih/2.png",
                            )
                          : CategoryCard(
                              title: "Mainan",
                              img: "assets/category/ungu/2.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s3 = !s3;
                        setState(() {
                          if (s3) {
                            kategori.add("Pakaian");
                          } else {
                            kategori.remove("Pakaian");
                          }
                          s3
                              ? SelectedCategory(
                                  title: "Pakaian",
                                  img: "assets/category/putih/3.png",
                                )
                              : CategoryCard(
                                  title: "Pakaian",
                                  img: "assets/category/ungu/3.png",
                                );
                        });
                      },
                      child: s3
                          ? SelectedCategory(
                              title: "Pakaian",
                              img: "assets/category/putih/3.png",
                            )
                          : CategoryCard(
                              title: "Pakaian",
                              img: "assets/category/ungu/3.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s4 = !s4;
                        setState(() {
                          if (s4) {
                            kategori.add("Buku");
                          } else {
                            kategori.remove("Buku");
                          }
                          s4
                              ? SelectedCategory(
                                  title: "Buku",
                                  img: "assets/category/putih/4.png",
                                )
                              : CategoryCard(
                                  title: "Buku",
                                  img: "assets/category/ungu/4.png",
                                );
                        });
                      },
                      child: s4
                          ? SelectedCategory(
                              title: "Buku",
                              img: "assets/category/putih/4.png",
                            )
                          : CategoryCard(
                              title: "Buku",
                              img: "assets/category/ungu/4.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s5 = !s5;
                        setState(() {
                          if (s5) {
                            kategori.add("Perlengkapan Kesehatan");
                          } else {
                            kategori.remove("Perlengkapan Kesehatan");
                          }
                          s5
                              ? SelectedCategory(
                                  title: "Perlengkapan Kesehatan",
                                  img: "assets/category/putih/5.png",
                                )
                              : CategoryCard(
                                  title: "Perlengkapan Kesehatan",
                                  img: "assets/category/ungu/5.png",
                                );
                        });
                      },
                      child: s5
                          ? SelectedCategory(
                              title: "Perlengkapan Kesehatan",
                              img: "assets/category/putih/5.png",
                            )
                          : CategoryCard(
                              title: "Perlengkapan Kesehatan",
                              img: "assets/category/ungu/5.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s6 = !s6;
                        setState(() {
                          if (s6) {
                            kategori.add("Perlengkapan Sekolah");
                          } else {
                            kategori.remove("Perlengkapan Sekolah");
                          }
                          s6
                              ? SelectedCategory(
                                  title: "Perlengkapan Sekolah",
                                  img: "assets/category/putih/6.png",
                                )
                              : CategoryCard(
                                  title: "Perlengkapan Sekolah",
                                  img: "assets/category/ungu/6.png",
                                );
                        });
                      },
                      child: s6
                          ? SelectedCategory(
                              title: "Perlengkapan Sekolah",
                              img: "assets/category/putih/6.png",
                            )
                          : CategoryCard(
                              title: "Perlengkapan Sekolah",
                              img: "assets/category/ungu/6.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s7 = !s7;
                        setState(() {
                          if (s7) {
                            kategori.add("Perlengkapan Bayi");
                          } else {
                            kategori.remove("Perlengkapan Bayi");
                          }
                          s7
                              ? SelectedCategory(
                                  title: "Perlengkapan Bayi",
                                  img: "assets/category/putih/7.png",
                                )
                              : CategoryCard(
                                  title: "Perlengkapan Bayi",
                                  img: "assets/category/ungu/7.png",
                                );
                        });
                      },
                      child: s7
                          ? SelectedCategory(
                              title: "Perlengkapan Bayi",
                              img: "assets/category/putih/7.png",
                            )
                          : CategoryCard(
                              title: "Perlengkapan Bayi",
                              img: "assets/category/ungu/7.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s8 = !s8;
                        setState(() {
                          if (s8) {
                            kategori.add("Sembako");
                          } else {
                            kategori.remove("Sembako");
                          }
                          s8
                              ? SelectedCategory(
                                  title: "Sembako",
                                  img: "assets/category/putih/8.png",
                                )
                              : CategoryCard(
                                  title: "Sembako",
                                  img: "assets/category/ungu/8.png",
                                );
                        });
                      },
                      child: s8
                          ? SelectedCategory(
                              title: "Sembako",
                              img: "assets/category/putih/8.png",
                            )
                          : CategoryCard(
                              title: "Sembako",
                              img: "assets/category/ungu/8.png",
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        s9 = !s9;
                        setState(() {
                          if (s9) {
                            kategori.add("Lainnya");
                          } else {
                            kategori.remove("Lainnya");
                          }
                          s9
                              ? SelectedCategory(
                                  title: "Lainnya",
                                  img: "assets/category/putih/9.png",
                                )
                              : CategoryCard(
                                  title: "Lainnya",
                                  img: "assets/category/ungu/9.png",
                                );
                        });
                      },
                      child: s9
                          ? SelectedCategory(
                              title: "Lainnya",
                              img: "assets/category/putih/9.png",
                            )
                          : CategoryCard(
                              title: "Lainnya",
                              img: "assets/category/ungu/9.png",
                            ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  color: HexColor("7A7ADC"),
                  onPressed: () {
                    print(kategori);

                    if (kategori.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChooseRIScreen(kategori: kategori)));
                    } else {
                      Fluttertoast.showToast(
                        msg: "Pilih setidaknya satu kategori yang tersedia",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      setState(() {});
                    }
                  },
                  child: Text(
                    "Selanjutnya >",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, wordSpacing: 5),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String img;
  const CategoryCard({Key key, this.title, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("E7E7E7"),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Image(
            image: AssetImage(img),
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: HexColor("7A7ADC")),
            ),
          )
        ],
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String title;

  final String img;
  const SelectedCategory({Key key, this.title, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("7A7ADC"),
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: HexColor("E7E7E7"), width: 5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Image(
            image: AssetImage(img),
            height: 40,
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
          )
        ],
      ),
    );
  }
}
