part of 'pages.dart';

class GantiPass extends StatefulWidget {
  @override
  _GantiPassState createState() => _GantiPassState();
}

class _GantiPassState extends State<GantiPass> {
  TextEditingController newpass = TextEditingController(text: "");
  TextEditingController repass = TextEditingController(text: "");
  TextEditingController oldpass = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("7a7adc"),
        title: Text("Ganti Password"),
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Column(children: [
              TextFormField(
                controller: oldpass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Masukkan password lama",
                  labelStyle: TextStyle(color: HexColor("7a7adc")),
                  prefixIcon: Icon(Icons.lock, color: HexColor("7a7adc")),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                ),
              ),
              TextFormField(
                controller: newpass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Masukkan password baru",
                  labelStyle: TextStyle(color: HexColor("7a7adc")),
                  prefixIcon: Icon(Icons.vpn_key, color: HexColor("7a7adc")),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                ),
              ),
              TextFormField(
                controller: repass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Masukkan ulang password baru",
                  labelStyle: TextStyle(color: HexColor("7a7adc")),
                  prefixIcon: Icon(Icons.vpn_key, color: HexColor("7a7adc")),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("7a7adc")),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: RaisedButton(
                  child: Text(
                    "Ganti Password",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: HexColor("7a7adc"),
                  onPressed: () async {
                    if (newpass.text == "" || repass.text == "") {
                      Fluttertoast.showToast(
                        msg: "Mohon untuk mengisi seluruh kolomnya",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else {
                      if (newpass.text.length < 6) {
                        Fluttertoast.showToast(
                          msg: "Password harus lebih dari 6.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        if (newpass.text != repass.text) {
                          Fluttertoast.showToast(
                            msg: "Password baru tidak sama.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          bool r = await AuthServices.checkCredential(
                              FirebaseAuth.instance.currentUser.email,
                              oldpass.text);
                          bool result =
                              await AuthServices.UpdatePassword(newpass.text);
                          if (r && result) {
                            Fluttertoast.showToast(
                              msg: "Password berhasil diperbaharui",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.pop(context);
                          } else {
                            if (r == false) {
                              Fluttertoast.showToast(
                                msg: "Password salah!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: "Password gagal diperbaharui",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
