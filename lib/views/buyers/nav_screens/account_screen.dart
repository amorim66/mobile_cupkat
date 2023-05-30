import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('buyers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: Colors.yellow.shade900,
              title: Text(
                'Perfil',
                style: TextStyle(letterSpacing: 4),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(Icons.star),
                )
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.yellow.shade900,
                    backgroundImage: NetworkImage(data['profileImage']),
                  ),
                ),
                Text(
                  data['fullName'],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data['email'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Definições'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Telefone'),
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Carrinho'),
                ),
              ],
            ),
          );
        }



        return CircularProgressIndicator();
      },
    );
  }
}
