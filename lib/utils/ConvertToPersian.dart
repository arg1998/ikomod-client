const Map<String, String> translator = const {
  '0': '۰',
  '1': '۱',
  '2': '۲',
  '3': '۳',
  '4': '۴',
  '5': '۵',
  '6': '۶',
  '7': '۷',
  '8': '۸',
  '9': '۹',
  '.': '.'
};

String toPersian(String number) {
  StringBuffer temp = StringBuffer();

  for (int i = 0; i < number.length; i++) {
    temp.write(translator[number[i]]);
  }
  return temp.toString();
}
