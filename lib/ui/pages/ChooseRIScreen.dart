part of 'pages.dart';

class ChooseRIScreen extends StatefulWidget {
//get selected category from ChooseCategoryScreen
  final List<dynamic> kategori;
  ChooseRIScreen({Key key, this.kategori}) : super(key: key);

  @override
  _ChooseRIScreenState createState() => _ChooseRIScreenState();
}

class _ChooseRIScreenState extends State<ChooseRIScreen> {
  void initState() {
    super.initState();
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
        stream: FirebaseFirestore.instance
            .collection("panti")
            .where("neededGoods", arrayContainsAny: widget.kategori)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                height: 200.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
                ),
              );
            default:
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    List<DocumentSnapshot> panti = snapshot.data.docs;
                    DocumentSnapshot pantiKategori = snapshot.data.docs[index];
                    return PantiData(
                      panti: panti,
                      kategoriPanti: pantiKategori.data()['neededGoods'],
                      index: index,
                    );
                  });
          }
        },
      ),
    );
  }
}

class PantiData extends StatelessWidget {
  final List<DocumentSnapshot> panti;
  final List<dynamic> kategoriPanti;
  final int index;

  const PantiData({Key key, this.panti, this.kategoriPanti, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: panti[index]['id'].toString())
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
              ),
            );
          } else {
            return Column(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return PantiCard(
                    onClick: true,
                    category: kategoriPanti,
                    namaPanti: document['name'],
                    img: document['profilePicture'] == ""
                        ? "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png"
                        : document['profilePicture']);
              }).toList(),
            );
          }
        });
  }
}
