import 'package:devhack_2023/pages/upload/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/widgets/menu.dart';
import 'package:devhack_2023/Responsive.dart';

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
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
          : null,
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
