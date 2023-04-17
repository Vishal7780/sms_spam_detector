import 'package:flutter/material.dart';
import 'package:dummy/screens/Home/Home.dart';
import 'package:dummy/screens/messageDetails.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spam detector"),

      ),
      body: Container(
        width: 20,
        height: 40,
        alignment: Alignment.bottomCenter,
      child: Row(
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),

        ],


      ),
      ),
    );
  }
}
