import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../screens/landing_screen.dart';
import 'vendor_register_screen.dart';

class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return  SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),

            GoogleProviderConfiguration(clientId: '1:280940830966:android:ff3b3f2c7eda2c70038cd7'),
            PhoneProviderConfiguration(),
          ]);
        }

        // Render your application if authenticated
        return  LandingScreen();
      },
    );
  }
}
