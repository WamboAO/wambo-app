import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:interfaces/interfaces.dart';import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';

class CategoriesViewModel
    extends StreamViewModel<ApiResponse<CategoriesEntity>> {
  CategoriesViewModel() {
    log.d('created');
  }

  final log = getLogger('CategoriesViewModel');
  final _getCategoriesService = locator<GetCategoriesService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  CategoriesEntity? get categories =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  @override
  Stream<ApiResponse<CategoriesEntity>> get stream =>
      _getCategoriesService.dataStream;

  goToSearch({required String category}) {}
}



