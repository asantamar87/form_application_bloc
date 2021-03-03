import 'package:flutter/material.dart';

import 'login_bloc.dart';
export 'login_bloc.dart';



class Provider extends InheritedWidget{

  static Provider _instancia;

    //Singleton. Las llaves indican que son opcionales.
    factory Provider({Key key, Widget child}){

    if(_instancia == null){
    _instancia = new Provider._internal(key: key, child: child,);

    }

    return _instancia;
  }
    Provider._internal({Key key, Widget child})
    :super(key: key, child: child);

  //Instanciando la clase LoginBloc
  final loginBloc = LoginBloc();



//Al actualizarse debe notificiar a sus hijos. 99% se usará true.
  @override
  bool updateShouldNotify( InheritedWidget oldWidget) => true;


  static LoginBloc of (BuildContext context){
    //return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginBloc;
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}