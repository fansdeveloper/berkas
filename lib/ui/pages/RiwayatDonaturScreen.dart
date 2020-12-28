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
            children: [],
          ),
        ),
      ),
    );
  }
}
