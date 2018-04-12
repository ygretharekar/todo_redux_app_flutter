import 'dart:async';
import 'dart:io';

class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(this.tag, this.getDirectory);
}