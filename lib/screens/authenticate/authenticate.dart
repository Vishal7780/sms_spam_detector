import 'package:flutter/material.dart';
import 'package:dummy/screens/authenticate/register.dart';
import 'package:dummy/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  @override
  ToggleView(){
    setState(()=>showSignIn=!showSignIn);
  }
  Widget build(BuildContext context) {
    if(showSignIn==true){
      return SignIn(ToggleView:ToggleView);
    }
    else{
      return Register(ToggleView:ToggleView);
    }
  }
}