import 'package:get_storage/get_storage.dart';

class Storage {
  // final _name = ReadWriteValue('nameKey', '');
  // final _nameGetX = ReadWriteValue('nameKey', '', () => GetStorage('Jornada GetX'));

  final _name = ''.val('nameKey');
  final _nameGetX = ''.val('nameKey', getBox: () => GetStorage('Jornada GetX'));

  set name(String value) => _name.val = value;
  String get name => _name.val;

  set nameGetX(String value) => _nameGetX.val = value;
  String get nameGetX => _nameGetX.val;
}
