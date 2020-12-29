part of 'pages.dart';

class EditGoodsNeeded extends StatefulWidget {
  final List<dynamic> kategori;
  EditGoodsNeeded({Key key, this.kategori}) : super(key: key);

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

  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('panti')
      .doc('CdM3SJPkXE3IUEnQRovm');

  void checkCategory() {
    if (widget.kategori.contains("Alat Tulis")) {
      s1 = true;
    }
    if (widget.kategori.contains("Mainan")) {
      s2 = true;
    }
    if (widget.kategori.contains("Pakaian")) {
      s3 = true;
    }
    if (widget.kategori.contains("Buku")) {
      s4 = true;
    }
    if (widget.kategori.contains("Perlengkapan Kesehatan")) {
      s5 = true;
    }
    if (widget.kategori.contains("Perlengkapan Sekolah")) {
      s6 = true;
    }
    if (widget.kategori.contains("Perlengkapan Bayi")) {
      s7 = true;
    }
    if (widget.kategori.contains("Sembako")) {
      s8 = true;
    }
    if (widget.kategori.contains("Lainnya")) {
      s9 = true;
    }
  }

  void initState() {
    super.initState();
    checkCategory();
  }

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
                          if (s1) {
                            documentReference.update({
                              'neededGoods':
                                  FieldValue.arrayUnion(["Alat Tulis"])
                            });
                            SelectedCategory(
                              title: "Alat Tulis",
                              img: "assets/category/putih/1.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods':
                                  FieldValue.arrayRemove(["Alat Tulis"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(["Mainan"])
                            });
                            SelectedCategory(
                              title: "Mainan",
                              img: "assets/category/putih/2.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(["Mainan"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(["Pakaian"])
                            });
                            SelectedCategory(
                              title: "Pakaian",
                              img: "assets/category/putih/3.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(["Pakaian"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(["Buku"])
                            });
                            SelectedCategory(
                              title: "Buku",
                              img: "assets/category/putih/4.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(["Buku"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(
                                  ["Perlengkapan Kesehatan"])
                            });
                            SelectedCategory(
                              title: "Perlengkapan Kesehatan",
                              img: "assets/category/putih/5.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(
                                  ["Perlengkapan Kesehatan"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(
                                  ["Perlengkapan Sekolah"])
                            });
                            SelectedCategory(
                              title: "Perlengkapan Sekolah",
                              img: "assets/category/putih/6.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(
                                  ["Perlengkapan Sekolah"])
                            });
                          }
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
                            documentReference.update({
                              'neededGoods':
                                  FieldValue.arrayUnion(["Perlengkapan Bayi"])
                            });
                            SelectedCategory(
                              title: "Perlengkapan Bayi",
                              img: "assets/category/putih/7.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods':
                                  FieldValue.arrayRemove(["Perlengkapan Bayi"])
                            });
                          }
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
                    InkWell(
                      onTap: () {
                        s8 = !s8;
                        setState(() {
                          if (s8) {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(["Sembako"])
                            });
                            SelectedCategory(
                              title: "Sembako",
                              img: "assets/category/putih/8.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(["Sembako"])
                            });
                          }
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
                    InkWell(
                      onTap: () {
                        s9 = !s9;
                        setState(() {
                          if (s9) {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayUnion(["Lainnya"])
                            });
                            SelectedCategory(
                              title: "Lainnya",
                              img: "assets/category/putih/9.png",
                            );
                          } else {
                            documentReference.update({
                              'neededGoods': FieldValue.arrayRemove(["Lainnya"])
                            });
                          }
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
                  onPressed: () async {
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
