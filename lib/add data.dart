import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class adddata extends StatefulWidget {
  const adddata({super.key});

  @override
  State<adddata> createState() => _adddataState();
}

class _adddataState extends State<adddata> {

  TextEditingController _tcontroller=TextEditingController();
  TextEditingController _subtcontroller=TextEditingController();

  void add(String title, String subtitle) async{
      await FirebaseFirestore.instance.collection('school').add({
     'name': title,
        'phone': subtitle
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget padd=SizedBox(height: 10);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tcontroller,
              decoration: InputDecoration(hintText: 'Title'),),
            padd,
            TextField(
              maxLength: 10,
              controller: _subtcontroller,
              decoration: InputDecoration(hintText: 'Subtile'),),
            padd,
            OutlinedButton(
                onPressed: (){
                  add(_tcontroller.text, _subtcontroller.text);
                  Navigator.pop(context);
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
