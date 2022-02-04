import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/get_authenticated_user_repository.dart';

class GetAuthenticatedUserUsecase
    implements Usecase<AuthenticatedUserEntity, String> {
  GetAuthenticatedUserUsecase(this.repository);
  final IGetAuthenticatedUserRepository repository;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(String params) async{
    return await repository.getUser(params);
  }
}
