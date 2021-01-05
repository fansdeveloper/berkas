part of 'pages.dart';

class LacakBarangScreen extends StatefulWidget {
  final Resi resi;
  LacakBarangScreen({this.resi});
  @override
  _LacakBarangScreenState createState() => _LacakBarangScreenState();
}

class _LacakBarangScreenState extends State<LacakBarangScreen> {
  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [];

    for (var i = 0; i < this.widget.resi.data.history.length; i++) {
      if (i != 0) {
        data.add(_TimelineStatus.done);
      } else {
        data.add(_TimelineStatus.arrived);
      }
    }

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
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      Text(
                        this.widget.resi.data.summary.awb,
                        style:
                            TextStyle(color: HexColor("7A7ADC"), fontSize: 28),
                      ),
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
                          indent:
                              connectorType == ConnectorType.start ? 0 : 1.0,
                          endIndent:
                              connectorType == ConnectorType.end ? 0 : 1.0,
                          color: color,
                        );
                      },
                      contentsBuilder: (_, index) =>
                          _Contents(index, this.widget.resi),
                      itemExtentBuilder: (_, __) {
                        return 100;
                      },
                      itemCount: data.length,
                    ),
                  ),
                );
              }),
              SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}

class _Contents extends StatelessWidget {
  _Contents(this.index, this.resi);
  final int index;
  final Resi resi;

  @override
  Widget build(BuildContext context) {
    var container = Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          resi.data.history[index].desc,
          style: TextStyle(
            color: HexColor(
              "7a7adc",
            ),
          ),
        ));
    return container;
  }
}

enum _TimelineStatus { done, arrived }

extension on _TimelineStatus {
  bool get isArrived => this == _TimelineStatus.arrived;
}
