import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz_app1/forgot_password.dart';
import 'package:quizz_app1/registercreen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  bool remember = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurpleAccent,
          title: Container(
            child: Row(
              children: [
                Container(
                  child: (Expanded(
                    child: (Column(
                      children: [],
                    )),
                    flex: 0,
                  )),
                ),
                Container(
                  child: (Expanded(
                    child: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )),
                    flex: 2,
                  )),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('images/1.png'),
                width: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in with your email and password\n'
                      ' or continue with social media',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _username,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 42,
                            vertical: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Colors.deepPurpleAccent,
                              )),
                          suffixIcon: Icon(Icons.person)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      controller: _password,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 42,
                            vertical: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Colors.deepPurpleAccent,
                              )),
                          suffixIcon: Icon(Icons.lock_outline_sharp)),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Forgot_password())),
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: 200,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          child: Text(
                            'LOGIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Nuito'),
                          ),
                          onPressed: () async {
                            try {
                              final _user = _auth.signInWithEmailAndPassword(
                                  email: _username.text,
                                  password: _password.text);
                              _auth.authStateChanges().listen((event) {
                                if (event != null) {
                                  _username.clear();
                                  _password.clear();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'login',
                                    (route) => false,
                                  );
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Email hoặc Mật Khẩu không Đúng'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            } catch (e) {
                              final snackBar = SnackBar(
                                  content: Text('Lỗi Kết Nối Đến Server'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.transparent))),
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mail),
                    color: Colors.red,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
