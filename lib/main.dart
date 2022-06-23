
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
          'my first app in flutter!',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[600],
          fontFamily: 'SourceSansPro',
        ),

      ),
      centerTitle: true,
      backgroundColor: Colors.greenAccent
    ),
    body: Center(
      child: Image(
        image: NetworkImage('https://images.unsplash.com/photo-1655853083902-62fda4a0eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'),
      )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () { },
      backgroundColor: Colors.lightBlueAccent,
      child: const Text('click'),
    ),
  );
  }
}