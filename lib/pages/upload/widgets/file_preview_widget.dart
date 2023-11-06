import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/model/selected_file.dart';
import 'package:flutter/material.dart';

class FilePreview extends StatelessWidget {
  const FilePreview({
    super.key,
    required this.file,
    required this.onRemovePressed,
    required this.onSubmit,
  });

  final SelectedFile file;
  final Function() onRemovePressed;
  final Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(primaryColorCode).withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/pdf.png",
                  width: 72,
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(file.mime),
                    Text(file.size),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                        foregroundColor: Colors.red,
                      ),
                      onPressed: onRemovePressed,
                      child: const Text('Remove'),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.25),
              ),
              onPressed: onSubmit,
              icon: const Icon(
                Icons.send_outlined,
                size: 16,
              ),
              label: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
