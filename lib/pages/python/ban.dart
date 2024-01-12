
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class BanVersion extends StatefulWidget {
  const BanVersion({super.key});

  @override
  State<BanVersion> createState() => _EngVersionState();
}

class _EngVersionState extends State<BanVersion> {
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset('assets/pdf/payban2.pdf');
  }
}
