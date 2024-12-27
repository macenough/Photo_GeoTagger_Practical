import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../config/app_constants.dart';

//pickImage Method
Future<XFile?> pickImage({required ImageSource source}) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  return pickedFile != null ? XFile(pickedFile.path) : null;
}

showImageDialog(
    {required BuildContext context,
    required VoidCallback onTapGallery,
    required VoidCallback onTapCamera}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppConstants.labelChooseImg,
            style: TextStyle(
                fontSize: 16.5,
                color: Theme.of(context).unselectedWidgetColor.withOpacity(0.8),
                fontWeight: FontWeight.w400),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTapGallery,
                child: Text(
                  AppConstants.labelGallery,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 15),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onTapCamera,
                child: Text(
                  AppConstants.labelCamera,
                  style: TextStyle(
                      color: Theme.of(context).unselectedWidgetColor,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        );
      });
}
