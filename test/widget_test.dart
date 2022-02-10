import 'package:arabic_number_conversion/providers/list.dart';
import 'package:test/test.dart';


// I just started to learn Test. I am confident in my fast learning abilities. 
// I am sure that I will gain experience by learning and trying on my applications as soon as possible.

void main() {
  test('List size should be one after adding a String', () {
    final nameList = ModelList();

    nameList.add("Test");

    expect(nameList.size, 1);
  });


}