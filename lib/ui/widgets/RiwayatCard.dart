part of 'widgets.dart';

class RiwayatCard extends StatefulWidget {
  final Donasi donasi;
  final String date;
  final int tipeUser;
  RiwayatCard({this.donasi, this.date, this.tipeUser});

  @override
  _RiwayatCardState createState() => _RiwayatCardState();
}

class _RiwayatCardState extends State<RiwayatCard> {
  String name, img;

  //Ambil Data
  void getData() async {
    if (this.widget.tipeUser == 0) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(this.widget.donasi.donaturID)
          .get()
          .then((value) {
        name = value.data()['name'];
        img = value.data()['profilePicture'];
      });
      if (mounted) {
        setState(() {});
      }
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(this.widget.donasi.pantiID)
          .get()
          .then((value) {
        name = value.data()['name'];
        img = value.data()['profilePicture'];
      });
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailDonasiScreen(
                          donasi: this.widget.donasi,
                          tipeUser: this.widget.tipeUser,
                        )));
          },
          title: Text(
            name ?? "Users",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(this.widget.date),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                img ??
                    "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png",
                scale: 30),
          ),
        ),
      ),
    );
  }
}
