part of 'pages.dart';

class RIDonasiBaruScreen extends StatefulWidget {
  @override
  _RIDonasiBaruScreenState createState() => _RIDonasiBaruScreenState();
}

class _RIDonasiBaruScreenState extends State<RIDonasiBaruScreen> {
  // var donasiBaruCollection = FirebaseFirestore.instance
  //     .collection("donations")
  //     .where('isConfirmed', isEqualTo: false)
  //     .where('pantiID', isEqualTo: "CdM3SJPkXE3IUEnQRovm");
  // var usersCollection = FirebaseFirestore.instance.collection("users");

  var id = FirebaseAuth.instance.currentUser.uid;
  var donasiBaruCollection;
  var usersCollection = FirebaseFirestore.instance.collection("users");

  initState() {
    super.initState();

    donasiBaruCollection = FirebaseFirestore.instance
        .collection("donations")
        .where('isConfirmed', isEqualTo: false)
        .where('pantiID', isEqualTo: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Donasi Baru",
            style: TextStyle(
              color: HexColor("7A7ADC"),
            )),
        backgroundColor: HexColor("E7E7E7"),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor("7A7ADC"),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor("E7E7E7")),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: donasiBaruCollection.snapshots(),
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

                    return DonasiCard(
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
                      tipeUser: 0,
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
