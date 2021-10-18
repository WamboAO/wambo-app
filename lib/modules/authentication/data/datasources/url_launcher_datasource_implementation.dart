import 'package:url_launcher/url_launcher.dart';
import 'package:wambo/core/errors/exception.dart';
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
      }
    } catch (e) {
      throw FetchDataException("A operação falhou. Tente novamente!");
    }
  }
}
