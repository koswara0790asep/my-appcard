// import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/profil.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void click() {}

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  bool _isCek = false;

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "" || password == "") {
      Fluttertoast.showToast(
          msg: "E-mail dan Password tidak boleh kosong!",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
      return;
    } else if (email != "koswara0790asep@gmail.com" || password != "asep970") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(181, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              title: Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 250, 82, 70),
                                blurRadius: 6,
                                offset: Offset(4, 6))
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.triangleExclamation,
                              color: Colors.white,
                            ),
                            Text(
                              "  Login Gagal",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]))),
              content: Stack(children: const <Widget>[
                Text(
                  'Email atau Password tidak benar. \nSilahkan coba kembali!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ]),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: FittedBox(
                        child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(184, 187, 2, 211),
                                blurRadius: 6,
                                offset: Offset(4, 6))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.white,
                          ),
                          Text(
                            '  CLOSE',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )))
              ],
            );
          });
    } else if (email == "koswara0790asep@gmail.com" && password == "asep970") {
      String username = "Asep Koswara";
      logindata.setBool('login', false);
      logindata.setBool('_isCheck', true);
      logindata.setString('email', email);

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(181, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              title: Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(169, 33, 149, 243),
                                blurRadius: 6,
                                offset: Offset(4, 6))
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.circleCheck,
                              color: Colors.white,
                            ),
                            Text(
                              "  Login Berhasil!",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]))),
              content: Stack(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Selamat datang, $username! \nSentuh tombol 'Masuk' untuk melanjutkan!",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ]),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profil()));
                    },
                    child: FittedBox(
                        child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(194, 76, 175, 79),
                                blurRadius: 6,
                                offset: Offset(4, 6))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          ),
                          Text(
                            '  MASUK',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )))
              ],
            );
          });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    cekLogin();
  }

  void cekLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    // ignore: avoid_print
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Profil()));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 29, 0, 29),
                  Color.fromARGB(255, 8, 0, 8),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 128,
                  width: 128,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 128,
                    height: 128,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
                  height: 480,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 120, 0, 136),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 187, 2, 211),
                            blurRadius: 6,
                            offset: Offset(6, 8))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "My Profile Apps",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 123, 0)),
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Silahkan Login Pada Akun Anda",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextField(
                          controller: emailController,
                          // onChanged: (e) => email = e,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.grey,
                            ),
                            labelText: "Alamat E-mail",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextField(
                          controller: passwordController,
                          // onChanged: (p) => password = p,
                          obscureText: true,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.grey,
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                  value: _isCek,
                                  onChanged: (value) {
                                    setState(() {
                                      _isCek = value!;
                                    });
                                  }),
                            ),
                            const SizedBox(width: 5),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       _isCek = true;
                            //     });
                            //   },
                            //   child: const Text(
                            //     "Ingat Saya",
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            const Text(
                              "Ingat Saya",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: click,
                              child: const Text(
                                "Lupa Password ?",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 255, 81, 139),
                                    blurRadius: 6,
                                    offset: Offset(4, 6))
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          login();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Atau Login Dengan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: click,
                              icon: const Icon(FontAwesomeIcons.facebook,
                                  color: Colors.blue)),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.github,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.apple,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: Colors.yellow,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Asep Koswara \u00A9 2022",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
