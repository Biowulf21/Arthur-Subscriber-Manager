import 'package:arthur/models/subscriber.dart';
import 'package:flutter/material.dart';

String query = "";
Widget buildSearchBar() => SearchWidget(
    text: query, hintText: "ID or Last Name", onChanged: searchbook);

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {required this.text,
      required this.hintText,
      required this.onChanged,
      Key? key})
      : super(key: key);

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const styleActive = const TextStyle(color: Colors.black);
    const styleHint = const TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;
    return Container(
      height: 42.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

void searchbook(String query) {
  final subscribers = testSubscribers.where((subscriber) {
    final lastNameLower = subscriber.lastName.toLowerCase();
    final firstNameLower = subscriber.firstName.toLowerCase();
    final searchQueryLower = query.toLowerCase();

    return lastNameLower.contains(searchQueryLower);
  }).toList();
}
