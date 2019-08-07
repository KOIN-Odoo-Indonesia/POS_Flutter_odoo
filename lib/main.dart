import 'package:flutter/material.dart';

import './screens/error.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/charge.dart';
import './screens/products.dart';
import './screens/product.dart';
import './screens/receipts.dart';
import './screens/support.dart';
import './screens/settings.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NAGA POS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
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
