part of 'pages.dart';

class RIMainTabBar extends StatefulWidget {
  final String title = "Dashboard";

  @override
  _RIMainTabBarState createState() => _RIMainTabBarState();
}

class _RIMainTabBarState extends State<RIMainTabBar>
    with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Dashboard", "Riwayat", "Akun"],
          initialSelectedTab: "Dashboard",
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
