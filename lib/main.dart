import 'package:ecosia/models/user.dart';
import 'package:ecosia/screens/wrapper.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
// import 'informativepg/informativepage.dart';

Future<void> main() async {
  // ===========To Handel Error: Unhandled Exception: Binding has not yet been initialized.==============
  WidgetsFlutterBinding.ensureInitialized();
  // ===========To Handel Error: Firebase not Intitalized.==============
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
