import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_wizard_v1/materials/data.dart';
import 'package:code_wizard_v1/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var size, height, width;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection('Users');


  Future<void> editField (String field) async{
    String newValue= "";
    await showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Edit $field",
            style: TextStyle(color: Colors.black),
          ),
          content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.black),
            decoration:  InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value){
              newValue = value;
            },
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancle')),

            TextButton(onPressed: (){
              Navigator.of(context).pop(newValue);
            }, child: Text('Save')),
          ],
        )
    );
    if(newValue.trim().length > 0){
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: width*1,
        height: height*1,
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  CircleAvatar(
                    backgroundImage:AssetImage('assets/icons/Avatar-Profile-PNG-Picture.png'),
                    maxRadius: 50,
                  ),
                  SizedBox(height: 10,),
                  Text(currentUser.email!,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: width*0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextBox(
                            text: userData['username'],
                            sectionName: "User Name",
                            onPressed: ()=> editField('username'),
                        ),
                        MyTextBox(
                          text: userData['lastname'],
                          sectionName: "Last Name",
                          onPressed: ()=> editField('lastname'),
                        ),
                        // Text('First Name'),
                        // TextField(
                        //   //text:  userData['username'],
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        // SizedBox(height: 10,),
                        // Text('Last Name'),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     hintText: 'Smith',
                        //   ),
                        // ),
                        // SizedBox(height: 10,),
                        // Text('Email'),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     hintText: 'adamsmith@gmail.com',
                        //   ),
                        // ),
                        // SizedBox(height: 10,),
                        // Text('Password'),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     hintText: '**********',
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        Text('Date of Birth'),
                        DOBInputField(
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          showLabel: true,
                          dateFormatType: DateFormatType.DDMMYYYY,
                          autovalidateMode: AutovalidateMode.always,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: (){

                    Navigator.pop(context);
                  },
                      child: Text('Save'))
                ],

              );
            }else if(snapshot.hasError){
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ),
    );
  }
}
