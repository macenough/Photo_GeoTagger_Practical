import 'dart:convert';
import 'dart:io';

import 'package:camera_located/app/config/app_colors.dart';
import 'package:camera_located/app/config/app_constants.dart';
import 'package:camera_located/app/config/size_manager.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 1.2,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.file(
              File(
                item.isNotEmpty ? item['imagePath'] : null,
              ),
              fit: BoxFit.cover,
height: SizeManager.height(context)*0.3,
              width: SizeManager.height(context)*0.3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${AppConstants.labelLat} ${item['latitude']}'),

              Text('Longitude: ${item['longitude']}'),
            ],
          ),
        ],
      ),
    );
  }
}
