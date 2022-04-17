import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:arthur/models/subscriber.dart';

Widget buildSubscriberTile(Subscriber subscriber) => ListTile(
    isThreeLine: true,
    leading: const CircleAvatar(
        // backgroundColor:
        //     subscriber.hasClaimed == false ? Colors.red : Colors.green,
        ),
    title: Text(subscriber.firstName + " " + subscriber.lastName),
    subtitle: Text(subscriber.xuID),
    trailing: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(subscriber.editor),
      ],
    ));

String formatDate(DateTime? date) {
  if (date == null) return "no claim";
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(date);
  return formatted;
}
