main() {
  callFunction(printAndReturn);
}

callFunction(var function) {
  print('result: ${function("TEST")}');
}

String printAndReturn(String name) {
  print('Hello, $name!');
  return name;
}
