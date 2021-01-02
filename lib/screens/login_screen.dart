import 'package:e_commerce_appp/constants.dart';
import 'package:e_commerce_appp/screens/signup_screen.dart';
import 'package:e_commerce_appp/widgets/custom_image_buy_icon.dart';
import 'package:e_commerce_appp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_appp/services/auth.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email,_password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              CustomImageBuyIcon(
                text: "Shop Now",
                image: "images/icons/buy2.png",
              ),
              SizedBox(
                height: height * 0.1,
              ),
              CustomTextField(
                onClick: (value){
                  _email = value;
                },
                hint: "Enter Your Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                onClick: (value){
                  _password = value;
                },
                hint: "Enter Your Password",
                icon: Icons.lock,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async
                  {
                   if(_globalKey.currentState.validate())
                   {
                      _globalKey.currentState.save();
                      final result = await _auth.signIp(_email, _password);
                      print(result.user.uid);
                   }
                  },
                  color: Colors.black,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don\'t have an account ?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SingUpScreen.id);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
