part of 'pages.dart';

class HomeScreenDonatur extends StatefulWidget {
  final String title = "Donasi";

  @override
  _HomeScreenDonaturState createState() => _HomeScreenDonaturState();
}

class _HomeScreenDonaturState extends State<HomeScreenDonatur>
    with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Donasi"),
          backgroundColor: HexColor("7A7ADC"),
          leading: Icon(
            Icons.book,
            color: Colors.white,
          ),
        ),
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
            Container(
              child: Center(
                child: Text("Donasi"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Riwayat"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Akun"),
              ),
            ),
          ],
        ));
  }
}
