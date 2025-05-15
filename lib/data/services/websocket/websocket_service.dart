abstract class WebSocketService {
  Stream<Map> get stream;

  void connect();

  void disconnect();

  void send(String method, dynamic data);
}
