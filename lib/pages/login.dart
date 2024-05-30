import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final FirebaseAuth _auth= FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen(
      (event) {
        setState(() {
          _user= event;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, userModel, child){
        return  Scaffold(
          body: Container(
          child: Center(
          child: Padding(
          padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(
          'Fit Me',
          style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.white
          ),
          ),
          SizedBox(
          height: 20,
          ),
          Text(
          'FIND OUT EXACTLY WHAT TRAINING WILL WORK SPECIFICALLY FOR YOU',
          style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(
          height: 35,
          ),
          Text(
          'Take your next Step Now!',
          style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(
          height: 40,
          ),
          ElevatedButton.icon(
            onPressed: ()async {
              try{
                GoogleAuthProvider _googleAuthProvider= GoogleAuthProvider();
                await _auth.signInWithProvider(_googleAuthProvider);
              }
              catch(e){
                print(e);
              }
              print(_user!.email);
              userModel.user= _user;
              if(userModel.user!=null){
                Navigator.pushReplacementNamed(context, '/dashboard');
                print(userModel.user!.email);
              }
            },
            icon: Icon(Icons.login),
            label: Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 18),
            ),
          ),
            SizedBox(height: 20),
            Image.asset('assets/man.png',height: 250,)
          ],
          )
          )
          ),
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/hero.jpg'),
            fit: BoxFit.cover
            )
          ),

          )
        // backgroundColor: Colors.pinkAccent,
        );
      },
    );
  }
}
