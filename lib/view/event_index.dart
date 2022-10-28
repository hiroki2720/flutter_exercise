import 'package:flutter/material.dart';
import 'package:flutter_application_test/view/event_form.dart';
import 'event_form.dart';

// class NextPage extends StatefulWidget {
//   @override
//   _NextPageState createState() => _NextPageState();
// }

// class _NextPageState extends State<NextPage> {
//   String _eventName = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('イベント入力'),
//       ),
//       body: Container(
//           child: Column(
//         // ignore: prefer_const_literals_to_create_immutables
//         children: [
//           TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "イベントを入力してください",
//               ),
//               onChanged: (String value) {
//                 setState(() {
//                   _eventName = value;
//                 });
//               }),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => IndexPage(_eventName)));
//               },
//               child: Text("募集する")),
//         ],
//       )),
//     );
//   }
// }

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: Text('イベント一覧'),
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return IndexPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}