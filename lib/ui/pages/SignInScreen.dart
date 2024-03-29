part of 'pages.dart';

class SignIn extends StatefulWidget {
  // final String tipeUser;

  // SignIn({Key key, this.tipeUser}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);

  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void clearForm() {
    email.clear();
    password.clear();
  }

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
                          controller: email,
                          cursorColor: HexColor("7A7ADC"),
                          decoration: InputDecoration(
                            filled: true,
                            focusColor: HexColor("7A7ADC"),
                            fillColor: secondary,
                            prefixText: '     ',
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: HexColor("7A7ADC"),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
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
                          controller: password,
                          cursorColor: HexColor("7A7ADC"),
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            focusColor: HexColor("7A7ADC"),
                            fillColor: secondary,
                            prefixText: '     ',
                            hintText: 'Kata Kunci',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: HexColor("7A7ADC"),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
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
                        onPressed: () async {
                          if (email.text == "" || password.text == "") {
                            Fluttertoast.showToast(
                              msg: "Mohon untuk mengisi seluruh kolomnya",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            String result = await AuthServices.signIn(
                              email.text,
                              password.text,
                            );
                            if (result == "success") {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return CheckTipeUser();
                              }));
                              Fluttertoast.showToast(
                                msg: "Sukses",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                isLoading = false;
                                clearForm();
                              });
                            } else {
                              Fluttertoast.showToast(
                                msg: "Periksa kembali Email/Kata kunci Anda",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
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
            isLoading == true
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SpinKitFadingCircle(
                      size: 50,
                      color: primary,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
