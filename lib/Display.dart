import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class display extends StatefulWidget {
  const display({super.key});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  final CollectionReference sch= FirebaseFirestore.instance.collection('school');

  TextEditingController _tcontroller=TextEditingController();
  TextEditingController _subtcontroller=TextEditingController();

  void delete(del){
    sch.doc(del).delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sch.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>>snapshot){
        if(snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot snap = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    tileColor: Colors.greenAccent,
                    title: Text(snap['name']),
                    subtitle: Text(snap['phone']),
                    trailing: Container(
                      width: 90,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'edit',
                                  arguments: {
                                  'name':snap['name'],
                                    'phone':snap['phone'],
                                    'id':snap.id
                                  });
                              },
                              icon: Icon(Icons.edit,color: Colors.blue,)),
                          IconButton(
                              onPressed: (){
                                delete(snap.id);
                              },
                              icon: Icon(Icons.delete,color: Colors.red,))
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
