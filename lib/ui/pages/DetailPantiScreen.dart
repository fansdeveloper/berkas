part of 'pages.dart';

class DetailPantiScreen extends StatefulWidget {
  final String pantiID, alamatPanti, kotaPanti, namaPanti;
  final int perempuan, laki;
  final List<dynamic> kategoriPanti, kategoriDonatur;

  DetailPantiScreen(
      {Key key,
      this.pantiID,
      this.namaPanti,
      this.alamatPanti,
      this.kotaPanti,
      this.kategoriPanti,
      this.perempuan,
      this.laki,
      this.kategoriDonatur})
      : super(key: key);
  @override
  _DetailPantiScreenState createState() => _DetailPantiScreenState();
}

class _DetailPantiScreenState extends State<DetailPantiScreen> {
  var panti, donatur;
  DocumentSnapshot snapshot, snapshotDonatur;

  //donatur
  String donaturID, kotaDonatur, alamatDonatur;

  //panti
  String namaPanti, kotaPanti, alamatPanti, keterangan, img;

  TextStyle judul = TextStyle(
      fontSize: 22, fontWeight: FontWeight.bold, color: HexColor("7A7ADC"));
  TextStyle desc = TextStyle(
      fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black);

  void getDataPanti() async {
    panti = await FirebaseFirestore.instance
        .collection("panti")
        .doc(widget.pantiID)
        .get();
    snapshot = await panti;
    keterangan = await snapshot.data()['keterangan'];

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.pantiID)
        .get()
        .then((value) {
      namaPanti = value.data()['name'];
      alamatPanti = value.data()['alamat'];
      kotaPanti = value.data()['kota'];
      img = value.data()['profilePicture'];
    });
    if (mounted) {
      setState(() {
        if (img == "") {
          img = "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png";
        }
      });
    }
  }

  void getDataDonatur() async {
    donaturID = FirebaseAuth.instance.currentUser.uid;
    donatur = await FirebaseFirestore.instance
        .collection("users")
        .doc(donaturID)
        .get();
    snapshotDonatur = await donatur;
    kotaDonatur = await snapshotDonatur.data()['kota'];
    alamatDonatur = await snapshotDonatur.data()['alamat'];

    if (mounted) {
      setState(() {});
    }
  }

  void initState() {
    getDataPanti();
    getDataDonatur();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int total = widget.laki + widget.perempuan;

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
                    image: NetworkImage(img ??
                        "https://miro.medium.com/max/540/1*W35QUSvGpcLuxPo3SRTH4w.png")),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.namaPanti ?? 'Nama Panti', style: judul),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: HexColor("7A7ADC"),
                    ),
                    Text(widget.alamatPanti ?? 'Alamat Panti', style: desc),
                  ],
                ),
                SizedBox(height: 8),
                Text("Populasi", style: judul),
                SizedBox(height: 8),
                Text(
                  "Total Penghuni : " + total.toString(),
                  style: desc,
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Perempuan : " + (widget.perempuan.toString() ?? '0'),
                  style: desc,
                  textAlign: TextAlign.left,
                ),
                Text("Laki - Laki : " + (widget.laki.toString() ?? '0'),
                    style: desc),
                SizedBox(height: 8),
                Text("Kebutuhan", style: judul),
                Container(
                  height: 50,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: (widget.kategoriPanti ?? ['kategori'])
                          .map((e) => KategoriContainer(
                                kategori: e ?? 'kategori',
                              ))
                          .toList()),
                ),
                SizedBox(height: 8),
                Text("Keterangan", style: judul),
                Text(
                  keterangan ?? 'keterangan',
                  style: desc,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 50)
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
                              donaturID: donaturID,
                              pantiID: widget.pantiID,
                              alamatPanti: alamatPanti,
                              alamatUser: alamatDonatur,
                              kategori: widget.kategoriDonatur,
                              destination: kotaPanti,
                              origin: kotaDonatur)));
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
