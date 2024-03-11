import 'package:flutter/material.dart';
import 'package:repair_mate_app/model/broken_item.dart';
import 'package:repair_mate_app/pages/add_expenses_page.dart';
import 'package:repair_mate_app/pages/description_page.dart';
import 'package:uuid/uuid.dart';

List<BrokenItem> brokenItems = [];

class AddBrokenItemPage extends StatefulWidget {
  const AddBrokenItemPage({super.key, required this.isEditMode});
  final bool isEditMode;

  @override
  State<AddBrokenItemPage> createState() => _AddBrokenItemPageState();
}

class _AddBrokenItemPageState extends State<AddBrokenItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  List<EDeadLine> types = [
    EDeadLine.noDeadline,
    EDeadLine.month,
    EDeadLine.week,
    EDeadLine.days
  ];
  EDeadLine selected = EDeadLine.noDeadline;
  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      nameController.text = currentBrokenItem.name!;
      categoryController.text = currentBrokenItem.category!;
      reasonController.text = currentBrokenItem.reason!;
      selected = currentBrokenItem.deadline!;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: nameController,
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
                    fillColor: const Color(0xFFF3F3F3),
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
                    nameController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: categoryController,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'What category is the item',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    filled: true,
                    fillColor: const Color(0xFFF3F3F3),
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
                    categoryController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: reasonController,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25)),
                    hintText: 'What the reason for the breakdown',
                    filled: true,
                    fillColor: const Color(0xFFF3F3F3),
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
                    reasonController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Do you have deadline?',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getTypes(),
              )
            ]),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    categoryController.text.isNotEmpty &&
                    reasonController.text.isNotEmpty &&
                    !widget.isEditMode) {
                  BrokenItem brokenItem = BrokenItem();
                  brokenItem.id = const Uuid().v1();
                  brokenItem.name = nameController.text;
                  brokenItem.category = categoryController.text;
                  brokenItem.reason = reasonController.text;
                  brokenItem.deadline = selected;
                  brokenItems.add(brokenItem);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddExpensesPage(
                              isEditMode: false,
                              id: brokenItem.id!,
                            )),
                  );
                } else {
                  currentBrokenItem.name = nameController.text;
                  currentBrokenItem.category = categoryController.text;
                  currentBrokenItem.reason = reasonController.text;
                  currentBrokenItem.deadline = selected;
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddExpensesPage(
                              isEditMode: true,
                              id: currentBrokenItem.id!,
                            )),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: nameController.text.isNotEmpty &&
                            categoryController.text.isNotEmpty &&
                            reasonController.text.isNotEmpty
                        ? const Color(0xFF0075FF)
                        : const Color(0xFFDBDBDB)),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: nameController.text.isNotEmpty &&
                              categoryController.text.isNotEmpty &&
                              reasonController.text.isNotEmpty
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

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in types) {
      list.add(InkWell(
        onTap: () {
          selected = type;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
              color: selected == type
                  ? const Color(0xff0075FF).withOpacity(0.15)
                  : const Color(0xFFF3F3F3),
              border: Border.all(
                  color: selected == type
                      ? const Color(0xFF0075FF)
                      : const Color(0xFFECECEC),
                  width: 1),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.text,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: selected == type
                        ? const Color(0xFF0075FF)
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              if (selected == type)
                const Icon(
                  Icons.check,
                  color: Color(0xFF0075FF),
                )
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
