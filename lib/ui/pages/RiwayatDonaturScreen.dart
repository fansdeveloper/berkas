part of 'pages.dart';

class RiwayatDonaturScreen extends StatefulWidget {
  @override
  _RiwayatDonaturScreenState createState() => _RiwayatDonaturScreenState();
}

class _RiwayatDonaturScreenState extends State<RiwayatDonaturScreen> {
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
          child: ListView(
            children: [
              RiwayatCard(
                  name: "Panti Asuhan Ibububunda",
                  date: "22/09/00",
                  img:
                      "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg"),
              RiwayatCard(
                name: "Panti Asuhan Mimi Peri",
                date: "16/09/29",
                img:
                    "https://image.cnbcfm.com/api/v1/image/104548349-Large_house_suburb.jpg?v=1532563813",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
