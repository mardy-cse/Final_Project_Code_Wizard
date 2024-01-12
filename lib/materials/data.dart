import 'package:flutter/material.dart';
class data extends StatelessWidget {
  const data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBar('hello'),
      ),
    );
  }
}

Widget _appBar(String text){
  return Text(text);
}