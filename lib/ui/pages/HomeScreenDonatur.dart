part of 'pages.dart';

class HomeScreenDonatur extends StatefulWidget {
  @override
  _HomeScreenDonaturState createState() => _HomeScreenDonaturState();
}

class _HomeScreenDonaturState extends State<HomeScreenDonatur> {
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
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(height: 15.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s1.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Tunggu apa lagi?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Donasikan barangmu bagi saudara kita!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s2.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Perjalanan hidup yang indah adalah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Ketika kita mampu berbagi, bukan menikmatinya sendiri",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/slider/s3.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hidup ini Indah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.deepPurple,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Seindah saat kita dapat berbagi dengan sesama",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.deepPurple,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
