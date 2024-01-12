import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
class UserProfile extends StatelessWidget {
  var size, height, width;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:AssetImage('assets/icons/Avatar-Profile-PNG-Picture.png'),
                maxRadius: 50,
              ),
              Container(
                  width: width*0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name'),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Adam',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Last Name'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Smith',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Email'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'adamsmith@gmail.com',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Password'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '**********',
                        ),
                      ),
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
              ElevatedButton(onPressed: (){},
                  child: Text('Update'))
            ],
          ),
        )
      ),
    );
  }
}
