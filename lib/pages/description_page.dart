import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repair_mate_app/model/broken_item.dart';
import 'package:repair_mate_app/pages/add_broken_item_page.dart';
import 'package:repair_mate_app/pages/add_expenses_page.dart';
import 'package:repair_mate_app/pages/add_photo_page.dart';

BrokenItem currentBrokenItem = BrokenItem();

class DescriptionPage extends StatefulWidget {
  const DescriptionPage(
      {super.key,
      required this.currentBrokenItem,
      required this.deleteItem,
      required this.repairItem});
  final BrokenItem currentBrokenItem;
  final Function() deleteItem;
  final Function(BrokenItem) repairItem;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 26),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
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
                      InkWell(
                        onTap: () {
                          currentBrokenItem = widget.currentBrokenItem;
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const AddBrokenItemPage(
                                      isEditMode: true,
                                    )),
                          );
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFF0075FF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      border:
                          Border.all(color: const Color(0xFFECECEC), width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      decoration: BoxDecoration(
                          color: const Color(0xFF0075FF).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        widget.currentBrokenItem.deadline!.text,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFF0075FF)),
                      ),
                    ),
                    Text(
                      widget.currentBrokenItem.reason!,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          brokenItems.first.name!,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          brokenItems.first.category!,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.25),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Additional photo',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              if (recordedImages
                  .where((element) => element.id == widget.currentBrokenItem.id)
                  .isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: getPhotos()),
                ),
              if (recordedImages
                  .where((element) => element.id == widget.currentBrokenItem.id)
                  .isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('No photos'),
                ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Additional information about the repair',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              if (widget.currentBrokenItem.description!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(
                            color: const Color(0xFFF3F3F3), width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(widget.currentBrokenItem.description!),
                  ),
                ),
              if (widget.currentBrokenItem.description!.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('No additional information'),
                ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'List of necessary expenses',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getExpenses(),
              )
            ]),
          )),
          if (widget.currentBrokenItem.isRepaired == null ||
              !widget.currentBrokenItem.isRepaired!)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.deleteItem();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFDBDBDB)),
                        child: const Text(
                          'Remove',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFF0075FF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.repairItem(widget.currentBrokenItem);
                        addToSP();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFF0075FF)),
                        child: const Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget getExpenses() {
    List<Widget> list = [];
    for (var expense in expenses
        .where((element) => element.id == widget.currentBrokenItem.id)) {
      list.add(
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              border: Border.all(color: const Color(0xFFECECEC), width: 1),
              borderRadius: BorderRadius.circular(16)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              expense.description!,
              style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '${expense.cost!.toStringAsFixed(0)}\$',
              style: const TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0075FF),
              ),
            ),
          ]),
        ),
      );
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getPhotos() {
    List<Widget> list = [];
    for (var photo in recordedImages
        .where((element) => element.id == widget.currentBrokenItem.id)) {
      list.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            fit: BoxFit.cover,
            File(
              photo.photo!,
            ),
            height: 64,
            width: 64,
          ),
        ),
      );

      list.add(const SizedBox(
        width: 16,
      ));
    }
    return Row(
      children: list,
    );
  }
}
