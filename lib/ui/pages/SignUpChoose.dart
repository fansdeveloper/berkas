part of 'pages.dart';

class SignUpChoose extends StatefulWidget {
  @override
  _SignUpChooseState createState() => _SignUpChooseState();
}

class _SignUpChooseState extends State<SignUpChoose> {
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);

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
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: GestureDetector(
                    child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/chooserole/donatur.png"),
                              fit: BoxFit.fitHeight),
                        )),
                    onTap: () {
                      print("Donatur Clicked");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    }),
              ),
              RichText(
                  text: TextSpan(
                      text: 'Donatur',
                      style: TextStyle(color: primary, fontSize: 20),
                      recognizer: TapGestureRecognizer())),
              SizedBox(
                height: 80,
              ),
              RichText(
                  text: TextSpan(
                      text: 'atau',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      recognizer: TapGestureRecognizer())),
              SizedBox(
                height: 80,
              ),
              Container(
                child: GestureDetector(
                    child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/chooserole/panti.png"),
                              fit: BoxFit.fitHeight),
                        )),
                    onTap: () {
                      print("Panti Clicked");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
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
        ),
      ),
    );
  }
}
