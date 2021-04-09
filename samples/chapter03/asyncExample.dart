main() {
  getResult();

  print('end process');
}

Future getResult() async {
  print('before call');

  var result = await veryLongTask();
  print('result: $result');
}

String veryLongTask() {
  print('do very long task');

  return 'the result from the very long task';
}
