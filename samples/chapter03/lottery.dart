import 'dart:math' as math;

main() {
  var rand = math.Random();
  Set<int> lottery = Set();

  while (lottery.length < 6) {
    lottery.add(rand.nextInt(45));
  }

  print('result: $lottery');
}
