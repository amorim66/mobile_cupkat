import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/vendor/views/screens/main_vendor_screen.dart';
import 'package:flutter_application_1/views/buyers/auth/login_screen.dart';
import 'package:flutter_application_1/views/buyers/main_screen.dart';
import 'package:provider/provider.dart';

import 'views/buyers/auth/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_){
        return ProductProvider();
      })
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand-Bold',
      ),
      home: MainVendorScreen(),
    );
  }
}


