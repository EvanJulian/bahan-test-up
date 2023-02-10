import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ujian_perbaikan_2073008/SecondPage.dart';

import 'BlocProvider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String nama = "Evan Julian Sudarman";
  String nrp = "2073008";
  @override
  void initState() {
    generateData();
    super.initState();
  }

  generateData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('nama') != null && prefs.getString('nrp') != null) {
      nama = (prefs.getString('nama') ?? '');
      nrp = (prefs.getString('nrp') ?? '');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SecondPage(
                      bloc: bloc,
                      name: nama,
                      nrp: nrp,
                    )));
                 generateData();
          },
          child: Icon(Icons.settings)),
      appBar: AppBar(
        title: Text('Halaman Data Diri'),
      ),
      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, currentColor) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'NRP : ',
                      style: TextStyle(color: currentColor),
                    ),
                    Text('${nrp}', style: TextStyle(color: currentColor))
                  ],
                ),
                Row(
                  children: [
                    Text('Nama : ', style: TextStyle(color: currentColor)),
                    Text('${nama}', style: TextStyle(color: currentColor))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
