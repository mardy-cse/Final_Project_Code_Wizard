import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_wizard_v1/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../auth/login_screen.dart';
import 'c programming/c_prog.dart';
import 'cpp/cpp_contents.dart';
import 'dart/dart.dart';
import 'flutter/flutter.dart';
import 'html/html.dart';
import 'kotlin/kotlin.dart';
import 'python/py.dart';

class HomeScreen extends StatelessWidget {
  var size, height, width;
  final _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Code Wizard',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),

        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: height*0.3,
                decoration: BoxDecoration(
                border: Border(
                bottom: BorderSide(
                  width: 0.5,
                ),
              ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: height*0.1,
                        width: width*0.4,
                        child: Image.asset('assets/icons/Logo.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/icons/Avatar-Profile-PNG-Picture.png'),
                            maxRadius: 40,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        final userData = snapshot.data!.data() as Map<String, dynamic>;
                                        return Text(userData['username'], style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                        );
                                      }
                                      else if (snapshot.hasError){
                                        return Center(
                                          child: Text('Error${snapshot.error}'),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                ),

                                Text(currentUser.email!)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
                  },
                  child: _buildDrawer(context,'assets/icons/person.png','Profile')),
              _buildDrawer(context,'assets/icons/setting.png','Setting'),
              _buildDrawer(context,'assets/icons/star.png','Rate Us'),
              _buildDrawer(context,'assets/icons/share.png','Share'),
              InkWell(
                  onTap: () async{
                    await _auth.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));
                  },
                  child: _buildDrawer(context,'assets/icons/logout.png','Log Out')),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.3,
                        child: Lottie.asset('assets/animation/gzPxkrTChN.json'),
                      ),
                      //Popular Courses
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'Popular Courses',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                      //Popular Courses Elements
                      Container(
                        height: height * 0.15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => C_Prog(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-c-programming-96.png', 'C')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => cpp_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-c-96.png', 'C++')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => python_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-python-96.png', 'Python')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => kotlin_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-kotlin-96.png', 'Kotlin')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => html_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-html-96.png', 'HTML')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => dart_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-dart-96.png', 'Dart')),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => flutter_home(),));
                                },
                                child: _buildPopularCourses(context, 'assets/icons/icons8-flutter-96.png', 'Flutter')),
                          ],
                        ),
                      ),
                      //All Courses
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'All Courses',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                      //All Courses Elements
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => C_Prog(),));
                        },
                          child: _buildAllCourses(context,'assets/icons/icons8-c-programming-96.png','C')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-c-96.png','C++')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-java-96.png','Java')),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => python_home(),));
                          },
                          child: _buildAllCourses(context,'assets/icons/icons8-python-96.png','Python')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-kotlin-96.png','Kotlin')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-javascript-96.png','JavaScript')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-html-96.png','HTML')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-css-96.png','CSS')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-dart-96.png','Dart')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-ruby-96.png','Ruby')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-swift-96.png','Swift')),
                      InkWell(
                          onTap: (){},
                          child: _buildAllCourses(context,'assets/icons/icons8-wordpress-96.png','Wordpress')
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget _buildPopularCourses(BuildContext context, String path, String text){
  return Container(
    width: MediaQuery.of(context).size.width*0.25,
    child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height*0.1,
            child: Image.asset(path)),
        Container(
          child: Text(text,
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins'
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildAllCourses(BuildContext context, String path, String text){
  return Container(
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height*0.015,
      left: MediaQuery.of(context).size.height*0.015,
      right: MediaQuery.of(context).size.height*0.015,
    ),
    height: MediaQuery.of(context).size.height*0.11,
    width: MediaQuery.of(context).size.width*1,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            offset: Offset(2, 3),
            blurRadius: 10),
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width* 0.3,
          child: Image.asset(path),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          width: MediaQuery.of(context).size.width* 0.60,
          child: Text(text,
            style: TextStyle(
              fontSize: 25,
                fontFamily: 'Poppins'
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDrawer(BuildContext context, String path, String text){
  return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.7,
          height: MediaQuery.of(context).size.height*0.06,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 0.2,
                ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height*0.03,
                child: Image.asset(path),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.03,
                child: Center(child: Text(text, style: TextStyle(
                    fontFamily: 'Poppins',
                  fontSize: 17
                ),)),
              ),
            ],
          ),
        ),
      ],
    );
}