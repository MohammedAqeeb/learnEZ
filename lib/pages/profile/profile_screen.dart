import 'package:flutter/material.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/pages/profile/settings/screen.dart';

import 'widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildProfileAppBar(),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildProfileAndIcon(),
            buildProfileOptions(
              buttonName: 'Settings',
              image: settingsIcon,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            buildProfileOptions(
              buttonName: 'Payment Details',
              image: creditCardIcon,
              onTap: () {},
            ),
            buildProfileOptions(
              buttonName: 'Achievement',
              image: awardIcon,
              onTap: () {},
            ),
            buildProfileOptions(
              buttonName: 'Favorite',
              image: heartIcon,
              onTap: () {},
            ),
            buildProfileOptions(
              buttonName: 'Reminder',
              image: cubeIcon,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
