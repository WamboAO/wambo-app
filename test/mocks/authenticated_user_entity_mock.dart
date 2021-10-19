import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

const tgeneric = true;
final tAuth = AuthenticatedUserEntity(
    token: "sdsdfsdf",
    userId: 0,
    refreshToken: "sdfsdfasdf",
    avatar: '',
    firstName: '',
    appToken: "",
    lastName: '',
    phone: '',
    email: '');
final tUserRegistration = UserRegistrationCredentialsEntity(registrationType: "");
final tUserRegistrationModel = UserRegistrationCredentialsModel(registrationType: "");
final tAuthenticatedUserModel = AuthenticatedUserModel(
    token: "token",
    refreshToken: "refreshToken",
    avatar: "",
    userId: 1,
    firstName: '',
    appToken: "",
    lastName: '',
    phone: '',
    email: '');
