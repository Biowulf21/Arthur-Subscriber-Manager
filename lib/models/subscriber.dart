class Subscriber {
  String id;
  String xuID;
  String firstName;
  String lastName;
  bool hasClaimed;
  DateTime? claimDate;
  String? editor;

  Subscriber(
      {required this.id,
      required this.xuID,
      required this.firstName,
      required this.lastName,
      required this.hasClaimed,
      required this.claimDate,
      required this.editor});

  toJson(json) {
    json["id"] = id;
    json['xuID'] = xuID;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
  }
}

final testSubscribers = <Subscriber>[
  Subscriber(
      id: "1",
      xuID: "2021",
      firstName: "James",
      lastName: "Jilhaney",
      hasClaimed: false,
      claimDate: null,
      editor: null),
  Subscriber(
      id: "2",
      xuID: "2022",
      firstName: "Gbriel",
      lastName: "Orpilla",
      hasClaimed: true,
      claimDate: DateTime.now(),
      editor: "James Jilhaney (2022)" //
      ),
];
