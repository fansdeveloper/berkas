part of 'pages.dart';

class ChooseCategoryScreen extends StatefulWidget {
  @override
  _ChooseCategoryScreenState createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    SelectedCategory(
                      title: "Alat Tulis",
                      img: "assets/category/putih/1.png",
                    ),
                    CategoryCard(
                      title: "Mainan",
                      img: "assets/category/ungu/2.png",
                    ),
                    SelectedCategory(
                      title: "Pakaian",
                      img: "assets/category/putih/3.png",
                    ),
                    CategoryCard(
                      title: "Buku",
                      img: "assets/category/ungu/4.png",
                    ),
                    CategoryCard(
                      title: "Perlengkapan Kesehatan",
                      img: "assets/category/ungu/5.png",
                    ),
                    CategoryCard(
                      title: "Perlengkapan Sekolah",
                      img: "assets/category/ungu/6.png",
                    ),
                    CategoryCard(
                      title: "Perlengkapan Bayi",
                      img: "assets/category/ungu/7.png",
                    ),
                    CategoryCard(
                      title: "Sembako",
                      img: "assets/category/ungu/8.png",
                    ),
                    CategoryCard(
                      title: "Lainnya",
                      img: "assets/category/ungu/9.png",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseRIScreen()));
                  },
                  child: Text(
                    "Selanjutnya >",
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
