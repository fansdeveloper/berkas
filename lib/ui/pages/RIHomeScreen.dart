part of 'pages.dart';

class RIHomeScreen extends StatefulWidget {
  @override
  _RIHomeScreenState createState() => _RIHomeScreenState();
}

class _RIHomeScreenState extends State<RIHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dashboard"),
          backgroundColor: HexColor("7A7ADC"),
          leading: Icon(
            Icons.book,
            color: Colors.white,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: HexColor("E7E7E7")),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 330,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Daftar Kebutuhan",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: HexColor("7A7ADC")),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(5, (index) {
                              return Container(
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.ac_unit),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: HexColor("7a7adc"),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Lalala",
                                        style: TextStyle(
                                            color: HexColor("7a7adc")),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Statistik Donasi",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, color: HexColor("7a7adc")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text("hai"),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text("hai"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
