import 'package:flutter/material.dart';
import 'package:ujian_perbaikan_2073008/SecondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Icon(Icons.settings)
          ),
      appBar: AppBar(
        title: Text('Halaman Data Diri'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [Text('NRP : '), Text('2073008')],
              ),
              Row(
                children: [Text('Nama : '), Text('Evan Julian Sudarman')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
