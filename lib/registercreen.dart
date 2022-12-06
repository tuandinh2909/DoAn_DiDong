import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app1/loginscreen.dart';

class RegisterCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtUsername = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    TextEditingController txtConfirmPass = TextEditingController();
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Đăng Ký Tài Khoản'),
      // ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ĐĂNG KÝ',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent)),
                      Text('Nhanh chóng, dễ dàng',
                          style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 15,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  hintText: 'Họ và tên',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, //Cố định dòng labeltext lại, ko cần nhấn vào
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextFormField(
                controller: txtUsername,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  hintText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, //Cố định dòng labeltext lại, ko cần nhấn vào
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextFormField(
                controller: txtPassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    hintText: 'Mật khẩu',
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always, //Cố định dòng labeltext lại, ko cần nhấn vào
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextFormField(
                controller: txtConfirmPass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Xác nhận Mật Khẩu',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    hintText: 'Xác Nhận Mật Khẩu',
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always, //Cố định dòng labeltext lại, ko cần nhấn vào
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.deepPurpleAccent),
                  child: TextButton(
                    child: Text(
                      'ĐĂNG KÝ NGAY',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      try {
                        final newUser = _auth.createUserWithEmailAndPassword(
                            email: txtUsername.text,
                            password: txtPassword.text);
                        if (newUser != null) {
                          Navigator.pop(context, 'Đăng Ký Thành Công!');
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Tài Khoản Này Không Hợp Lệ'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (e) {
                        final snackBar =
                            SnackBar(content: Text('Có Lỗi Xảy ra!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              alignment: Alignment.center, //Chỉnh text ra giữa màn hình
              child: Text(
                'Hoặc',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                      border: Border.all(width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/gg.png', width: 50),
                      TextButton(
                        child: Text(
                          '       Tiếp tục với Google',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 56,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.all(Radius.circular(8)),
            //           color: Colors.white,
            //           border: Border.all(width: 1)), //Độ rộng của đường viền
            //       child: TextButton(
            //         child: Text(
            //           'Tiếp tục với Google',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 17,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bạn đã có tài khoản?'),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Text('Đăng Nhập',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurpleAccent)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
