// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_finalproject_app/screens/edit_todo_screen.dart';
// import 'package:flutter_finalproject_app/screens/login_screen.dart';
// import 'package:flutter_finalproject_app/screens/new_todo_screen.dart';

// // import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch:Colors.blue,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("todo").snapshots(),
//         builder: ((context, snapshot) {
//           final dataDocuments = snapshot.data?.docs;
//           if (dataDocuments == null) return const Text("No data");
//           return ListView.builder(
//             itemCount: dataDocuments.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(dataDocuments[index]["name"].toString()),
//                 subtitle: Text(dataDocuments[index]["desc"].toString()),
//                 onTap: () => _editTodoScreen(dataDocuments[index].id,
//                     dataDocuments[index]["name"], dataDocuments[index]["desc"]),
//               );
//             },
//           );
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _createNewTodo,
//         tooltip: 'Create New todo',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void _createNewTodo() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => NewTodoScreen()));
//   }

//   _editTodoScreen(String documentid, String todoName, String todoDesc) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => 
//                 EditTodoScreen(documentid, todoName, todoDesc)));
//   }
// }


