import 'dart:convert';
import 'package:app/func.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url='';
  var data;
  String output='Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charater to ASCII Value')),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                url= "http://10.0.2.2:5000/get_ascii?query="+value.toString();
              },
            ),
            const Gap(25.0),
            const Text(
              'Enter your character',
              style: TextStyle(fontSize: 20.0),
            ),
            const Gap(25.0),
            ElevatedButton(
                onPressed: () async {
                  data= await fetchdata(url);
                  var decodeData=  jsonDecode(data);
                  setState(() {
                    output= decodeData['output'];
                  });
                },
                child:
                    Text('Change to ASCII', style: TextStyle(fontSize: 20.0))),
            const Gap(25.0),
             Text(output, style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
