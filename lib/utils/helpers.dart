class Helpers {

  static String frontPokemon(int id) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
  }

  static String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  static String getParam(String url) {
    url = url.replaceAll("v2", '');
    return url.replaceAll(RegExp("[a-zA-Z/:.]"), '');
  }

}