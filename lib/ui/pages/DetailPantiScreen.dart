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
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: HexColor("7A7ADC"),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Container(),
    );
  }
}
