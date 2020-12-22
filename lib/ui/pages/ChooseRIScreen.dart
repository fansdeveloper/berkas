part of 'pages.dart';

class ChooseRIScreen extends StatefulWidget {
  @override
  _ChooseRIScreenState createState() => _ChooseRIScreenState();
}

class _ChooseRIScreenState extends State<ChooseRIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pilih Panti",
          style: TextStyle(color: HexColor("7A7ADC")),
        ),
      ),
      body: Container(),
    );
  }
}
