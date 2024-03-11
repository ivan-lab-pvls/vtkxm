enum EPeriodicityRepair {
  rarely("Rarely"),
  periodically("Periodically"),
  often("Often");

  const EPeriodicityRepair(this.text);
  final String text;
}

class UserItem {
  String? name;
  int? repairedItemsCount;
  EPeriodicityRepair? type;

  UserItem({this.name, this.type, this.repairedItemsCount});

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      name: parsedJson['name'] ?? "",
      repairedItemsCount: parsedJson['repairedItemsCount'] ?? 0,
      type: EPeriodicityRepair.values.byName(parsedJson['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "repairedItemsCount": repairedItemsCount,
      "type": type!.name,
    };
  }
}
