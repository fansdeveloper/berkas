part of 'pages.dart';

class RIEditGoodsScreen extends StatefulWidget {
  @override
  _RIEditGoodsScreenState createState() => _RIEditGoodsScreenState();
}

class _RIEditGoodsScreenState extends State<RIEditGoodsScreen> {
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
    );
  }
}
