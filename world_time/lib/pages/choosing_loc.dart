import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async{

    //simulate network request for a user
     String username = await Future.delayed(Duration(seconds: 3),(){
      return 'yashi';
    });


    //simulate network request to gey bio of the user
     String bio = await Future.delayed(Duration(seconds: 3),(){
      return  'vegan , musician,& egg collector';
    });

    print('$username  -$bio');
  }

int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('hi app');

  }

  @override
  Widget build(BuildContext context) {
    print('build fxn ran ');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[700],
        title: Text('Choose  a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
          }, child: Text('counter  is $counter'),
      ),
    );
  }
}
