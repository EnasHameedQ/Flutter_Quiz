
import 'package:flutter/material.dart';
import 'package:q3/ui/Category.dart';
import 'package:q3/ui/demoValue.dart';
import 'package:q3/ui/demoValue2.dart';
import 'package:q3/ui/demoValue3.dart';
import 'package:q3/ui/demoVlue4.dart';
import 'package:q3/ui/question.dart';
import 'package:q3/ui/quiz_age.dart';

class Shat extends StatefulWidget{
  Category qategory;
  Shat(this.qategory);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuiztionDiaiogPageState();
  }
}
class QuiztionDiaiogPageState extends State<Shat>{

  int qonum;
  String qlevel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState(



    );

    qonum=10;
    qlevel="any";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(


        child:Container(
          color: Colors.blue,
          child: Column(children: <Widget>[



            Container(


              margin: EdgeInsets.all(20),
              child: Text(widget.qategory.name,style: TextStyle(color: Colors.white,fontFamily: 'Merriweather'),),
              width: double.infinity,



            ),
            Text("اختار عدد الاسئلة",style: TextStyle(color: Colors.white
                ,fontFamily: 'Playfair Display'),),
            SizedBox(width: double.infinity,
              child: Wrap(

                alignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,

                runAlignment: WrapAlignment.center,
                children: <Widget>[
                  buildActionChip(10),
                  buildActionChip(20),
                  buildActionChip(30),
                  buildActionChip(40),
                ],
              ),
            ),
            Text("اختر الصعوبة",style: TextStyle(color: Colors.white,fontFamily: 'Playfair Display')),
            SizedBox(width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                runAlignment: WrapAlignment.center,
                children: <Widget>[
                  buildActionChip2("منوع"),
                  buildActionChip2("سهل"),
                  buildActionChip2("متوسط"),
                  buildActionChip2("صعب"),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),

                ),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("ابدأ الاختبار",style: TextStyle(fontFamily: 'Merriweather'),),
                onPressed: (){startQuize();},

              ),
            ),

          ],),
        )

    );
  }
  ActionChip buildActionChip(int numq) {
    return ActionChip(label: Text(numq.toString(),style: TextStyle(color: Colors.yellow.shade600,fontFamily: 'Playfair Display'),),
      backgroundColor:qonum == numq?Colors.white:Colors.blue,
      onPressed: ()=>onSelectNumberof(numq),);
  }
  ActionChip buildActionChip2(String level) {
    return ActionChip(label: Text(level.toString(),style: TextStyle(color: Colors.yellow.shade600,fontFamily: 'Playfair Display'),),
      backgroundColor:qlevel == level?Colors.white:Colors.blue,
      onPressed: ()=>onSelectNumberof2(level),);
  }

  onSelectNumberof2(String levelName ){
    setState(() {
      qlevel=levelName;
    });

  }

  onSelectNumberof(int qnmber){
    setState(() {
      qonum=qnmber;
    });

  }
  startQuize(){

    List<Question>questions=demoQuestions;
    List<Question>questions2=demoQuestions2;
    List<Question>questions3=demoQuestions3;
    List<Question>questions4=demoQuestions4;

    if(widget.qategory.name =='رياضية'){

      print(questions.length);
      print(questions[0].question);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>quiz_age(widget.qategory,questions)));
    }
    else if(widget.qategory.name =='ثقافية'){
      print(questions2.length);
      print(questions2[0].question);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>quiz_age(widget.qategory,questions2)));
    }
    else if(widget.qategory.name =='دينية'){
      print(questions2.length);
      print(questions2[0].question);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>quiz_age(widget.qategory,questions3)));
    }
    else if(widget.qategory.name =='علمية'){
      print(questions4.length);
      print(questions4[0].question);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>quiz_age(widget.qategory,questions4)));
    }





    /*  print(questions.length);
   print(questions[0].question);
   Navigator.pop(context);
   Navigator.push(context, MaterialPageRoute(builder: (_)=>quiz_age(widget.qategory,questions)));*/


  }
}


