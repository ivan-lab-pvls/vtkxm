import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repair_mate_app/model/broken_item.dart';
import 'package:repair_mate_app/model/expense_item.dart';
import 'package:repair_mate_app/model/photo_item.dart';
import 'package:repair_mate_app/model/user.dart';
import 'package:repair_mate_app/pages/add_broken_item_page.dart';
import 'package:repair_mate_app/pages/add_expenses_page.dart';
import 'package:repair_mate_app/pages/description_page.dart';
import 'package:repair_mate_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<PhotoItem> recordedImages = [];

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key, required this.id, required this.isEditMode});
  final String id;
  final bool isEditMode;

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String recordedImageString = '';

  late File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      descriptionController.text = currentBrokenItem.description!;
    }
    // getSP();
    // setState(() {});
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(
                        0xFFF3F3F3,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: getPhotos())),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                                builder: (context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                        child: const Text(
                                          'Take photo',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color: Color(0xFF007AFF)),
                                        ),
                                        onPressed: () async {
                                          await _picker
                                              .pickImage(
                                                  source: ImageSource.camera)
                                              .then((XFile? recordedImage) {
                                            if (recordedImage != null) {
                                              RegExp exp =
                                                  RegExp('/((?:.(?!/))+\$)');
                                              String fileName = exp
                                                  .firstMatch(
                                                      recordedImage.path)!
                                                  .group(1)!;
                                              print(fileName);
                                              recordedImageString =
                                                  recordedImage.path;
                                              PhotoItem item = PhotoItem();
                                              if (widget.isEditMode) {
                                                item.id = currentBrokenItem.id;
                                              } else {
                                                item.id = widget.id;
                                              }
                                              item.photo = recordedImage.path;
                                              recordedImages.add(item);

                                              setState(() {});
                                            }
                                          });
                                        },
                                      ),
                                      CupertinoActionSheetAction(
                                        child: const Text(
                                          'Photo library',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color: Color(0xFF007AFF)),
                                        ),
                                        onPressed: () async {
                                          final pickedFile =
                                              await picker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            if (pickedFile != null) {
                                              _image = File(pickedFile.path);
                                              PhotoItem item = PhotoItem();
                                              if (widget.isEditMode) {
                                                item.id = currentBrokenItem.id;
                                              } else {
                                                item.id = widget.id;
                                              }

                                              item.photo = _image.path;
                                              recordedImages.add(item);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            color: Color(0xFF007AFF)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                                context: context);
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
                                  Icon(Icons.add, color: Colors.white),
                                  Text(
                                    'Add photo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: descriptionController,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Additional information about the repair',
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
                    descriptionController.text = text;
                    setState(() {});
                  },
                ),
              ),
            ]),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (widget.isEditMode) {
                  brokenItems
                      .firstWhere(
                          (element) => element.id == currentBrokenItem.id)
                      .description = descriptionController.text;
                } else {
                  brokenItems
                      .firstWhere((element) => element.id == widget.id)
                      .description = descriptionController.text;
                }
                addToSP();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
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
          )
        ],
      ),
    );
  }

  Widget getPhotos() {
    List<Widget> list = [];
    for (var photo
        in recordedImages.where((element) => element.id == widget.id)) {
      list.add(
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                fit: BoxFit.cover,
                File(
                  photo.photo!,
                ),
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              top: -7,
              right: -7,
              child: InkWell(
                onTap: () {
                  recordedImages.remove(photo);
                  setState(() {});
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF0075FF)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
      list.add(const SizedBox(
        width: 16,
      ));
    }
    list.add(Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Image.asset('assets/camera.png'),
    ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }
}

Future<void> addToSP() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('user', jsonEncode(user));
  prefs.setString('recordedImages', jsonEncode(recordedImages));
  prefs.setString('expenses', jsonEncode(expenses));
  prefs.setString('brokenItems', jsonEncode(brokenItems));
}

void getSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  final List<dynamic> jsonData =
      jsonDecode(prefs.getString('recordedImages') ?? '[]');
  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('expenses') ?? '[]');
  final List<dynamic> jsonData2 =
      jsonDecode(prefs.getString('brokenItems') ?? '[]');
  if (prefs.getString('user') != null) {
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    user = UserItem.fromJson(userMap);
  }
  recordedImages = jsonData.map<PhotoItem>((jsonList) {
    {
      return PhotoItem.fromJson(jsonList);
    }
  }).toList();

  expenses = jsonData1.map<ExpenseItem>((jsonList) {
    {
      return ExpenseItem.fromJson(jsonList);
    }
  }).toList();
  brokenItems = jsonData2.map<BrokenItem>((jsonList) {
    {
      return BrokenItem.fromJson(jsonList);
    }
  }).toList();
  callBack();
}
