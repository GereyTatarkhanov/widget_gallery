/// An extension method to capitalize the first letter of a String.
///
/// This extension method can be used on String objects to capitalize the first letter.
/// ```dart
/// String word = 'hello';
/// String capitalizedWord = word.capitalize();
/// ```
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

/// An extension method to swap elements at two indices in a List.
///
/// This extension method can be used on List objects to swap elements at the specified indices.
/// ```dart
/// List<int> numbers = [1, 2, 3, 4];
/// numbers.swap(0, 2);
/// ```
extension SwappableList<T> on List<T> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}
