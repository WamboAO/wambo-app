import 'package:wambo/core/errors/failures.dart';

FetchDataFailure? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  RegExp regExp = RegExp(pattern);
  
  if (value== null || value.isEmpty) {
    return FetchDataFailure('Email não pode estar vazio');
  }
  if (!regExp.hasMatch(value)) {
    return FetchDataFailure('Digite um email valido');
  }
  return null;
}

FetchDataFailure? validatePass(String? value) {
  // String pattern =
  //     r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
  // RegExp regExp = RegExp(pattern);
  if (value== null || value.isEmpty) {
    return FetchDataFailure("Senha não pode ser vazio");
  }
  if (value.length < 6) {
    return FetchDataFailure(
        'Mínimo de 6 caracteres');
  }
  return null;
}

FetchDataFailure? validateValue(String? value, String type) {
  if (value== null || value.isEmpty) {
    return FetchDataFailure("$type não pode ser vazio");
  }
  
  return null;
}