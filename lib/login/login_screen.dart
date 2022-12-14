import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/Color_app.dart';
import '../utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController domain = TextEditingController();
  bool _visible = false;
  // void saveuser(String user, String password) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("username", user);
  //   await prefs.setString("password", password);
  // }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: username,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Nhập tên đăng nhập',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: password,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Nhập mật khẩu',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDomainTF() {
    return Visibility(
        visible: _visible,
        child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  child: TextField(
                    controller: domain,
                    obscureText: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.domain,
                        color: Colors.white,
                      ),
                      hintText: 'Nhập tên miền',
                      hintStyle: kHintTextStyle,
                    ),
                  ),
                ),
              ],
            )));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          // final prefs = await SharedPreferences.getInstance();
          // if(domain.text.isNotEmpty){
          //   await constant.DC_adress(domain.text.toString());
          // }else{
          //   await constant.DC_adress("https://vldebtors-api.vllondon.co.uk");
          // }
          // await fn_login.fn_loginapp(username.text, password.text);
          // // String token = prefs.getString("token").toString();
          // // await fn_DataCustomer.getDataCustomer(token);
          // if (login.LoginSucces == true) {
          //   saveuser(username.text, password.text);
          //   Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Home_page()));
          // } else {
          //   _showErrorMessage(login.dataError);
          // }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: App_Color.green,
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                color: App_Color.Background,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   'assets/ic_app/icon_laucher.png',
                      //   height: 200,
                      //   width: 200,
                      // ),
                      // SizedBox(height: 30.0),
                      _buildDomainTF(),
                      SizedBox(height: 20.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildLoginBtn(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Đổi tên miền',
                            style: kHintTextStyle,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.swap_horiz_outlined,
                              color: _visible ? Colors.green : Colors.white54,
                            ),
                            onPressed: () {
                              setState(() {
                                _visible = !_visible;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showErrorMessage(String e) {
    showCupertinoDialog(
        context: context,
        builder: (context) => Theme(
              data: ThemeData.dark(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: CupertinoAlertDialog(
                    title: Text("Warning"),
                    content: Text(e),
                    actions: [
                      CupertinoDialogAction(
                          child: Text(
                            "Close",
                            style: TextStyle(color: App_Color.green),
                          ),
                          onPressed: () => Navigator.pop(context))
                    ]),
              ),
            ));
  }
}
