import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:interfaces/interfaces.dart';

class SearchViewModel extends FutureViewModel<dynamic> {
  SearchViewModel() {
    log.d('created');
  }

  final log = getLogger('SearchViewModel');
  final _searchService = locator<SearchService>();
  final _addSearchService = locator<AddSearchService>();
  final _navigationService = locator<NavigationService>();
  final _analyticsService = locator<AnalyticsService>();
  final _debouncer = Debouncer(milliseconds: 350);

  @override
  Future futureToRun() => _searchService.search("");

  Future goToProducts({required String text, required NavChoice choice}) async {
        await _analyticsService.logSearch(text);

    final result = await _addSearchService.addSearch(text);
    log.w(result);
    //TODO: products page
  }

  bool goToHome(NavChoice choice) {
    return _navigationService.back(id: choice.nestedKeyValue());
  }

   search(String text)  {
    _debouncer.run(() async => await _searchService.search(text));
  }
}
