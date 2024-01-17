import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled86/Display.dart';
import 'package:untitled86/add%20data.dart';
import 'package:untitled86/edit%20data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDjPtvEy77aqXRO18tEEZer-deWnxe2B3E",
        appId: "1:695868646589:android:8e7d8fb65e622a7edec3d4",
        messagingSenderId: "695868646589",
        projectId: "prosys21-797ae")
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final CollectionReference sch= FirebaseFirestore.instance.collection('school');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase'),
          centerTitle: true,
        ),
        body: display(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
             adddata()));
          },
          child: Icon(Icons.add),
        ),
      ),
      routes: {
        'edit':(context)=>editdata(),
      },
    );
  }
}


