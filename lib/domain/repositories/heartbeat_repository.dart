import 'package:foxbit_hiring_test_template/data/services/websocket/foxbit/foxbit_websocket.dart';

abstract class IHeartbeatRepository {
  Future<Map> send(FoxbitWebSocket ws);
}