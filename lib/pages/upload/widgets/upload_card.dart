import 'package:devhack_2023/pages/report/dashboard.dart';
import 'package:devhack_2023/models/selected_file.dart';
import 'package:devhack_2023/pages/upload/widgets/dropzone_widget.dart';
import 'package:devhack_2023/pages/upload/widgets/loading_widget.dart';
import 'package:devhack_2023/widgets/responsive.dart';
import 'package:devhack_2023/services/innotalent_service.dart';
import 'package:devhack_2023/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'file_preview_widget.dart';

class UploadCard extends StatefulWidget {
  const UploadCard({super.key});

  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  SelectedFile? file;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload a resume:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: Responsive.isMobile(context) ? 9 / 4 : 16 / 6,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: loading
                  ? const SizedBox(
                      height: 180,
                      child: LoadingWidget(),
                    )
                  : file != null
                      ? FilePreview(
                          file: file!,
                          onRemovePressed: () => setState(() => file = null),
                          onSubmit: () async {
                            setState(() => loading = true);

                            try {
                              InnotalentService innotalent =
                                  InnotalentService();
                              final talentId = await innotalent
                                  .submitApplication(file!.data);

                              final talentStat =
                                  await innotalent.getTalentStat(talentId);

                              if (context.mounted) {
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(
                                      talentStat: talentStat,
                                    ),
                                  ),
                                )
                                    .then((value) {
                                  setState(() {
                                    file = null;
                                    loading = false;
                                  });
                                });
                              }
                            } catch (e) {
                              if (mounted) setState(() => loading = false);
                              Fluttertoast.showToast(
                                msg:
                                    'Something went wrong. Please try again later.',
                                timeInSecForIosWeb: 3,
                                webBgColor: '#394b4e',
                                textColor: Colors.white,
                              );
                            }
                          },
                        )
                      : DropzoneWidget(
                          onDroppedFile: (file) =>
                              setState(() => this.file = file),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
