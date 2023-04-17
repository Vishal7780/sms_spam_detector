import 'package:flutter/material.dart';
import 'package:dummy/models/user.dart';
import 'package:dummy/screens/Home/Home.dart';
import 'package:dummy/screens/authenticate/authenticate.dart';
import 'package:dummy/screens/authenticate/register.dart';
import 'package:dummy/screens/authenticate/sign_in.dart';
import 'package:provider/provider.dart';
class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserClass?>(context);
    print(user);
    if(user==null){
      print("object");
      return Authenticate();
    }
    else{
      print("holla");
      return Home();
    }
  }
}