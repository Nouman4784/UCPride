import 'package:flutter/material.dart';
import 'package:usama/Authentication/login.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_tile_acc.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _DriversDisplayState();
}

class _DriversDisplayState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gradientbg.png'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.primarybackgroundColor,
            ),
          ),
          elevation: 4,
          centerTitle: true,
          shadowColor: AppColor.hintTextColor,
          backgroundColor: AppColor.appbarColor,
          title: Text(
            'Account',
            style: TextStyle(
              color: AppColor.primarybackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTileAccount(
                  title: 'My Profile',
                  subTitle: 'Usama',
                ),
                const CustomTileAccount(
                  title: 'Settings',
                  subTitle: 'View your settings',
                ),
                CustomTileAccount(
                  title: 'Sign Out',
                  subTitle: 'Are you sure you want to signout',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogin()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
