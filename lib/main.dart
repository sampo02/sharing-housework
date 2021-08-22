import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/features/housework/presentation/models/team_model.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';
import 'package:sharing_housework/features/housework/presentation/pages/home_page.dart';
import 'package:sharing_housework/features/housework/presentation/pages/sign_in_page.dart';
import 'package:sharing_housework/features/housework/presentation/pages/task_page.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/lifecycle_manager.dart';
import 'package:sharing_housework/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();

  const isEmulator = bool.fromEnvironment('IS_EMULATOR');
  if (isEmulator) {
    const localhost = 'localhost';
    FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
    await FirebaseAuth.instance.useAuthEmulator(localhost, 9099);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.instance<TaskModel>()),
        ChangeNotifierProvider(create: (context) => di.instance<TeamModel>()),
        ChangeNotifierProvider(create: (context) => di.instance<UserModel>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LifecycleManager(
      child: MaterialApp(
          title: 'Sharing Housework',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/sign_in': (context) => const SignInPage(),
            '/tasks': (context) => const TaskPage(),
          }),
      user: di.instance<UserModel>(),
    );
  }
}
