
class ModelList {
  final List _list = [];

  List get list => _list;



//? I added these codes because of the try to test widget

void add(String item) {
      _list.add(item);  
  }

void remove(String item) {
    _list.remove(item);
  }

 get size => list.length;

}
