import 'package:african_countries/consts/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Theme/colors.dart';


class SearchWidget extends StatefulWidget {
  final TextEditingController searchInputController;
  final Function(String) onTextChange;

  SearchWidget(
      {super.key,
      required this.searchInputController,
      required this.onTextChange});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}


class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  Color prefixIconColor = CustomTheme.gray;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.searchInputController,
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontFamily: 'Paradroid',
          fontWeight: FontWeight.w400,
          fontSize: smallTextSize,
          color: CustomTheme.almostWhite,
        ),
      ),
      hintText: 'Search...',
      hintStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontFamily: 'Paradroid',
          fontWeight: FontWeight.w400,
          fontSize: smallTextSize,
          color: CustomTheme.almostWhite,
        ),
      ),
      padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      ),
      backgroundColor:
          const WidgetStatePropertyAll<Color>(Color.fromARGB(0, 0, 100, 80)),
      leading: Icon(Icons.search, color: prefixIconColor),
      side: const WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: CustomTheme.grey4)),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      onTap: () {
        setState(() {
          prefixIconColor = CustomTheme.orange;
        });
      },
      onChanged: widget.onTextChange,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }
}
