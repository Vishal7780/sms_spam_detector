import 'package:flutter/material.dart';
import 'package:dummy/screens/Home/Home.dart';
import 'package:dummy/services/auth.dart';
import 'package:dummy/shared/loading.dart';
import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {

  final  ToggleView;
  const Register({Key? key,required this.ToggleView}) : super(key: key);

  @override
  State<Register> createState() => _registerState();
}

class _registerState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  var email='';
  var password='';
  var error='';
  bool loading=false;
  @override

  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor:Colors.grey[250],
      appBar: AppBar(
        backgroundColor:  Colors.grey[700],
        elevation: 0.0,
        title: const Text('Sign up'),
        actions: <Widget>[
          TextButton.icon(
            label: const Text("Sign in",
              style: TextStyle(color: Colors.green),
            ),

            icon:const Icon(Icons.person,color: Colors.green),

            onPressed:()  {
              widget.ToggleView();
            },
          )
        ],
      ),
      body: Container(

           padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
          child:Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[


                    Image.asset('assets/logo.png',
                        width:double.infinity,
                        height: 300,
                        fit:BoxFit.fill ),
                  SizedBox(height: 20,),
              TextFormField(

                decoration: InputDecoration(

                    labelText:'Email',
                    labelStyle:const TextStyle(
                      fontSize:14,
                      fontWeight:FontWeight.w400,

                    ),
                    prefixIcon: const Icon( Icons.email,size: 18,
                    color: Colors.yellow,),
                    enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey.shade200,width:2,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.yellow,width: 1.5,),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),

                    validator: (val)=>val!.isEmpty?'Enter the email':null,
                    onChanged: (val){
                      setState(()=>email=val);{
                      }
                    },
                  ),
                  SizedBox(height: 20,),
              TextFormField(

                decoration: InputDecoration(
                    labelText:'Password',
                    labelStyle:const TextStyle(
                      fontSize:14,
                      fontWeight:FontWeight.w400,

                    ),
                    prefixIcon: const Icon( Icons.password,size: 18,
                    color: Colors.yellow,),
                    enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey.shade200,width:2,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.yellow,width: 1.5,),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),

                    obscureText: true,
                    validator: (val)=>val!.length<6?'Enter the Password with more than 6 characters':null,
                    onChanged: ( val){
                      setState(()=>password=val);{
                      }
                    },

                  ),
                  SizedBox(height: 20,),
              TextFormField(

                decoration: InputDecoration(
                    labelText:'Re enter the password',
                    labelStyle:const TextStyle(
                      fontSize:14,
                      fontWeight:FontWeight.w400,

                    ),
                    prefixIcon: const Icon( Icons.password_outlined,size: 18,
                    color: Colors.yellow,),
                    enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey.shade200,width:2,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.yellow,width: 1.5,),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),

                    obscureText: true,
                    validator: (val)=>val!.length<6?'Enter the Password with more than 6 characters':null,
                    onChanged: ( val){
                      setState(()=>password=val);{
                      }
                    },

                  ),
                  SizedBox(height: 30),
              MaterialButton(

                minWidth: double.infinity,
                height:60,

                onPressed: ()async{
               if(_formKey.currentState!.validate()){
                 Navigator.push(context,
                 MaterialPageRoute(builder: (context) =>  Home()));

              setState(()=>loading=true);
                 dynamic result=await _auth.registerWithEmailandPassword(email, password);
                  if(result==null){
                 setState((){
                  error='enter the valid email id';
               loading=false;
          });
        }


      }
                },
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
                child: const Text("Sign Up",style: TextStyle(
                  fontWeight: FontWeight.w800,fontSize: 16,

                ),),
              ),


              // onPressed:  ()async{
                      //   if(_formKey.currentState!.validate()){
                      //     setState(()=>loading=true);
                      //     dynamic result=await _auth.registerWithEmailandPassword(email, password);
                      //     if(result==null){
                      //       setState((){
                      //         error='enter the valid email id';
                      //         loading=false;
                      //       });
                      //     }
                      //
                      //
                      //   }
                      // },




                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red,fontSize: 18),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
