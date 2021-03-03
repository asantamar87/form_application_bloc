import 'dart:async';

import 'package:form_application/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  //broadcast para que varias instancias lo puedan escuchar.

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //RECUPERAR DATOS. Estar escuchando, recuperar los datos del Stream.
  Stream <String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream <String> get passwordStream => _passwordController.stream.transform(validarPassword);


  



  //Booleano para verificar si el formulario es valido, despues de haber recibido los dos valores 
  Stream<bool> get formValidStream =>
  //Deprecated Observable.combineLatest2(emailStream, passwordStream, (e, p) => true );
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);



  //INSERTAR DATOS.   Getters. Insertar valores al Stream.
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado en los Streams

  String get email => _emailController.value;
  String get password => _passwordController.value;
 
  dispose(){
    _emailController?.close();
    _passwordController?.close();
    
  }

}