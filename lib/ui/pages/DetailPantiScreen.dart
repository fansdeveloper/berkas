part of 'pages.dart';

class DetailPantiScreen extends StatefulWidget {
  final ResidentialInstitutions panti;
  final List<dynamic> kategori;
  DetailPantiScreen({Key key, this.panti, this.kategori}) : super(key: key);
  @override
  _DetailPantiScreenState createState() => _DetailPantiScreenState();
}

class _DetailPantiScreenState extends State<DetailPantiScreen> {
  ResidentialInstitutions panti;
  Future<ResidentialInstitutions> futureResidentialInstitutions;
  String name, id, kota, alamat, deskripsi, laki, perempuan, keterangan, img;
  List<dynamic> kategorip;
  TextStyle judul = TextStyle(
      fontSize: 22, fontWeight: FontWeight.bold, color: HexColor("7A7ADC"));
  TextStyle desc = TextStyle(
      fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black);

  void getData() async {
    await FirebaseFirestore.instance
        .collection("Panti")
        .doc(this.widget.panti.id)
        .get()
        .then((value) {
      name = value.data()['name'];
      id = value.data()['id'];
      alamat = value.data()['alamat'];
      kota = value.data()['kota'];
      deskripsi = value.data()['deskripsi'];
      laki = value.data()['laki'];
      perempuan = value.data()['perempuan'];
      kategorip = value.data()['neededGoods'];
      keterangan = value.data()['keterangan'];
      img = value.data()['imgUrl'];
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Panti",
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100.0,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg')),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? 'name', style: judul),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: HexColor("7A7ADC"),
                    ),
                    Text(alamat ?? 'alamat', style: desc),
                  ],
                ),
                SizedBox(height: 8),
                Text("Deskripsi", style: judul),
                SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, cum ea aeque molestiae. Ad quidam invidunt recteque quo, suavitate repudiandae an est. Eius affert posidonium nec ut, ei mel prima ridens appetere, malis admodum usu ad. Et vim nemore tacimates. Enim appetere pro ne, quo et assum choro deserunt.",
                  style: desc,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 8),
                Text("Populasi", style: judul),
                SizedBox(height: 8),
                Text(
                  "Total Penghuni : " +
                      (int.parse(perempuan ?? '0') + int.parse(laki ?? '0')).toString(),
                  style: desc,
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Perempuan : " + (perempuan ?? '0'),
                  style: desc,
                  textAlign: TextAlign.left,
                ),
                Text("Laki - Laki : " + (laki ?? '0'), style: desc),
                SizedBox(height: 8),
                Text("Kebutuhan", style: judul),
                Container(
                  height: 50,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: (kategorip ?? ['kategori'])
                          .map((e) => KategoriContainer(
                                kategori: e ?? 'kategori',
                              ))
                          .toList()),
                ),
                Text(keterangan ?? 'keterangan',
                    style: desc),
                SizedBox(height: 20)
              ],
            ),
          ),
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
                          builder: (context) => DetailPembayaranScreen(
                              donaturID: "Donatur ID",
                              pantiID: id,
                              alamatPanti: alamat,
                              alamatUser: "alamat User",
                              destination: kota,
                              origin: "kota e user",
                              panti: widget.panti,
                              kategori: widget.kategori)));
                },
                child: Text(
                  "Donasi Sekarang",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, wordSpacing: 5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
