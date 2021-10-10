import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

const tgeneric = true;
final tAuth = AuthenticatedUserEntity(
    token: "sdsdfsdf",
    userId: 0,
    refreshToken: "sdfsdfasdf",
    isFirstTime: false,
    avatar: '',
    firstName: '',
    lastName: '',
    phone: '');
final tAuthenticatedUserModel = AuthenticatedUserModel(
        token: "token",
        refreshToken: "refreshToken",
        avatar: "",
        userId: 1,
        isFirstTime: true, firstName: '', lastName: '', phone: '');
