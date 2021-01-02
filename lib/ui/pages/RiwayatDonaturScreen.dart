part of 'pages.dart';

class RiwayatDonaturScreen extends StatefulWidget {
  @override
  _RiwayatDonaturScreenState createState() => _RiwayatDonaturScreenState();
}

class _RiwayatDonaturScreenState extends State<RiwayatDonaturScreen> {
  var id = FirebaseAuth.instance.currentUser.uid;
  var riwayatDonasiCollection;

  initState() {
    super.initState();

    riwayatDonasiCollection = FirebaseFirestore.instance
        .collection("donations")
        .where('isConfirmed', isEqualTo: false)
        .where('donaturID', isEqualTo: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Riwayat"),
        backgroundColor: HexColor("7A7ADC"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo/berkas 2.png'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor("E7E7E7")),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: riwayatDonasiCollection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    //Tanggal
                    Timestamp t = doc.data()['date'];
                    String stringDate = t.toDate().toString();

                    return RiwayatCard(
                      donasi: Donasi(
                          doc.data()['id'],
                          doc.data()['pantiID'],
                          doc.data()['donaturID'],
                          doc.data()['keterangan'],
                          doc.data()['lokasi'],
                          doc.data()['tujuan'],
                          doc.data()['fee'],
                          doc.data()['weight'],
                          doc.data()['date'],
                          doc.data()['kategori'],
                          doc.data()['isConfirmed']),
                      date: stringDate,
                      tipeUser: 1,
                    );
                  }).toList(),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
