import 'package:dashboard_ui/enums/filetype.dart';

class DataFile {
  final String nome;
  final String data;
  final double tamanho;
  final FileType tipo;

  DataFile(this.nome, this.data, this.tamanho, this.tipo);
}