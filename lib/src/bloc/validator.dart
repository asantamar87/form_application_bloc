import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  //Los dos tipos de datos que recibiremos. Sink dice que informacion sigue fluyendo o que info bloquear
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {

      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }

    }
  );
}
