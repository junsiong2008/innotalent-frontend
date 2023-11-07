import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/models/selected_file.dart';
import 'package:devhack_2023/responsive.dart';

class DropzoneWidget extends StatefulWidget {
  final ValueChanged<SelectedFile> onDroppedFile;

  const DropzoneWidget({
    super.key,
    required this.onDroppedFile,
  });

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(10),
        color:
            isHighlighted ? Colors.grey.withOpacity(0.2) : cardBackgroundColor,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          padding: EdgeInsets.zero,
          radius: const Radius.circular(5),
          strokeWidth: 2,
          dashPattern: const [8, 4],
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    DropzoneView(
                      onCreated: (controller) => this.controller = controller,
                      onDrop: _onReceive,
                      onHover: () => setState(() => isHighlighted = true),
                      onLeave: () => setState(() => isHighlighted = false),
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cloud_upload,
                            size: 64,
                          ),
                          const Text(
                            'Drop files here',
                            textAlign: TextAlign.center,
                          ),
                          _height(context),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.25),
                            ),
                            onPressed: () async {
                              final events = await controller.pickFiles();

                              if (events.isEmpty) return;

                              _onReceive(events.first);
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 24,
                            ),
                            label: const Text('Choose files'),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _height(BuildContext context) => SizedBox(
        height: Responsive.isDesktop(context) ? 30 : 20,
      );

  Future<void> _onReceive(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    final receivedFile = SelectedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    widget.onDroppedFile(receivedFile);

    setState(() {
      isHighlighted = false;
    });
  }
}
