import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {required this.controller,
      required this.fieldText,
      required this.hintText,
      this.isHiddenField,
      required this.leadingIcon,
      required this.suffixIcon,
      Key? key})
      : super(key: key);

  TextEditingController controller = TextEditingController();
  bool? isHiddenField;
  String fieldText;
  String hintText;
  IconData leadingIcon;
  IconData suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isHiddenField ?? false,
        decoration: InputDecoration(
          label: Text(widget.fieldText),
          isDense: true,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.leadingIcon),
          suffixIcon: widget.controller.text.isNotEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    widget.controller.clear();
                  },
                  icon: const Icon(Icons.close)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
