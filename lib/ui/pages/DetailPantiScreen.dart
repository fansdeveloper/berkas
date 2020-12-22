part of 'pages.dart';

class DetailPantiScreen extends StatefulWidget {
  @override
  _DetailPantiScreenState createState() => _DetailPantiScreenState();
}

class _DetailPantiScreenState extends State<DetailPantiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Panti",
          style: TextStyle(color: HexColor("7A7ADC")),
        ),
      ),
      body: Container(),
    );
  }
}
