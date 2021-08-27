part of 'pages.dart';

class PinScreen extends StatefulWidget {
  final int deliveryFee;

  PinScreen({this.deliveryFee});
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _otp = "";
  var _otpSymbols = [
    "\u{25CB}",
    "\u{25CB}",
    "\u{25CB}",
    "\u{25CB}",
    "\u{25CB}",
    "\u{25CB}",
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int digit = 6;

  void _handleKeypadClick(String val) {
    setState(() {
      if (_otp.length < digit) {
        _otp = _otp + val;
        for (int i = 0; i < _otp.length; i++) _otpSymbols[i] = "\u{25CF}";
      }
    });
  }

  void _handleKeypadDel() {
    setState(() {
      if (_otp.length > digit) {
        _otp = _otp.substring(0, _otp.length - 1);
        for (int i = _otp.length; i < 6; i++) _otpSymbols[i] = "\u{25CB}";
      }
    });
  }

  void _handleSubmit() {
    if (_otp.length == digit) {
      Fluttertoast.showToast(
          msg: "Pembayaran Berhasil",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Pembayaran Berhasil')));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainTabBar(index: 0)));
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Pin harus 6 digit'),
        backgroundColor: Colors.red,
      ));
    }
  }

  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("PIN"),
        backgroundColor: HexColor("7a7adc"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        'Anda akan melakukan pembayaran biaya ongkir sebesar',
                        style:
                            TextStyle(fontSize: 20, color: HexColor("7a7adc")),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Rp ${formatter.format(widget.deliveryFee)}",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: HexColor("7a7adc")),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Masukkan Pin Anda',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: HexColor("7a7adc")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        _otpSymbols[0],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                      Text(
                        _otpSymbols[1],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                      Text(
                        _otpSymbols[2],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                      Text(
                        _otpSymbols[3],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                      Text(
                        _otpSymbols[4],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                      Text(
                        _otpSymbols[5],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: HexColor("7a7adc")),
                      ),
                    ],
                  )
                ]),
            Container(
              color: HexColor("7a7adc"),
              padding: EdgeInsets.only(top: 10),
              child: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('1');
                        },
                        child: Text('1',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('2');
                        },
                        child: Text('2',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('3');
                        },
                        child: Text('3',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('4');
                        },
                        child: Text('4',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('5');
                        },
                        child: Text('5',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('6');
                        },
                        child: Text('6',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('7');
                        },
                        child: Text('7',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('8');
                        },
                        child: Text('8',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      FlatButton(
                        onPressed: () {
                          _handleKeypadClick('9');
                        },
                        child: Text('9',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      )
                    ]),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            _handleKeypadDel();
                          },
                          child: Text('\u{232b}',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                        FlatButton(
                          onPressed: () {
                            _handleKeypadClick('0');
                          },
                          child: Text('0',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                        FlatButton(
                          onPressed: () {
                            _handleSubmit();
                          },
                          child: Text('\u{2713}',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        )
                      ]),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
