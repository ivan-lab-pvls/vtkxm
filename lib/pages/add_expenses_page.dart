import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:repair_mate_app/model/expense_item.dart';
import 'package:repair_mate_app/pages/add_photo_page.dart';
import 'package:repair_mate_app/pages/description_page.dart';

List<ExpenseItem> expenses = [];

class AddExpensesPage extends StatefulWidget {
  const AddExpensesPage(
      {super.key, required this.id, required this.isEditMode});
  final String id;
  final bool isEditMode;

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  TextEditingController nameController1 = TextEditingController();
  TextEditingController costController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController costController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController costController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController costController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();
  TextEditingController costController5 = TextEditingController();
  TextEditingController nameController6 = TextEditingController();
  TextEditingController costController6 = TextEditingController();
  TextEditingController currentNameController = TextEditingController();
  TextEditingController currentCostController = TextEditingController();
  List<ExpenseItem> newExpenses = [];
  int expenseCount = 1;
  @override
  void initState() {
    super.initState();
    int count = 0;
    for (var expense
        in expenses.where((element) => element.id == currentBrokenItem.id)) {
      count++;
      if (count == 1) {
        nameController1.text = expense.description!;
        costController1.text = expense.cost!.toStringAsFixed(0);
      } else if (count == 2) {
        nameController2.text = expense.description!;
        costController2.text = expense.cost!.toStringAsFixed(0);
      } else if (count == 3) {
        nameController3.text = expense.description!;
        costController3.text = expense.cost!.toStringAsFixed(0);
      } else if (count == 4) {
        nameController4.text = expense.description!;
        costController4.text = expense.cost!.toStringAsFixed(0);
      } else if (count == 5) {
        nameController5.text = expense.description!;
        costController5.text = expense.cost!.toStringAsFixed(0);
      } else if (count == 6) {
        nameController6.text = expense.description!;
        costController6.text = expense.cost!.toStringAsFixed(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 26),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Color(0xFF0075FF),
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFF0075FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Broken item',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              widget.isEditMode ? getExpensesOfBrokenItem() : getExpenses(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: InkWell(
                  onTap: () {
                    if (!widget.isEditMode) {
                      if (nameController1.text.isNotEmpty &&
                          costController1.text.isNotEmpty) {
                        expenseCount++;
                        for (var i = 0; i < expenseCount; i++) {
                          newExpenses.add(ExpenseItem(id: widget.id, cost: 0));
                        }
                        setState(() {});
                      }
                    } else {
                      expenses
                          .add(ExpenseItem(cost: 0, id: currentBrokenItem.id));
                      setState(() {});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: (nameController1.text.isNotEmpty &&
                                costController1.text.isNotEmpty)
                            ? const Color(0xFF0075FF)
                            : const Color(0xFFDBDBDB)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            color: (nameController1.text.isNotEmpty &&
                                    costController1.text.isNotEmpty)
                                ? Colors.white
                                : Colors.black.withOpacity(0.25)),
                        Text(
                          'Add new',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: (nameController1.text.isNotEmpty &&
                                      costController1.text.isNotEmpty)
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.25),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (widget.isEditMode) {
                  int count = 0;
                  for (var expense in expenses
                      .where((element) => element.id == currentBrokenItem.id)) {
                    count++;
                    if (count == 1) {
                      expense.description = nameController1.text;
                      expense.cost = double.tryParse(costController1.text);
                    } else if (count == 2) {
                      expense.description = nameController2.text;
                      expense.cost = double.tryParse(costController2.text);
                    } else if (count == 3) {
                      expense.description = nameController3.text;
                      expense.cost = double.tryParse(costController3.text);
                    } else if (count == 4) {
                      expense.description = nameController4.text;
                      expense.cost = double.tryParse(costController4.text);
                    } else if (count == 5) {
                      expense.description = nameController5.text;
                      expense.cost = double.tryParse(costController5.text);
                    } else if (count == 6) {
                      expense.description = nameController6.text;
                      expense.cost = double.tryParse(costController6.text);
                    }
                  }
                } else {
                  if (nameController1.text.isNotEmpty &&
                      costController1.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController1.text);
                    expense.description = nameController1.text;
                    expenses.add(expense);
                  }
                  if (nameController2.text.isNotEmpty &&
                      costController2.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController2.text);
                    expense.description = nameController2.text;
                    expenses.add(expense);
                  }
                  if (nameController3.text.isNotEmpty &&
                      costController3.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController3.text);
                    expense.description = nameController3.text;
                    expenses.add(expense);
                  }
                  if (nameController4.text.isNotEmpty &&
                      costController4.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController4.text);
                    expense.description = nameController4.text;
                    expenses.add(expense);
                  }
                  if (nameController5.text.isNotEmpty &&
                      costController5.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController5.text);
                    expense.description = nameController5.text;
                    expenses.add(expense);
                  }
                  if (nameController6.text.isNotEmpty &&
                      costController6.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.id = widget.id;
                    expense.cost = double.parse(costController6.text);
                    expense.description = nameController6.text;
                    expenses.add(expense);
                  }
                }
                if ((expenseCount == 1 &&
                        nameController1.text.isNotEmpty &&
                        costController1.text.isNotEmpty) ||
                    (expenseCount == 2 &&
                        nameController2.text.isNotEmpty &&
                        costController2.text.isNotEmpty) ||
                    (expenseCount == 3 &&
                        nameController3.text.isNotEmpty &&
                        costController3.text.isNotEmpty) ||
                    (expenseCount == 4 &&
                        nameController4.text.isNotEmpty &&
                        costController4.text.isNotEmpty) ||
                    (expenseCount == 5 &&
                        nameController5.text.isNotEmpty &&
                        costController5.text.isNotEmpty) ||
                    (expenseCount == 6 &&
                        nameController6.text.isNotEmpty &&
                        costController6.text.isNotEmpty)) {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddPhotoPage(
                              id: widget.isEditMode
                                  ? currentBrokenItem.id!
                                  : widget.id,
                              isEditMode: widget.isEditMode,
                            )),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: (expenseCount == 1 &&
                                nameController1.text.isNotEmpty &&
                                costController1.text.isNotEmpty) ||
                            (expenseCount == 2 &&
                                nameController2.text.isNotEmpty &&
                                costController2.text.isNotEmpty) ||
                            (expenseCount == 3 &&
                                nameController3.text.isNotEmpty &&
                                costController3.text.isNotEmpty) ||
                            (expenseCount == 4 &&
                                nameController4.text.isNotEmpty &&
                                costController4.text.isNotEmpty) ||
                            (expenseCount == 5 &&
                                nameController5.text.isNotEmpty &&
                                costController5.text.isNotEmpty) ||
                            (expenseCount == 6 &&
                                nameController6.text.isNotEmpty &&
                                costController6.text.isNotEmpty)
                        ? const Color(0xFF0075FF)
                        : const Color(0xFFDBDBDB)),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: (expenseCount == 1 &&
                                  nameController1.text.isNotEmpty &&
                                  costController1.text.isNotEmpty) ||
                              (expenseCount == 2 &&
                                  nameController2.text.isNotEmpty &&
                                  costController2.text.isNotEmpty) ||
                              (expenseCount == 3 &&
                                  nameController3.text.isNotEmpty &&
                                  costController3.text.isNotEmpty) ||
                              (expenseCount == 4 &&
                                  nameController4.text.isNotEmpty &&
                                  costController4.text.isNotEmpty) ||
                              (expenseCount == 5 &&
                                  nameController5.text.isNotEmpty &&
                                  costController5.text.isNotEmpty) ||
                              (expenseCount == 6 &&
                                  nameController6.text.isNotEmpty &&
                                  costController6.text.isNotEmpty)
                          ? Colors.white
                          : Colors.black.withOpacity(0.25),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getExpensesOfBrokenItem() {
    List<Widget> list = [];
    int count = 0;
    for (var expense
        in expenses.where((element) => element.id == currentBrokenItem.id)) {
      count++;
      if (count == 1) {
        currentNameController = nameController1;
        currentCostController = costController1;
      } else if (count == 2) {
        currentNameController = nameController2;
        currentCostController = costController2;
      } else if (count == 3) {
        currentNameController = nameController3;
        currentCostController = costController3;
      } else if (count == 4) {
        currentNameController = nameController4;
        currentCostController = costController4;
      } else if (count == 5) {
        currentNameController = nameController5;
        currentCostController = costController5;
      } else if (count == 6) {
        currentNameController = nameController6;
        currentCostController = costController6;
      }
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(
                  0xFFF3F3F3,
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Expense $count',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  cursorColor: Colors.grey,
                  controller: currentNameController,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'The name of the item',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                  ),
                  onChanged: (text) {
                    currentNameController.text = text;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.grey,
                  controller: currentCostController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                  ),
                  onChanged: (text) {
                    currentCostController.text = text;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      );
      list.add(const SizedBox(
        height: 16,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getExpenses() {
    List<Widget> list = [];

    for (var i = 0; i < expenseCount; i++) {
      if (i == 0) {
        currentNameController = nameController1;
        currentCostController = costController1;
      } else if (i == 1) {
        currentNameController = nameController2;
        currentCostController = costController2;
      } else if (i == 2) {
        currentNameController = nameController3;
        currentCostController = costController3;
      } else if (i == 3) {
        currentNameController = nameController4;
        currentCostController = costController4;
      } else if (i == 4) {
        currentNameController = nameController5;
        currentCostController = costController5;
      } else if (i == 5) {
        currentNameController = nameController6;
        currentCostController = costController6;
      }

      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(
                  0xFFF3F3F3,
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Expense ${i + 1}',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  cursorColor: Colors.grey,
                  controller: currentNameController
                  // i == 0
                  //     ? nameController1
                  //     : i == 1
                  //         ? nameController2
                  //         : i == 2
                  //             ? nameController3
                  //             : i == 3
                  //                 ? nameController4
                  //                 : i == 4
                  //                     ? nameController5
                  //                     : nameController6
                  ,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'The name of the item',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                  ),
                  onChanged: (text) {
                    currentNameController.text = text;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.grey,
                  controller: currentCostController
                  // i == 0
                  //     ? costController1
                  //     : i == 1
                  //         ? costController2
                  //         : i == 2
                  //             ? costController3
                  //             : i == 3
                  //                 ? costController4
                  //                 : i == 4
                  //                     ? costController5
                  //                     : costController6
                  ,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xFFECECEC), width: 1),
                    ),
                  ),
                  onChanged: (text) {
                    currentCostController.text = text;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      );
      list.add(const SizedBox(
        height: 16,
      ));
    }
    return Column(
      children: list,
    );
  }
}
