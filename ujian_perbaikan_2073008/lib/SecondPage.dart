import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BlocProvider.dart';

class SecondPage extends StatefulWidget {
  final ColorBloc bloc;
  final String name;
  final String nrp;
  const SecondPage({Key? key, required this.bloc, required this.name, required this.nrp}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nrpController = TextEditingController();

 @override
  void initState() {
    namaController.text = widget.name;
    nrpController.text = widget.nrp;
    super.initState();
  }

  String selectedValue = "Black";

  List _color = ['Black', 'Red', 'Blue'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextFormField(
            controller: nrpController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0XFFA1A1A1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0XFF4F3E9C), width: 2),
              ),
              labelText: 'NRP',
              hintText: 'NRP',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0XFFA1A1A1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0XFF4F3E9C), width: 2),
              ),
              labelText: 'Nama',
              hintText: 'Nama',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButton(
            hint: Text("Select The Gender"),
            value: selectedValue,
            items: _color.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value.toString();
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          RawMaterialButton(
            fillColor: Colors.blueAccent,
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width *0.6, minHeight: 45),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setString('nama', namaController.text);
              prefs.setString('nrp', nrpController.text);

              var tmp;
              if(selectedValue == 'Black'){
                tmp = ColorEvent.to_black;
              }
              else if(selectedValue == 'Red'){
                tmp = ColorEvent.to_red;
              }
              else if(selectedValue == 'Blue'){
                tmp = ColorEvent.to_blue;
              }
              widget.bloc.add(tmp);
              Navigator.pop(context);
            },
            child: Text('Simpan', style: TextStyle(color: Colors.white),)
          )
        ]),
      ),
    );
  }
}
