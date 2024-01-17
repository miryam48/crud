import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class editdata extends StatefulWidget {
  const editdata({super.key});

  @override
  State<editdata> createState() => _editdataState();
}

class _editdataState extends State<editdata> {

  final CollectionReference sch= FirebaseFirestore.instance.collection('school');

  TextEditingController _tcontroller=TextEditingController();
  TextEditingController _subtcontroller=TextEditingController();

  void update(docid){
    final data={
      'name':_tcontroller.text,
      'phone':_subtcontroller.text
    };
   sch.doc(docid).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Map;
    _tcontroller.text=args['name'];
    _subtcontroller.text=args['phone'];

    var docid=args['id'];
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
              controller: _subtcontroller,
              decoration: InputDecoration(hintText: 'Subtile'),),
            padd,
            OutlinedButton(
                onPressed: (){
                  update(docid);
                  Navigator.pop(context);
                },
                child: Text('save'))
          ],
        ),
      ),
    );
  }
}
