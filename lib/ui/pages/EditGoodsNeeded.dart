part of 'pages.dart';

class EditGoodsNeeded extends StatefulWidget {
  @override
  _EditGoodsNeededState createState() => _EditGoodsNeededState();
}

class _EditGoodsNeededState extends State<EditGoodsNeeded> {
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
            "Edit Kebutuhan Panti",
            style: TextStyle(color: HexColor("7A7ADC")),
          ),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: HexColor("7A7ADC"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RIHomeScreen()));
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
                    GestureDetector(
                      onTap: () {
                        s1 = !s1;
                        setState(() {
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
                          s8
                              ? SelectedCategory(
                                  title: "Perlengkapan Bayi",
                                  img: "assets/category/putih/8.png",
                                )
                              : CategoryCard(
                                  title: "Perlengkapan Bayi",
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
                          s9
                              ? SelectedCategory(
                                  title: "Perlengkapan Bayi",
                                  img: "assets/category/putih/9.png",
                                )
                              : CategoryCard(
                                  title: "Perlengkapan Bayi",
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
                    //save selected categories
                    s1 ? kategori.add("Alat Tulis") : "";

                    s2 ? kategori.add("Mainan") : "";

                    s3 ? kategori.add("Pakaian") : "";

                    s4 ? kategori.add("Buku") : "";

                    s5 ? kategori.add("Perlengkapan Kesehatan") : "";

                    s6 ? kategori.add("Perlengkapan Sekolah") : "";

                    s7 ? kategori.add("Perlengkapan Bayi") : "";

                    s8 ? kategori.add("Sembako") : "";

                    s9 ? kategori.add("Lainnya") : "";

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RIHomeScreen()));
                  },
                  child: Text(
                    "Simpan Perubahan",
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
