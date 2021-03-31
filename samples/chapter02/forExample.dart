main() {
  print('반복문은 역시 구구단이지!');

  for (int i = 2; i < 10; i++) {
    for (int j = 1; j < 10; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}
