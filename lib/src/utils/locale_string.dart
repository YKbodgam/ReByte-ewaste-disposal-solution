import 'package:get/get.dart';

import '../config/languages/translate_eng.dart';
import '../config/languages/translate_guj.dart';
import '../config/languages/translate_hin.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_IN': en,
    'gu_IN': gu,
    'hi_IN': hi,
  };
}
