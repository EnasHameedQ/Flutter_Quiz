

import 'package:flutter/material.dart';
import 'package:q3/ui/Category.dart';
import 'package:q3/ui/QuizeFinishedPage.dart';
import 'package:q3/ui/question.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class quiz_age extends StatefulWidget{
  Category category;
  List<Question> questines;
  quiz_age(this.category, this.questines);
  @override
  State<StatefulWidget> createState() {
    return quize_age(category,questines);
  }
}
class quize_age extends State<quiz_age>{
  int _curindex = 0;
  Map<int, dynamic> _answer = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  quize_age(Category category, quistion);
  @override
  Widget build(BuildContext context) {
    Question question = widget.questines[_curindex];

    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }
    return WillPopScope(
      onWillPop: _pop,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.category.name),
          elevation: 0,
        ),
        key:_key,
        body:

        Stack(
          children: <Widget>[
            ClipPath(
              clipper: MultiplePointedEdgeClipper(),
              child: Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(

                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Text("${_curindex}",style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child:
                          Text("${widget.questines[_curindex].question}",style:TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Merriweather') ,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map((options) => RadioListTile(
                          title: Text("$options",style: TextStyle(fontFamily: 'Merriweather',fontSize: 12),),
                          groupValue: _answer[_curindex],
                          value: options,
                          onChanged: (value) {
                            setState(() {
                              _answer[_curindex] = options;
                            });
                          },
                        ))
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.white,
                        child: Text(_curindex == (widget.questines.length - 1)
                            ? "Submit"
                            : "Next",style: TextStyle(fontFamily: 'Merriweather'),),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      ),

    );
  }
  void _nextSubmit() {
    if (_answer[_curindex] == null) {
      _showSnackBar();
return;
    }
    if (_curindex < (widget.questines.length - 1)) {
      setState(() {
        _curindex++;
      });

    }
    else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizeFinishedPage(widget.questines, _answer)));
    }


  }

  Future<bool> _pop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Warrning"),
            content: Text("Are You Shour to Left"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("No"))
            ],
          );
        });
  }
  void _showSnackBar()
  {
    final _snackbar=SnackBar(
      content: Text("you most select answer"),
    );
_key.currentState.showSnackBar(_snackbar);
  }

}