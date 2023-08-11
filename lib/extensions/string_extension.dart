extension StringExtensions on String {
  /// Returns a [String] with the first letter capitalized.
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
