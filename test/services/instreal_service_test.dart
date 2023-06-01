import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/services/instreal_service.dart';

void main() {
  test('get contents', () async {
    final contents = await InstrealService().get();
    expect(contents.length, 3);
  });
}
