import 'dart:async';

void main()  { // async

  /*
  * ! assertion
  * ? nullable variable
  * ?? null aware
  * ??= null aware assignment
  * ?. null aware access
   */

  // String? input;
  // print(input?.length);
  // print(input?.toLowerCase());



  // print('start fetching recipes');
  //
  // Future.delayed(Duration(seconds: 5), () {
  //   print('recipes fetched');
  // }).then((_) { // If no data use _
  //   print('after fetching recipes');
  // });
  //
  // String computation = 'a random computation';
  // print(computation);



  // print('start fetching recipes');
  //
  // await Future.delayed(Duration(seconds: 3), () {
  //   print('recipes fetched');
  // });
  //
  // print('after fetching recipes');
  //
  // String computation = 'a random computation';
  // print(computation);



  // print('Start');
  // fetchUserData().then((user) {
  //   print('Received user: $user');
  // }).catchError((error){
  //   print('Error: $error');
  // });
  // print('End');



  // print('Start');
  // try {
  //   final user = await fetchUserData();
  //   print('Received user: $user');
  // } catch (error) {
  //   print('Error: $error');
  // }
  // print('End');



  // final stream = countStream(5);
  // stream.listen((data) {
  //   print('Data: $data');
  // });



  var list = List<int>.filled(5, 10); // Fixed values
  print(list);



  bool sad = false;
  var cart = ['Milk', 'Ghee', if (sad) 'Beer'];
  print(cart);
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // yield - stores amd throws the value resume; return - throws only one value
  }
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2)); // Simulating a network request
  return 'John Doe';
}