

import 'dart:io';


import 'package:hive_flutter/hive_flutter.dart';
import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>("Adnan");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPSDelivery',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      //ChangeNotifierProvider<ListProvider>(create: (context)=>ListProvider(),child:  HomeScreen(),) ,
    );
  }
}
