part of 'pages.dart';

class GantiEmail extends StatefulWidget {
  @override
  _GantiEmailState createState() => _GantiEmailState();
}

class _GantiEmailState extends State<GantiEmail> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController reemail = TextEditingController(text: "");
  TextEditingController pass = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("7a7adc"),
        title: Text("Ganti email"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Column(children: [
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Masukkan email baru",
                  labelStyle: TextStyle(color: HexColor("7a7adc")),
                  prefixIcon: Icon(Icons.email, color: HexColor("7a7adc")),
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
                controller: reemail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Masukkan ulang email baru",
                  labelStyle: TextStyle(color: HexColor("7a7adc")),
                  prefixIcon:
                      Icon(Icons.mark_email_read, color: HexColor("7a7adc")),
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
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Masukkan password",
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
                    "Ganti email",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: HexColor("7a7adc"),
                  onPressed: () async {
                    if (email.text == "" || reemail.text == "") {
                      Fluttertoast.showToast(
                        msg: "Mohon untuk mengisi seluruh kolomnya",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else {
                      if (email.text.contains("@") &&
                          reemail.text.contains("@")) {
                        if (email.text != reemail.text) {
                          Fluttertoast.showToast(
                            msg: "Email tidak sama!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          bool r = await AuthServices.checkCredential(
                              FirebaseAuth.instance.currentUser.email,
                              pass.text);
                          bool result =
                              await AuthServices.UpdateEmail(email.text);
                          bool result2 =
                              await UserServices.updateEmail(email.text);

                          if (r && result && result2) {
                            Fluttertoast.showToast(
                              msg: "Email berhasil diperbaharui",
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
                                msg: "Email gagal diperbaharui",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: "Masukkan format email yang benar",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
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
