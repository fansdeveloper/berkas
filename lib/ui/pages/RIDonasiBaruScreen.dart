part of 'pages.dart';

class RIDonasiBaruScreen extends StatefulWidget {
  @override
  _RIDonasiBaruScreenState createState() => _RIDonasiBaruScreenState();
}

class _RIDonasiBaruScreenState extends State<RIDonasiBaruScreen> {
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
          child: ListView(
            children: [
              DonasiCard(
                  name: "Siti Devina",
                  date: "22/09/00",
                  img:
                      "https://dvyvvujm9h0uq.cloudfront.net/com/articles/1571042540-model-1.jpg"),
              DonasiCard(
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
