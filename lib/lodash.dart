// String
String _removeApostrophes(String string) {
  return string.replaceAll(new RegExp(r"['\u2019]"), "");
}

String _compound(String string, String func(String word, int i)) {
  var result = "";
  final parts = words(_removeApostrophes(string));

  for (var i = 0; i < parts.length; i++) {
    final word = parts[i].toLowerCase();

    result += func(word, i);
  }

  return result;
}

List<String> words(String string) {
  return string
      .toLowerCase()
      .replaceAll(new RegExp(r"[^a-z0-9]"), " ")
      .replaceAll(new RegExp(r"\ +"), " ")
      .trim()
      .split(" ");
}

String upperFirst(String str) {
  final chars = str.split("");
  final first = chars.first;

  return first.toUpperCase() + chars.skip(1).join("");
}

String capitalize(String string) => upperFirst(string.toLowerCase());

String camelCase(String string) {
  return _compound(string, (word, i) {
    final lowerCaseWord = word.toLowerCase();

    return i > 0 ? capitalize(lowerCaseWord) : lowerCaseWord;
  });
}

String pascalCase(String string) =>
    _compound(string, (word, i) => upperFirst(word));

String kebabCase(String string) =>
    _compound(string, (word, i) => (i > 0 ? "-" : "") + word.toLowerCase());

String lowerCase(String string) =>
    _compound(string, (word, i) => (i > 0 ? " " : "") + word.toLowerCase());

String snakeCase(String string) =>
    _compound(string, (word, i) => (i > 0 ? "_" : "") + word.toLowerCase());

String startCase(String string) =>
    _compound(string, (word, i) => (i > 0 ? " " : "") + upperFirst(word));

String upperCase(String string) =>
    _compound(string, (word, i) => (i > 0 ? " " : "") + word.toUpperCase());
