main() {
  print('각 자리수의 덧셈');

  int number = 1982;
  int sum = 0;

  while (number > 0) {
    sum += (number % 10);
    number ~/= 10; // 몫을 소수로 만들지 않고 나머지를 버리는 정수 나눗셈
  }

  print('합: $sum');
}
