


import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:q3/ui/homePage.dart';
import 'package:q3/ui/question.dart';

class CheckAnswerPage extends StatelessWidget{
  List<Question>questions;
  List<Question>questions2;
  List<Question>questions3;
  List<Question>questions4;
  Map<int,dynamic>answer;
  CheckAnswerPage(this.questions,this.answer);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Check answer",style: TextStyle(fontFamily: 'Merriweather'),),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.blue[200],
              ),
              height: 20,

            ),
          ),
          Container(
            color:Colors.blue[200],
            child:
            ListView.builder(itemBuilder: _buildItem,
              itemCount: questions.length+1,
              padding: EdgeInsets.all(20),),
          )

        ],
      ),
    );

  }
  Widget _buildItem( BuildContext context,int index){
    if(index==questions.length){
      return RaisedButton(child:Text("Done") ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        color: Colors.blue,
        textColor: Colors.black,
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_)=>homePage()
          ));



        },
      );


    }
    Question question = questions[index];
    bool correct =question.correctAnswer==answer[index];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Card(
          margin: EdgeInsets.all(7),
          color: Colors.yellow,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(question.question, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,fontFamily: 'Playfair Display'
              ),),
              SizedBox(height: 5,),
              Text("${answer[index]}",style: TextStyle(
                  color: correct ?Colors.green:Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,fontFamily: 'Playfair Display'

              ),),
              SizedBox(height: 5,),
              correct ? Container():Text.rich(TextSpan(
                  children: [
                    TextSpan(text:"Answer:",style: TextStyle(color: Colors.black)),
                    TextSpan(text: question.correctAnswer,style: TextStyle(
                        fontWeight: FontWeight.w500,color: Colors.black
                        ,fontFamily: 'Playfair Display'
                    ))
                  ]
              ))
            ],
          ),
        ),
      ),
    );

  }

}
