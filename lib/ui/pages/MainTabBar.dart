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
          labels: ["Donasi", "Riwayat", "Akun"],
          initialSelectedTab: "Donasi",
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
        )
        );
  }
}
