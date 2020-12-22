part of 'pages.dart';

class DonasiSayaScreen extends StatefulWidget {
  @override
  _DonasiSayaScreenState createState() => _DonasiSayaScreenState();
}

class _DonasiSayaScreenState extends State<DonasiSayaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Donasi Saya",
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
                name: "Panti Asuhan Ibububunda",
                date: "22/09/00",
                img:
                    "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg",
                tipeUser: 1,
              ),
              DonasiCard(
                name: "Panti Asuhan Mimi Peri",
                date: "16/09/29",
                img:
                    "https://image.cnbcfm.com/api/v1/image/104548349-Large_house_suburb.jpg?v=1532563813",
                tipeUser: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
