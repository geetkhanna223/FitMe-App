import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context,userModel,child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              child: Icon(
                Icons.person,
              ),
              radius: 60,
            ),
            Divider(
              height: 80,
              color: Colors.grey[300],
            ),

            Text(
              'Signed As',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${userModel.user!.email}',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton.icon(
              onPressed: (){
                userModel.user= null;
                _auth.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.logout, color: Colors.white,),
              label: Text(
                'Sign out ',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)
              ),
            )
          ],
        );
      }
    );
  }
}
