main() {
  String command = 'STOP'; // 임의의 문자열로 변경

  print('Start');
  switch (command) {
    case 'STOP':
      print('Stoped');
      break;
    case 'LEFT':
      print('Go Left');
      break;
    case 'RIGHT':
      print('Go Right');
      break;
    case 'FORWARD':
      print('Go Forward');
      break;
    case 'BACK':
      print('Go Back');
      break;
    default:
      print('Unknown Command');
  }
  print('Done');
}
