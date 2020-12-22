part of 'pages.dart';

class LacakBarangScreen extends StatefulWidget {
  @override
  _LacakBarangScreenState createState() => _LacakBarangScreenState();
}

class _LacakBarangScreenState extends State<LacakBarangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Lacak Barang",
          style: TextStyle(color: HexColor("7A7ADC")),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HexColor("7A7ADC")),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "No Resi",
                        style: TextStyle(color: HexColor("7A7ADC")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("JP0123893348219",
                          style: TextStyle(
                              color: HexColor("7A7ADC"), fontSize: 28)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: ListView.builder(),
            )
          ],
        ),
      ),
    );
  }
}
