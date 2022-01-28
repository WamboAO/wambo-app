import 'package:errors/errors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:wambo/modules/authentication/data/datasources/url_launcher_datasource.dart';

class UrlLauncherDatasourceImplementation implements IUrlLauncherDatasource {
  @override
  Future<void> link(String params) async {
    try {
      if (await canLaunch(params)) {
        await launch(
          params,
          forceSafariVC: false,
          forceWebView: false
        );
      } else {
        throw const FetchDataException("A operação falhou. Tente novamente!");
      }
    } catch (e) {
      throw const FetchDataException("A operação falhou. Tente novamente!");
    }
  }
}
