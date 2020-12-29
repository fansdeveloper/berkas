part of 'pages.dart';

class SignUpChoose extends StatefulWidget {
  
  @override
  _SignUpChooseState createState() => _SignUpChooseState();
}

class _SignUpChooseState extends State<SignUpChoose> {
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);
  String tipeUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: HexColor("7A7ADC"),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              }),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: GestureDetector(
                    child: Column(
                      children: [
                        Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/chooserole/donatur.png"),
                                  fit: BoxFit.fitHeight),
                            )),
                        RichText(
                            text: TextSpan(
                                text: 'Donatur',
                                style: TextStyle(color: primary, fontSize: 20),
                                recognizer: TapGestureRecognizer())),
                      ],
                    ),
                    onTap: () {
                      print("Donatur Clicked");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp(tipeUser: 'Donatur',);
                      }));
                    }),
              ),
              RichText(
                  text: TextSpan(
                      text: 'atau',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      recognizer: TapGestureRecognizer())),
              Column(
                children: [
                  Container(
                    child: GestureDetector(
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/chooserole/panti.png"),
                                  fit: BoxFit.fitHeight),
                            )),
                        onTap: () {
                          print("Panti Clicked");

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp(tipeUser: 'Panti');
                          }));
                        }),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Panti',
                          style: TextStyle(color: primary, fontSize: 20),
                          recognizer: TapGestureRecognizer())),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
