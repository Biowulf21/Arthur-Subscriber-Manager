import 'package:arthur/models/subscriber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  late List<Subscriber> subscribers;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.subscribers = testSubscribers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(FirebaseAuth
                        .instance.currentUser?.photoURL ??
                    "https://scontent.fcgm1-1.fna.fbcdn.net/v/t39.30808-6/270040069_2278441245629027_1660321841862918105_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGQSoWPeM7_ose-kYhtIDzdErgH6H8Zt9sSuAfofxm322hKswxuG9OkiZAK2QXnjFrlT-G2TFPoFSasYQ3H9D_5&_nc_ohc=qnq7LMcWd34AX8RkXwA&_nc_ht=scontent.fcgm1-1.fna&oh=00_AT-lmQtMA0rbNJP5YzqiCBTSAbvqTa1B079wo49faD7BZg&oe=62614EAD"),
              ),
            ),
          ],
          title: const Text("Arthur Subscriber Manager"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.subscribers.length,
                itemBuilder: ((context, index) {
                  final subscriber = widget.subscribers[index];

                  return buildSubscriberTile(subscriber);
                }),
              ),
            ),
          ],
        ));
    // Column(
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             FirebaseAuth.instance.signOut();
    //           },
    //           child: const Text("Logout")),
    //     ],
    //   ),
    // );
  }

  Widget buildSubscriberTile(Subscriber subscriber) => ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor:
            subscriber.hasClaimed == false ? Colors.red : Colors.green,
      ),
      title: Text(subscriber.firstName + " " + subscriber.lastName),
      subtitle: Text(subscriber.xuID),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            formatDate(subscriber.claimDate),
          ),
          Text(subscriber.editor ?? "no claim"),
        ],
      ));

  String formatDate(DateTime? date) {
    if (date == null) return "no claim";
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
