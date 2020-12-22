part of 'pages.dart';

class LacakBarangScreen extends StatefulWidget {
  @override
  _LacakBarangScreenState createState() => _LacakBarangScreenState();
}

class _LacakBarangScreenState extends State<LacakBarangScreen> {
  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [
      _TimelineStatus.arrived,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
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
                    color: HexColor("bebeea"),
                    nodePosition: 0,
                  ),
                  builder: TimelineTileBuilder.connected(
                    indicatorBuilder: (context, index) {
                      return DotIndicator(
                        color:
                            data[index].isArrived ? HexColor("7a7adc") : null,
                      );
                    },
                    connectorBuilder: (_, index, connectorType) {
                      var color;
                      if (index + 1 < data.length - 1) {
                        color =
                            data[index].isArrived && data[index + 1].isArrived
                                ? HexColor("7a7adc")
                                : null;
                      }
                      return SolidLineConnector(
                        indent: connectorType == ConnectorType.start ? 0 : 1.0,
                        endIndent: connectorType == ConnectorType.end ? 0 : 1.0,
                        color: color,
                      );
                    },
                    contentsBuilder: (_, index) => _EmptyContents(),
                    itemExtentBuilder: (_, __) {
                      return 50;
                    },
                    itemCount: data.length,
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
      child: Text(
        "[SURABAYA] Paket telah sampai di drop center di SURABAYA",
        style: TextStyle(
          color: HexColor(
            "7a7adc",
          ),
        ),
      ),
    );
  }
}

enum _TimelineStatus { done, arrived }

extension on _TimelineStatus {
  bool get isArrived => this == _TimelineStatus.arrived;
}
