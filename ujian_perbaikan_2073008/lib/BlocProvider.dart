import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
enum ColorEvent{to_black, to_red, to_blue}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.black;
  ColorBloc(Color initialState) : super(initialState);
  
  @override
  Color get initialState => Colors.black;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    if(event == ColorEvent.to_black){
      _color = Colors.black;
    }
    else if(event == ColorEvent.to_red){
      _color = Colors.red;
    }
    else if(event == ColorEvent.to_blue){
      _color = Colors.blue;
    }
    yield _color;
  }
}