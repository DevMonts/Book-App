import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImageWidget extends StatefulWidget {
  const AppImageWidget({
    super.key,
    required this.img,
    required this.onImageSelected,
    required this.onImageDeleted,
  });
  final XFile? img;
  final VoidCallback onImageDeleted;
  final VoidCallback onImageSelected;

  @override
  State<AppImageWidget> createState() => _AppImageWidgetState();
}

class _AppImageWidgetState extends State<AppImageWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: (widget.img == null)
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: Icon(
                Icons.add_photo_alternate,
              ),
              onPressed: () async {
                widget.onImageSelected();
              },
            )
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: DecorationImage(
                      image: FileImage(
                        File(
                          widget.img!.path,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    onPressed: () {
                      widget.onImageDeleted();
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
