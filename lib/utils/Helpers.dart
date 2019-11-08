import 'dart:math' show Random;

final _randomGenerator = Random();
const _persianNumberMap = {
  "0": "۰",
  "1": "۱",
  "2": "۲",
  "3": "۳",
  "4": "۴",
  "5": "۵",
  "6": "۶",
  "7": "۷",
  "8": "۸",
  "9": "۹",
  ".": ".",
};

int rand(int max) {
  return _randomGenerator.nextInt(max);
}

String intToPersian(
  int number, {
  bool seperated = true,
  String delimiter = ",",
}) {
  String _s = number.toString();
  StringBuffer buff = StringBuffer();
  if (seperated) {
    int len = _s.length;
    for (int i = 0; i < len; i++) {
      if ((len - i) % 3 == 0 && i != 0) {
        buff.write(delimiter);
      }
      buff.write(_persianNumberMap[_s[i]]);
    }
  } else {
    for (int i = 0; i < _s.length; i++) {
      buff.write(_persianNumberMap[_s[i]]);
    }
  }
  return buff.toString();
}
