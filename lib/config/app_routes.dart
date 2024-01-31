import 'package:provider/provider.dart';
import 'package:study_flutter/page/edit_profile_page.dart';
import 'package:study_flutter/page/login_page.dart';
import 'package:study_flutter/page/near_by_page.dart';
import 'package:study_flutter/provider/login_page_provider.dart';

import '../page/Main_page.dart';
import '../page/home_page.dart';

class AppRoute {
  static final pages = {
    login: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: LoginPage(),
        ),
    home: (context) => HomePage(),
    main: (context) => MainPage(),
    editProfile: (context) => EditprofilePage(),
    nearby: (context) => NearByPage(),
    // user: (context) => UserPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/editprofile';
  static const nearby = '/nearby';
  static const user = '/user';
}
