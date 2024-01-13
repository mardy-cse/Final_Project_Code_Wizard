import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class CComment extends StatelessWidget {
  const CComment({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _appBar('Output'),
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
  return SfPdfViewer.asset('assets/pdf/coutputban.pdf');
}
Widget _eng(BuildContext context){
  return SfPdfViewer.asset('assets/pdf/C_comment.pdf');
}