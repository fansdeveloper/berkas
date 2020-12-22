part of 'pages.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          // leading: IconButton(
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: HexColor("7A7ADC"),
          //     ),
          //     onPressed: () {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) {
          //         return ;
          //       }));
          //     }),
        ),
        body: Stack(
          children: [
            Container(
              //margin: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/signupin/masuk.png'),
                        height: 180,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 5),
                        child: TextFormField(
                          //controller: ,
                          //style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixText: '     ',
                            fillColor: secondary,
                            labelText: '     Email',
                            labelStyle:
                                TextStyle(color: Colors.white), //spasi 5 kali
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                //width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                        child: TextFormField(
                          //controller: ,
                          //style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixText: '     ',
                            fillColor: secondary,
                            labelText: '     Kata kunci',
                            labelStyle:
                                TextStyle(color: Colors.white), //spasi 5 kali
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                //width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: primary,
                        child: Text("Masuk"),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MainTabBar();
                          }));
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Belum punya akun? Daftar',
                              style: TextStyle(color: primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpChoose();
                                  }));
                                }))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
