import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/authentication/domain/repositories/url_launcher_repositorties.dart';

class UrlLauncherUsecase implements Usecase<void, String> {
  UrlLauncherUsecase(this.repository);
  final IUrlLauncherRepository repository;
  @override
  Future<Either<Failure, void>> call(String params) async {
    return await repository.link(params);
  }
}
