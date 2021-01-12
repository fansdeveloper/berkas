part of 'pages.dart';

class PengaturanScreen extends StatefulWidget {
  @override
  _PengaturanScreenState createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("7a7adc"),
        title: Text("Pengaturan"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text("Ganti Email",
                  style: TextStyle(color: HexColor("7a7adc"))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GantiEmail();
                }));
              },
            ),
            Divider(
              color: HexColor("7a7adc"),
            ),
            FlatButton(
              child: Text("Ganti Password",
                  style: TextStyle(color: HexColor("7a7adc"))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GantiPass();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
