import 'package:flutter/material.dart';

import './screens/error.dart';
import './screens/welcome.dart';
import './screens/login.dart';
import './screens/forget.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/charge.dart';
import './screens/products.dart';
import './screens/product.dart';
import './screens/receipts.dart';
import './screens/support.dart';
import './screens/settings.dart';
import './screens/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _islogged = false;
  String _initialRoute = '/welcome';

  @override
  void initState() {
    super.initState();
    if (_islogged) {
      _initialRoute = '/home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NAGA POS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: _initialRoute,
      routes: {
        '/': (context) => HomeScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/forget': (context) => ForgetPasswordScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/charge': (context) => ChargeScreen(),
        '/items': (context) => ProductScreen(),
        '/receipts': (context) => ReceiptScreen(),
        '/singleproduct': (context) => SingleProductScreen(),
        '/support': (context) => SupportScreen(),
        '/settings': (context) => SettingScreen(),
        '/error': (context) => ErrorScreen(),
      },
    );
  }
}
