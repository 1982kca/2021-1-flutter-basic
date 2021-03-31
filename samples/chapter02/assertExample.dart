main() {
  String text;
  //text = 'KCA';

  try {
    assert(text != null);
    print('문자열은 "$text"입니다.');
  } catch (e) {
    print('문자열이 비었습니다.');
  }
}
