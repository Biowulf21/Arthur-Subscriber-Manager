class Subscriber {
  String id;
  String xuID;
  String firstName;
  String lastName;

  Subscriber(
      {required this.id,
      required this.xuID,
      required this.firstName,
      required this.lastName});

  toJson(json) {
    json["id"] = id;
    json['xuID'] = xuID;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
  }
}
