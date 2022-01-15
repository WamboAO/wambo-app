import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/utils/debounce.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/main/presentation/widgets/navigator.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';

class SearchViewModel extends FutureViewModel<dynamic> {
  SearchViewModel() {
    log.d('created');
  }

  final log = getLogger('SearchViewModel');
  final _searchService = locator<SearchService>();
  final _navigationService = locator<NavigationService>();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Future futureToRun() => _searchService.search("");

  goToProducts({required String text, required NavChoice choice}) {}

  bool goToHome(NavChoice choice) {
    return _navigationService.back(id: choice.nestedKeyValue());
  }

  search(String text) {
    _debouncer.run(() async => await _searchService.search(text));
  }
}
