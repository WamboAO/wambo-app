import 'package:wambo/core/utils/enums.dart';

mixin StatusCheckerMixin {
  statusChecker(Status status,
      {Function? onLoading,
      required Function onError,
      required Function onComplete}) {
    switch (status) {
      case Status.loading:
        break;
      case Status.completed:
        return onComplete();
      case Status.error:
        return onError();
    }
  }
}