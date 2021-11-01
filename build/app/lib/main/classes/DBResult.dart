import 'DBResultStatus.dart';

class DBResult {
  DBResultStatus status;
  List<String> errors;

  DBResult({this.status, this.errors});
}
