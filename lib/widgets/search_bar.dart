import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget(
      {required this.text,
      required this.hintText,
      required this.onChanged,
      Key? key})
      : super(key: key);

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  List? subscribers;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSubs() async {
      widget.subscribers = await getSubscriberListItems();
    }

    getSubs();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.white);
    final styleHint = TextStyle(color: Colors.grey[200]);
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

  Future<List> getSubscriberListItems() async {
    List list = [];
    var subscriberQuerySnapshotMap =
        await FirebaseFirestore.instance.collection("Subscribers").get();

    if (subscriberQuerySnapshotMap.docs.isNotEmpty) {
      for (var doc in subscriberQuerySnapshotMap.docs) {
        list.add(doc);
      }
    }
    return list;
  }
}
