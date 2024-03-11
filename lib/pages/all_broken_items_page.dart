import 'package:flutter/material.dart';
import 'package:repair_mate_app/pages/add_broken_item_page.dart';
import 'package:repair_mate_app/pages/add_expenses_page.dart';
import 'package:repair_mate_app/pages/add_photo_page.dart';
import 'package:repair_mate_app/pages/description_page.dart';
import 'package:repair_mate_app/pages/home_page.dart';

class AllBrokenItemsPage extends StatefulWidget {
  const AllBrokenItemsPage({super.key});

  @override
  State<AllBrokenItemsPage> createState() => _AllBrokenItemsPageState();
}

class _AllBrokenItemsPageState extends State<AllBrokenItemsPage> {
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getTypes(),
              )
            ]),
          )),
        ],
      ),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    for (var brokenItem in brokenItems) {
      list.add(
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              border: Border.all(color: const Color(0xFFECECEC), width: 1),
              borderRadius: BorderRadius.circular(16)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              brokenItem.deadline!.text,
              style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  color: Color(0xFF0075FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              brokenItem.reason!,
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
                    brokenItem.name!,
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
                    brokenItem.category!,
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
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                        color: const Color(0xff0075FF).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      '${expenses.firstWhere((element) => element.id == brokenItem.id).cost!.toStringAsFixed(0)}\$',
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0xff0075FF),
                          fontWeight: FontWeight.w500),
                    )),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => DescriptionPage(
                                currentBrokenItem: brokenItem,
                                deleteItem: () {
                                  brokenItems.remove(brokenItem);
                                  setState(() {});
                                  addToSP();
                                },
                                repairItem: (item) {
                                  user.repairedItemsCount =
                                      user.repairedItemsCount! + 1;
                                  item.isRepaired = true;
                                  addToSP();
                                  setState(() {});
                                },
                              )),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(27, 9, 27, 9),
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
      );
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
