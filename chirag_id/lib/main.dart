import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ChiID(),
  ));
}
 class  ChiID  extends StatelessWidget {

 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.grey[900] ,
     appBar: AppBar(
     title: Text('Chirag id Card'),
       centerTitle: true,
       backgroundColor: Colors.grey[850],
       elevation: 0.0,
     ),
       body: Padding(
           padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Center(
               child: CircleAvatar(
                 backgroundImage: AssetImage('assets/profile.jpeg'),
                 radius: 40.0,
               ),
             ),
             Divider(
               height: 60.0 ,
               color: Colors.grey[800],
             ),
             Text(
               'Name',
               style: TextStyle(
                 color: Colors.grey,
                 letterSpacing: 2.0,


               ),
             ),
             SizedBox(height: 10.0,),
             Text(
               'Chirag Samaiya',
               style: TextStyle(
                 color: Colors.amberAccent[200],
                 letterSpacing: 2.0,
                 fontSize: 28.0,
                 fontWeight: FontWeight.bold
               ),
             ),
             SizedBox(height: 30.0,),
             Text(
               'Current Studying year',
               style: TextStyle(
                 color: Colors.grey,
                 fontSize: 20.0,
                 letterSpacing: 2.0,
               ),
             ),
             SizedBox(height: 10.0,),
             Text(
               '2026',
               style: TextStyle(
                   color: Colors.amberAccent[200],
                   letterSpacing: 2.0,
                   fontSize: 28.0,
                   fontWeight: FontWeight.bold
               ),
             ),
             SizedBox(height: 30.0,),
             Row(
               children: <Widget>[
                 Icon(
                   Icons.email,
                   color: Colors.grey[400],
                 ),
                 SizedBox(width: 10.0),
                 Text(
                   'chiragsamaiya052@gmail.com',
                   style: TextStyle(
                     color: Colors.grey[400],
                     fontSize: 18.0,
                     letterSpacing: 2.0,
                   ),
                 ),

               ],
             ),
             Row(
               children: <Widget>[
                 Icon(
                   Icons.phone,
                   color: Colors.grey[400],
                 ),
                 SizedBox(width: 10.0,),
                 Text(
                   '8602439718',
                   style: TextStyle(
                     color: Colors.grey[400],
                     fontSize: 18.0,
                     letterSpacing: 2.0,
                   ),
                 ),
               ],
             ),
           ],

         ),
       ),
     );
   }
 }
 

