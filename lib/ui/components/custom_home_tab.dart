import 'package:flutter/material.dart';


class CustomHomeTab extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CustomHomeTab(
      {super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
        iconMargin: EdgeInsets.zero,
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? const Color(0xFF040405) : const Color(0xFF696969)),
                ),
              ),
            ],
          ),
        ));
  }
}
