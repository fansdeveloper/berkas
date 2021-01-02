part of 'shared.dart';

class RiwayatDonasiShared extends StatefulWidget {
  @override
  _RiwayatDonasiSharedState createState() => _RiwayatDonasiSharedState();
}

class _RiwayatDonasiSharedState extends State<RiwayatDonasiShared> {
  // var donasiBaruCollection = FirebaseFirestore.instance
  //     .collection("donations")
  //     .where('isConfirmed', isEqualTo: true)
  //     .where('pantiID', isEqualTo: "CdM3SJPkXE3IUEnQRovm");

  var id = FirebaseAuth.instance.currentUser.uid;
  var donasiBaruCollection;

  initState() {
    super.initState();

    donasiBaruCollection = FirebaseFirestore.instance
        .collection("donations")
        .where('isConfirmed', isEqualTo: true)
        .where('pantiID', isEqualTo: id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: donasiBaruCollection.snapshots(),
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
                tipeUser: 0,
              );
            }).toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
