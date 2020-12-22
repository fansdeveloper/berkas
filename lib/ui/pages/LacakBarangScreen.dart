part of 'pages.dart';

class LacakBarangScreen extends StatefulWidget {
  @override
  _LacakBarangScreenState createState() => _LacakBarangScreenState();
}

class _LacakBarangScreenState extends State<LacakBarangScreen> {
  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [
      _TimelineStatus.done,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.todo
    ];
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
                    Text(
                      "No Resi",
                      style: TextStyle(color: HexColor("7A7ADC")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("JP0123893348219",
                        style:
                            TextStyle(color: HexColor("7A7ADC"), fontSize: 28)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    color: HexColor("7a7adc"),
                    nodePosition: 0,
                  ),
                  builder: TimelineTileBuilder.connectedFromStyle(
                    contentsAlign: ContentsAlign.basic,
                    firstConnectorStyle: ConnectorStyle.transparent,
                    lastConnectorStyle: ConnectorStyle.transparent,
                    contentsBuilder: (context, index) => Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '[SURABAYA] Paket telah sampai di drop center di SURABAYA',
                            style: TextStyle(color: HexColor("7a7adc"))),
                      ),
                    ),
                    connectorStyleBuilder: (context, index) =>
                        ConnectorStyle.solidLine,
                    indicatorStyleBuilder: (context, index) =>
                        IndicatorStyle.dot,
                    itemCount: 6,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
