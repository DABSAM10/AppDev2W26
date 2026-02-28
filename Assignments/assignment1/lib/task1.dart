void main() {
  List<String> items = ['apple', 'banana', 'orange', 'grapes', 'mango'];
  var longest = "";
  
  items.forEach((item) {
    if (item.length > longest.length) {
      longest = item;
    }
  });
  
  print("Longest string in the items list: $longest");
}