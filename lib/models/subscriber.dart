class Subscriber {
  // String id;
  String xuID;
  String firstName;
  String lastName;
  String editor;

  Subscriber(
      {
      // required this.id,
      required this.xuID,
      required this.firstName,
      required this.lastName,
      required this.editor});

  static Subscriber subscriberFromJson(Map<String, dynamic> data) => Subscriber(
      // id: data['id'],
      xuID: data['xuID'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      editor: data['editor']);

  Map<String, dynamic> _subscriberToJson(Subscriber sub) {
    return {
      // 'id': sub.id,
      'xuID': sub.xuID,
      'firstName': sub.firstName,
      'lastName': sub.lastName,
      'editor': sub.editor
    };
  }

  final testSubscribers = <Subscriber>[
    // Subscriber(
    //     // id: "1",
    //     xuID: "2021",
    //     firstName: "James",
    //     lastName: "Jilhaney",
    //     hasClaimed: false,
    //     claimDate: null,
    //     editor: null),
    // Subscriber(
    //     // id: "2",
    //     xuID: "2022",
    //     firstName: "Gbriel",
    //     lastName: "Orpilla",
    //     hasClaimed: true,
    //     claimDate: DateTime.now(),
    //     editor: "James Jilhaney (2022)" //
    //     ),
  ];
}
