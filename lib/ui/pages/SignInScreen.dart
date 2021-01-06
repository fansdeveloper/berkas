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

  String tipeUser;

  void fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      tipeUser = value.data()['tipeUser'];
    });
    setState(() {});
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

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
                          controller: password,
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
                              Fluttertoast.showToast(
                                msg: "Sukses",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              print(tipeUser);
                              // print(tipeUser);
                              if (tipeUser == "Panti") {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RIMainTabBar(index: 0);
                                }));
                              } else if (tipeUser == "Donatur") {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainTabBar(index: 0);
                                }));
                              }

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
