import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/upload/upload_page.dart';

class UploadMain extends StatelessWidget {
  UploadMain({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'InnoTalent Engine',
        ),
        backgroundColor: Colors.transparent,
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: UploadPage(scaffoldKey: _scaffoldKey),
            ),
          ],
        ),
      ),
    );
  }
}
