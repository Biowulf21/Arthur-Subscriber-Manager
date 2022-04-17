import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSubscriber {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference subscribers =
      FirebaseFirestore.instance.collection('Subscribers');

  Future<List> getAllSubscribers() async {
    QuerySnapshot snapshot = await subscribers.get();
    final List allData = snapshot.docs.map((e) => e.data()).toList();
    print(allData.runtimeType);
    return allData;
  }

  // ListToSubscriberObject (List list){
  // for (list as item){

  // }
  // }
}
