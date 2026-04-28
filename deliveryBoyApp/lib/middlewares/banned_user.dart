import 'package:http/http.dart' as http;
import 'middleware.dart';

class BannedUser extends Middleware<bool, http.Response> {
  @override
  bool next(http.Response response) {
    return true;
  }
}
