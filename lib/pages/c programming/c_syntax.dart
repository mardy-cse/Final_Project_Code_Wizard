import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class C_Syntax extends StatelessWidget {
  const C_Syntax({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _appBar('Introduction'),
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
  return SfPdfViewer.asset('assets/pdf/csyntaxban.pdf');
}
Widget _eng(BuildContext context){
  return SfPdfViewer.asset('assets/pdf/Csyntaxeng.pdf');
}