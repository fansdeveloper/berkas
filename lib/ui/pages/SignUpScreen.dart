part of 'pages.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              //margin: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Image.asset('assets/signupin/daftar.png'),
                        height: 200,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: TextFormField(
                          //controller: ,
                          //style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixText: '     ',
                            fillColor: secondary,
                            labelText: '     Nama Lengkap',
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
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: TextFormField(
                          //controller: ,
                          //style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixText: '     ',
                            fillColor: secondary,
                            labelText: '     Lokasi',
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
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: 
                          TextSpan(
                              text: 'Sudah punya akun? Masuk',
                              style: TextStyle(color: primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainTabBar();
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
