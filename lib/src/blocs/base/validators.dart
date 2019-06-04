import 'dart:async';

class Validators {
  final emailValidation = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@") || email == "") {
      sink.add(email);
    } else {
      sink.addError("Email inválido");
    }
  });
}