import 'package:foxbit_hiring_test_template/data/services/websocket/foxbit/foxbit_websocket.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/heartbeat_repository.dart';

class HeartbeatRepository implements IHeartbeatRepository {
  final String _eventName = 'PING';

  @override
  Future<Map> send(FoxbitWebSocket ws) {
    ws.send(_eventName, {});
    
    return ws.stream.firstWhere((message) => message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId);
  }
  
}