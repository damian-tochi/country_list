import 'package:african_countries/ui/components/width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/values.dart';

Widget infoCard(String title, String value) {
  return Card(
    color: Colors.white70,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 13,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: smallTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          height(2),
          Text(value,
              style: const TextStyle(
                  fontSize: normalTextSize, fontWeight: FontWeight.w600)),
        ],
      ),
    ),
  );
}