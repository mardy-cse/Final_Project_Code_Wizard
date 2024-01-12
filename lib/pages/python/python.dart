import 'package:flutter/material.dart';

import 'ban.dart';
import 'eng.dart';

class Python_variable extends StatelessWidget {
  const Python_variable({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Variables'),
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
            EngVersion(),
            BanVersion(),
          ],
        ),
      ),
    );
  }
}
