part of 'pages.dart';

class SignUp extends StatefulWidget {
  final String tipeUser;

  SignUp({Key key, this.tipeUser}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color secondary = const Color(0xffBEBEEA);
  Color primary = const Color(0xff7A7ADC);

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final alamat = TextEditingController();
  final kota = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    alamat.dispose();
    kota.dispose();
    super.dispose();
  }

  void clearForm() {
    name.clear();
    email.clear();
    password.clear();
    alamat.clear();
    kota.clear();
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
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: HexColor("7A7ADC"),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SignUpChoose();
                }));
              }),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                //margin: EdgeInsets.all(20),
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset('assets/signupin/daftar.png'),
                          height: 200,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: TextStyle(color: primary),
                            recognizer: TapGestureRecognizer(),

                            // ..onTap = () {
                            //   Navigator.pushReplacement(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return SignIn();
                            //   }));
                            // }
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 10, 40, 5),
                          child: TextFormField(
                            controller: name,
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
                          margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                          child: TextFormField(
                            controller: alamat,
                            //style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixText: '     ',
                              fillColor: secondary,
                              labelText: '     Alamat',
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
                            controller: kota,
                            //style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixText: '     ',
                              fillColor: secondary,
                              labelText: '     Kota',
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
                            if (name.text == "" ||
                                email.text == "" ||
                                password.text == "" ||
                                alamat.text == "" ||
                                kota.text == "") {
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
                              String result = await AuthServices.signUp(
                                  email.text,
                                  password.text,
                                  name.text,
                                  alamat.text,
                                  kota.text,
                                  widget.tipeUser);
                              if (result == "success") {
                                print(">>>>>>>>>>>>>>>>> " + widget.tipeUser);
                                Fluttertoast.showToast(
                                  msg: "Sukses",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                if (widget.tipeUser == 'Panti') {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RIMainTabBar(
                                      index: 0,
                                    );
                                  }));
                                } else if (widget.tipeUser == 'Donatur') {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainTabBar();
                                  }));
                                }
                                ;

                                setState(() {
                                  isLoading = false;
                                  clearForm();
                                });
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Akun sudah dimiliki orang lain",
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
                                text: 'Sudah punya akun? Masuk',
                                style: TextStyle(color: primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignIn();
                                    }));
                                  })),
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
      ),
    );
  }
}
