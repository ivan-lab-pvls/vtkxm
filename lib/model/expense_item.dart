class ExpenseItem {
  String? id;
  String? description;
  double? cost;

  ExpenseItem({this.id, this.description, this.cost});

  factory ExpenseItem.fromJson(Map<String, dynamic> parsedJson) {
    return ExpenseItem(
      id: parsedJson['id'] ?? '',
      description: parsedJson['description'] ?? "",
      cost: parsedJson['cost'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "description": description,
      "cost": cost,
    };
  }
}
