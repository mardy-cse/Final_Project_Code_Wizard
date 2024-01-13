import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class Py_Syntax extends StatelessWidget {
  const Py_Syntax({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _appBar('Syntax'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'English',),
              Tab(text: 'Bangla',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _eng(context),
            _ban(context),
          ],
        ),
      ),
    );
  }
}
Widget _appBar(String text){
  return Text(text);
}
Widget _ban(BuildContext context){
  return SfPdfViewer.asset('assets/pdf/py_syntax_ban.pdf');
}
Widget _eng(BuildContext context){
  return SfPdfViewer.asset('assets/pdf/py_syntax_eng.pdf');
}