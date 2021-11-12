import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
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
