part of 'pages.dart';

class RIMainTabBar extends StatefulWidget {
  final String title = "Dashboard";
  final int index;
  RIMainTabBar({this.index});

  @override
  _RIMainTabBarState createState() => _RIMainTabBarState();
}

class _RIMainTabBarState extends State<RIMainTabBar>
    with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        MotionTabController(initialIndex: widget.index, vsync: this);
    _tabController.index = widget.index;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var labels = ["Dashboard", "Riwayat", "Akun"];
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: labels,
          initialSelectedTab: labels[widget.index],
          tabIconColor: Colors.deepPurple[100],
          tabSelectedColor: HexColor("7A7ADC"),
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.favorite, Icons.history, Icons.person],
          textStyle: TextStyle(color: HexColor("7A7ADC")),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            RIHomeScreen(),
            RIRiwayatScreen(),
            RIAccountScreen()
          ],
        ));
  }
}
