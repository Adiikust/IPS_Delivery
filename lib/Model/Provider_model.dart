import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';

class ListProvider with ChangeNotifier{
  List<String> list=[];
  void addItem (String item){
    list.add(item);
    notifyListeners();
  }
  void deleteItem (int index){
    list.removeAt(index);
    notifyListeners();
  }
}