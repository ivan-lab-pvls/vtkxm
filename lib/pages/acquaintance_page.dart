import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repair_mate_app/model/user.dart';
import 'package:repair_mate_app/pages/add_photo_page.dart';
import 'package:repair_mate_app/pages/home_page.dart';

class AcquaintancePage extends StatefulWidget {
  const AcquaintancePage({super.key});

  @override
  State<AcquaintancePage> createState() => _AcquaintancePageState();
}

class _AcquaintancePageState extends State<AcquaintancePage> {
  TextEditingController controller = TextEditingController();
  List<EPeriodicityRepair> types = [
    EPeriodicityRepair.rarely,
    EPeriodicityRepair.periodically,
    EPeriodicityRepair.often
  ];
  EPeriodicityRepair selected = EPeriodicityRepair.rarely;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 60, 16, 27),
                  child: Row(
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Let’s get acquainted',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Your name',
                      hintStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.25)),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color(0xFFECECEC), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color(0xFFECECEC), width: 1),
                      ),
                    ),
                    onChanged: (text) {
                      controller.text = text;
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
                          'Do you often have something broken at home?',
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  user.name = controller.text;
                  user.type = selected;
                  addToSP();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: controller.text.isNotEmpty
                        ? const Color(0xFF0075FF)
                        : const Color(0xFFDBDBDB)),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: controller.text.isNotEmpty
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
