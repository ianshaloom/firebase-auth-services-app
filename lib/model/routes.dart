import 'package:flutter/widgets.dart';

import '../pages/homepage/widgets/homepage.dart';
import '../pages/verify_email_page/verify_email_page.dart';

Map<String, Widget Function(BuildContext)> routess = <String, WidgetBuilder>{
  '/home_page/': (context) => const HomePage(),
  //'/reset_password_page/': (context) => const ProfilePage(),
  '/verify_email_page/': (context) => const VerifiedPage(),
};
