part of 'pages.dart';

class ChooseRIScreen extends StatefulWidget {
//get selected category from ChooseCategoryScreen
  final List<dynamic> kategori;
  ChooseRIScreen({Key key, this.kategori}) : super(key: key);

  @override
  _ChooseRIScreenState createState() => _ChooseRIScreenState();
}

class _ChooseRIScreenState extends State<ChooseRIScreen> {

  var id = FirebaseAuth.instance.currentUser.uid;
  var rekomendasiPantiCollection;

  initState() {
    super.initState();

    rekomendasiPantiCollection = FirebaseFirestore.instance
        .collection("panti")
        .where("neededGoods");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pilih Panti",
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
      body: StreamBuilder<QuerySnapshot>(
      stream: rekomendasiPantiCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Failed to get products data!");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitFadingCircle(
            size: 50,
            color: Colors.red,
          );
        }

        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot doc) {
              
              return PantiCard(
                namaPanti: doc.data()['name'],
                img: doc.data()['profilePicture'],
                category: [widget.kategori],
              );
            }).toList(),
          );
        } else {
          return Container();
        }
      },
      ),
    
      
      // Container(
      //   color: Colors.grey[200],
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
      //     child: ListView(
      //       children: 
      //       [
      //         if (widget.kategori ==) {
                
      //         } else {

      //         }
      //         // PantiCard(
      //         //   namaPanti: "Panti Jompo Sayang Emak",
      //         //   img:
      //         //       "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
      //         //   category: ["Mainan", "Alat Tulis", "Sembako"],
      //         // ),
      //         // PantiCard(
      //         //   namaPanti: "Panti Asuhan Ibubunda",
      //         //   img:
      //         //       "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
      //         //   category: ["Buku", "Perlengkapan Sekolah", "Pakaian"],
      //         // ),
      //         // PantiCard(
      //         //   namaPanti: "Yayasan Sayap Ibu Peri",
      //         //   img:
      //         //       "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
      //         //   category: ["Buku", "Perlengkapan Sekolah", "Pakaian"],
      //         // ),
      //         // PantiCard(
      //         //   namaPanti: "Panti Sosial Baladingding",
      //         //   img:
      //         //       "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
      //         //   category: ["Buku", "Perlengkapan Sekolah", "Pakaian"],
      //         // )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
