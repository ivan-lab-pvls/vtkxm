import 'package:flutter/material.dart';
import 'package:repair_mate_app/model/broken_item.dart';
import 'package:repair_mate_app/model/page.dart';
import 'package:repair_mate_app/model/user.dart';
import 'package:repair_mate_app/pages/add_broken_item_page.dart';
import 'package:repair_mate_app/pages/add_expenses_page.dart';
import 'package:repair_mate_app/pages/add_photo_page.dart';
import 'package:repair_mate_app/pages/all_broken_items_page.dart';
import 'package:repair_mate_app/pages/description_page.dart';
import 'package:repair_mate_app/pages/settings_page.dart';

import 'quiz_game_page.dart';

UserItem user = UserItem(repairedItemsCount: 0);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
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
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const SettingsPage()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFF0075FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                     InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const QuizGamePage()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Quiz',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFF0075FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const NewsPage()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'News',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFF0075FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Repair items',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              if (brokenItems.isEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'No broken items yet',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              if (brokenItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xFF0075FF),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Image.asset('assets/repair_icon.png'),
                              ),
                              Text(
                                'Total repaired items',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                user.repairedItemsCount!.toString(),
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              if (brokenItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Broken items',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const AllBrokenItemsPage()),
                          );
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0075FF)),
                        ),
                      ),
                    ],
                  ),
                ),
              if (brokenItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(
                            color: const Color(0xFFECECEC), width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brokenItems.first.deadline!.text,
                            style: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFF0075FF),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            brokenItems.first.reason!,
                            style: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
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
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff0075FF)
                                          .withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    '${expenses.firstWhere((element) => element.id == brokenItems.first.id).cost!.toStringAsFixed(0)}\$',
                                    style: const TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color: Color(0xff0075FF),
                                        fontWeight: FontWeight.w500),
                                  )),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            DescriptionPage(
                                              currentBrokenItem:
                                                  brokenItems.first,
                                              deleteItem: () {
                                                brokenItems
                                                    .remove(brokenItems.first);
                                                setState(() {});
                                                addToSP();
                                              },
                                              repairItem: (item) {
                                                user.repairedItemsCount =
                                                    user.repairedItemsCount! +
                                                        1;
                                                BrokenItem forDelete =
                                                    brokenItems.firstWhere(
                                                        (element) =>
                                                            element.id ==
                                                            item.id);
                                                brokenItems.remove(forDelete);
                                                item.isRepaired = true;
                                                brokenItems.add(item);
                                                addToSP();
                                                setState(() {});
                                              },
                                            )),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(27, 9, 27, 9),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF0075FF),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Text(
                                    'Open',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                )
            ]),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                currentBrokenItem = BrokenItem();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AddBrokenItemPage(
                            isEditMode: false,
                          )),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF0075FF)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Add new broken item',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
