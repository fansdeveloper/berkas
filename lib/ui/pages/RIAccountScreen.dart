part of 'pages.dart';

class RIAccountScreen extends StatefulWidget {
  @override
  _RIAccountScreenState createState() => _RIAccountScreenState();
}

class _RIAccountScreenState extends State<RIAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Akun"),
        backgroundColor: HexColor("7A7ADC"),
        leading: Icon(
          Icons.book,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit, color: Colors.white), onPressed: () {})
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor("E7E7E7")),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              "Panti Asuhan Ibububunda",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Jl. Babatan Sari Apple no 89"),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: HexColor("BEBEEA"),
                                ),
                                Text(
                                  "Surabaya",
                                  style: TextStyle(
                                    color: HexColor("BEBEEA"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                          color: HexColor("BEBEEA"),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.zero, bottom: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Pengaturan",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Divider(
                            color: HexColor("7A7ADC"),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Keluar",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.75),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                      "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1026205392%2F0x0.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
