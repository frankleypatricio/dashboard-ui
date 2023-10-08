import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FileType {
  image, video, audio, word, excel, code
}
extension FileTypeExtension on FileType {
  IconData get icon {
    switch(this) {
      case FileType.image:
        return FontAwesomeIcons.fileImage;
      case FileType.video:
        return FontAwesomeIcons.fileVideo;
      case FileType.audio:
        return FontAwesomeIcons.fileAudio;
      case FileType.word:
        return FontAwesomeIcons.fileWord;
      case FileType.excel:
        return FontAwesomeIcons.fileExcel;
      case FileType.code:
        return FontAwesomeIcons.fileCode;
    }
  }

  Color get color {
    switch(this) {
      case FileType.image:
        return Colors.lightBlueAccent;
      case FileType.video:
        return Colors.purple;
      case FileType.audio:
        return Colors.orangeAccent;
      case FileType.word:
        return Colors.blueAccent;
      case FileType.excel:
        return Colors.green;
      case FileType.code:
        return Colors.black54;
    }
  }
}