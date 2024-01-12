import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class EngVersion extends StatefulWidget {
  const EngVersion({super.key});

  @override
  State<EngVersion> createState() => _EngVersionState();
}

class _EngVersionState extends State<EngVersion> {
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset('assets/pdf/py.pdf');
  }
}
