import 'core.dart';
import 'DFile.dart';

class FileUploadResult {
  DFile file;
  bool success;

  FileUploadResult(this.file, this.success);

  factory FileUploadResult.failed() => FileUploadResult(null, false);
}
