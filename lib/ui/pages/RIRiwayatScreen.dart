part of 'pages.dart';

class RIRiwayatScreen extends StatefulWidget {
  @override
  _RIRiwayatScreenState createState() => _RIRiwayatScreenState();
}

class _RIRiwayatScreenState extends State<RIRiwayatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Riwayat"),
        backgroundColor: HexColor("7A7ADC"),
        leading: Icon(
          Icons.book,
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor("E7E7E7")),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: ListView(
            children: [
              RiwayatCard(
                  name: "Siti Devina",
                  date: "22/09/00",
                  img:
                      "https://dvyvvujm9h0uq.cloudfront.net/com/articles/1571042540-model-1.jpg"),
              RiwayatCard(
                name: "Tiffany Zainul",
                date: "20/09/19",
                img:
                    "https://upload.wikimedia.org/wikipedia/commons/0/03/Diane_von_F%C3%BCrstenberg_Spring-Summer_2014_05_%28cropped%29.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
