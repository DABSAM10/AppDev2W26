void main() {
  print("Output: ${isPalindrome("radar")}");
  print("Output: ${isPalindrome("dart")}");
}

bool isPalindrome(String input) {
  // split() converts String into list of characters by split between each character
  // reversed() reverse the characters in the list
  // join() converts list of characters into String
  String str = input.split('').reversed.join('');

  return input == str;
}