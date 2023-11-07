import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/upload/widgets/upload_card.dart';
import 'package:devhack_2023/Responsive.dart';

class UploadPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const UploadPage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              const UploadCard(),
            ],
          ),
        ),
      ),
    );
  }
}
