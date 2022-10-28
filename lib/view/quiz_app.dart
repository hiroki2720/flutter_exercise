
//view/quiz_app.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_test/view/event_index.dart';
import '../service/load_csv.dart';
import '../service/suffle.dart';
import '../view/quiz_page.dart';

class QuizApp extends StatelessWidget {
  QuizApp({Key? key}) : super(key: key);
  late List<Map> quizList;

  Future<void> goToQuizApp(BuildContext context) async {
    quizList = shuffle(await getCsvData('assets/quiz1.csv'));
    for (Map row in quizList) {
      debugPrint(row["question"]);
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizPage(quizList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            const Text(
              'クイズ',
            ),
            ElevatedButton(
                onPressed: () {
                  goToQuizApp(context); //クイズアプリへ遷移するQuizApp関数がよばれる
                },
                child: const Text('スタート')),
            ElevatedButton(
              child: Text("enpitアプリへ"),
              onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
              }
              ),
            )
          ],
        ),
      ),
    );
  }
}
