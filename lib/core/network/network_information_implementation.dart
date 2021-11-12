import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:wambo/core/interfaces/network_interface.dart';

class NetworkInformationImplementation implements INetworkInfo {
  final DataConnectionChecker connectionChecker = DataConnectionChecker();

  
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}
