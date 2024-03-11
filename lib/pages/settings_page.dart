import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repair_mate_app/pages/view_screen.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 60, 16, 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Share.share('Check your everyday helper right now! Download');
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFECECEC), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share with friends',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFF0075FF),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const PreviewScreen(
                          dataForPage: 'https://docs.google.com/document/d/1Q-sFfngejH5gD6SJ1rWogenu2U2cszGk51NJ4Qr3eC4/edit?usp=sharing',
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFECECEC), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFF0075FF),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const PreviewScreen(
                          dataForPage: 'https://docs.google.com/document/d/1e4ICY6o2_2Mmlu4pU7fQZ-10ZJDAiE2_dJ-xrl0GBS0/edit?usp=sharing',
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFECECEC), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms of Use',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFF0075FF),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
