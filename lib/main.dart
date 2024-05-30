import 'package:fit_me/firebase_options.dart';
import 'package:fit_me/models/userModel.dart';
import 'package:fit_me/pages/dashboard.dart';
import 'package:fit_me/pages/exercise.dart';
import 'package:fit_me/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MyProvider()
  );
}

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider<UserModel>
          (
            create: (context)=> UserModel(),
          )
        ],
        child: MaterialApp(
          // initialRoute: '/'
          routes: {
            '/': (context)=> LoginWidget(),
            '/dashboard': (context)=> DashBoardWidget(),
            '/exercise': (context)=> Exercise(),
          },

        )
    );
  }
}
