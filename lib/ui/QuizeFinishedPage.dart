import 'package:flutter/material.dart';
import 'package:q3/ui/CheckAnswerPage.dart';
import 'package:q3/ui/question.dart';

class QuizeFinishedPage extends StatelessWidget{
  List<Question>questions2;
  Map<int ,dynamic>answers;
  QuizeFinishedPage(this.questions2,this.answers);
  @override
  Widget build(BuildContext context) {
    int correct=0;
    this.answers.forEach((index,value){
      if(this.questions2[index].correctAnswer==value)
        correct++;
    });
    final TextStyle titleStyle=TextStyle(color:Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w500,fontFamily: 'Merriweather');

    final TextStyle trailingStyle=TextStyle(color:Colors.green,

        fontSize: 20,
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Result",style: TextStyle(fontFamily: 'Merriweather'),),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),


                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text("Total Questions ",style: titleStyle,
                    ),
                    trailing: Text("${questions2.length}",style: trailingStyle,),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text("Scor ",style: titleStyle,
                    ),
                    trailing: Text("${correct/questions2.length*100}%",style: trailingStyle,),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text("Correct Answer ",style: titleStyle,
                    ),
                    trailing: Text("$correct/${questions2.length}",style: trailingStyle,),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text("incorecct Answer ",style: titleStyle,
                    ),
                    trailing: Text("${questions2.length-correct}/${questions2.length}",style: TextStyle(color:Colors.red,

                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Go to Home"),
                      onPressed: ()=>Navigator.pop(context),

                    ),
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("check Answer",style: TextStyle(fontFamily: 'Merriweather'),),
                      onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(
                          builder: (_)=>CheckAnswerPage(questions2,answers)
                      )),

                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}