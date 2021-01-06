part of 'pages.dart';

class MainTabBar extends StatefulWidget {
  final String title = "Donasi";
  final int index;
  MainTabBar({this.index});
  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with TickerProviderStateMixin {
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
    var labels = ["Donasi", "Riwayat", "Akun"];
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
            HomeScreenDonatur(),
            RiwayatDonaturScreen(),
            AccountScreen(),
          ],
        ));
  }
}
