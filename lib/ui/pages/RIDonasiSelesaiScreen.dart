part of 'pages.dart';

class RIDonasiSelesaiScreen extends StatefulWidget {
  @override
  _RIDonasiSelesaiScreenState createState() => _RIDonasiSelesaiScreenState();
}

class _RIDonasiSelesaiScreenState extends State<RIDonasiSelesaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Donasi Selesai",
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
          child: RiwayatDonasiShared(),
        ),
      ),
    );
  }
}
