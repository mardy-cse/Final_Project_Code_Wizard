import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:code_wizard_v1/pages/home_screen.dart';
import '../bottom_navbar.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  //var email ='', pass='';
  final formKey = GlobalKey<FormState>();
  bool _obscureText = false;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 33),
              child: Text('Create \nNew Account', style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.4,
                  left: 35,
                  right: 35,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        emailTextController.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !RegExp('[a-z0-9+_.-]+@[a-z0-9.-]+.[a-z]').hasMatch(value!)){
                          return "Enter currect E-mail";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      onChanged: (value) {
                        passwordTextController.text = value;
                      },

                      decoration: InputDecoration(
                        labelText: "Password",
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        // suffix: GestureDetector(onTap: (){
                        //   setState(() {
                        //    _obscureText = !_obscureText;
                        //   });
                        // },
                        //   child: Icon(_obscureText ?
                        //   Icons.visibility_off : Icons.visibility,
                        //     //size: 20,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !RegExp('[0-9a-zA-Z]{6,}').hasMatch(value!)){
                          return "Password is week";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (value){
                      },
                    ),
                    SizedBox(height: 50,),
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade600
                          ),
                          onPressed: ()async {
                            if (formKey.currentState != null && formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential =
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailTextController.text,
                                  password: passwordTextController.text,
                                );

                                if (userCredential.user != null) {
                                  await FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(userCredential.user!.email)
                                      .set({
                                    'username': emailTextController.text.split("@")[0],
                                    'lastname': 'Empty..'
                                    // Add other user data if needed
                                  });

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
                                }
                              } on FirebaseAuthException catch (e) {
                                // Handle FirebaseAuthException
                              } catch (e) {
                                // Handle other exceptions
                              }
                            } else {
                              print('Unsuccessful');
                            }
                          },
                          child: Text('Sign Up', style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                          ),)),
                    ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // SizedBox(
                    //   height: 45,
                    //   width: 140,
                    //   child: ElevatedButton(onPressed: (){
                    //     Navigator.pop(context);
                    //   },
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.blueGrey,
                    //       ),
                    //       child: Text('Back', style: TextStyle(
                    //         color: Colors.white,
                    //         letterSpacing: 3,
                    //       ),)),
                    // ),
                  ],
                ),
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}
