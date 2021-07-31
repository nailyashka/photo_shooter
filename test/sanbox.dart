import 'package:test/test.dart';

Future<void> f() async {
  final r = getName();
  r.then((value) => print('!$value'));
  print(r);
}

Future<String> getName() async {
  print('someone asked for name! i will try to remember it!');
  await Future<void>.delayed(Duration(seconds: 4));
  print('we will return name now!');
  return 'nailysik';
}

void main() {
  test(
    'future',
    () async {
      await f();
      print('test will wait additional 10 sec');
      await Future<void>.delayed(Duration(seconds: 10));
      print('test completed!');
    },
  );
  test(
    'stream',
    () async {
      f2();
      print('test will wait additional 10 sec');
      await Future<void>.delayed(Duration(seconds: 10));
      print('test completed!');
    },
  );
}

Stream<int> getNumbers() async* {
  await Future<void>.delayed(Duration(seconds: 1));
  yield 1;
  await Future<void>.delayed(Duration(seconds: 1));
  yield 2;
  await Future<void>.delayed(Duration(seconds: 2));
  yield 4;
}

void f2() {
  final s = getNumbers();
  s.listen((eventNum) {
    print('event with name $eventNum catched');
  });
}
