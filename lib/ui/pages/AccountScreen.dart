part of 'pages.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Akun"),
        backgroundColor: HexColor("7A7ADC"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo/berkas 2.png'),
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
                              "Jane Doe",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("janedoe@gmail.com"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on),
                                Text("Surabaya"),
                              ],
                            ),
                            SizedBox(
                              height: 45,
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
                                "Status Donasi",
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
                      "https://vgraphs.com/images/agents/sova-avatar.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
