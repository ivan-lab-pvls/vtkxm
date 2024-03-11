enum EDeadLine {
  noDeadline("No deadline"),
  month("Within a month"),
  week("During the week"),
  days('A couple of days');

  const EDeadLine(this.text);
  final String text;
}

class BrokenItem {
  String? id;
  String? name;
  String? category;
  String? reason;
  String? photo;
  String? description;
  EDeadLine? deadline;
  bool? isRepaired;

  BrokenItem(
      {this.name,
      this.id,
      this.category,
      this.reason,
      this.photo,
      this.description,
      this.isRepaired,
      this.deadline});

  factory BrokenItem.fromJson(Map<String, dynamic> parsedJson) {
    return BrokenItem(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? "",
      category: parsedJson['category'] ?? "",
      photo: parsedJson['photo'] ?? "",
      description: parsedJson['description'] ?? "",
      deadline: EDeadLine.values.byName(parsedJson['deadline']),
      reason: parsedJson['reason'] ?? "",
      isRepaired: parsedJson['isRepaired'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "name": name,
      "reason": reason,
      "category": category,
      "photo": photo,
      "description": description,
      "deadline": deadline!.name,
      "isRepaired": isRepaired
    };
  }
}
