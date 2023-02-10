import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ujian_perbaikan_2073008/SecondPage.dart';

import 'BlocProvider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage(bloc: bloc,)));
            },
            child: Icon(Icons.settings)
          ),
      appBar: AppBar(
        title: Text('Halaman Data Diri'),
      ),

      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, currentColor) => 
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text('NRP : ', style: TextStyle(color: currentColor),), Text('2073008', style: TextStyle(color: currentColor))],
                ),
                Row(
                  children: [Text('Nama : ', style: TextStyle(color: currentColor)), Text('Evan Julian Sudarman', style: TextStyle(color: currentColor))],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
