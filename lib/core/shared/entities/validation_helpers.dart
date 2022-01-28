import 'package:errors/errors.dart';


FetchDataFailure? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  RegExp regExp = RegExp(pattern);
  
  if (value== null || value.isEmpty) {
    return const FetchDataFailure('Email não pode estar vazio');
  }
  if (!regExp.hasMatch(value)) {
    return const FetchDataFailure('Digite um email valido');
  }
  return null;
}

FetchDataFailure? validatePass(String? value) {
  //TODO: see what is the regExp for this
  // String pattern =
  //     r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{3})(?: *x(\d+))?\s*$";
  // RegExp regExp = RegExp(pattern);
  if (value== null || value.isEmpty) {
    return const FetchDataFailure("Senha não pode ser vazio");
  }
  if (value.length < 6) {
    return const FetchDataFailure(
        'Mínimo de 6 caracteres');
  }
  return null;
}

FetchDataFailure? validatePhone(String? value) {
  String pattern =
      r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{3})(?: *x(\d+))?\s*$";
  RegExp regExp = RegExp(pattern);
  if (value== null || value.isEmpty) {
    return const FetchDataFailure("Telefone não pode ser vazio");
  }
  if (!regExp.hasMatch(value)) {
    return const FetchDataFailure(
        'Digite um número de telefone valido');
  }
  return null;
}

FetchDataFailure? validateValue(String? value, String type) {
  if (value== null || value.isEmpty) {
    return FetchDataFailure("$type não pode ser vazio");
  }
  
  return null;
}