import 'package:cloud_firestore/cloud_firestore.dart';

class ItemService {
  Future<void> addTodo2Firebase(String documentid, Map<String, String> data) {
    return FirebaseFirestore.instance
        .collection("todos")
        .doc(documentid)
        .set(data)
        .then((value) {
      print("Item created");
    }).catchError((error) {
      print("Can't create todo:" + error.toString());
    });
  }

  Future<void> editItem(String documentid, Map<String, String> data) {
    return FirebaseFirestore.instance
        .collection("todos")
        .doc(documentid)
        .update(data)
        .then((value) {
      print("Todo update");
    }).catchError((error) {
      print("Can't update todo:" + error.toString());
    });
  }

  Future<void> deleteItem(String documentid) {
    return FirebaseFirestore.instance
        .collection("todos")
        .doc(documentid)
        .delete()
        .then((value) {
      print("Todo deleted");
    }).catchError((error) {
      print("Can't delete todo:" + error.toString());
    });
  }
}
