import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/startup/domain/repositories/authenticated_user_delete_repository.dart';

class AuthenticatedUserDeleteUsecase implements Usecase<bool, NoParams> {
  AuthenticatedUserDeleteUsecase(this.repository);
  final IAuthenticatedUserDeleteRepository repository;
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.delete();
  }
}
