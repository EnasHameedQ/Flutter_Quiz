enum Type{
  multiple,
  boolean

}
enum Difficultly{
  easy,
  medium,
  hard
}
class Question{
  String categroyName;
  Type type;
  Difficultly difficultly;
  String question;
  String correctAnswer;
  List<dynamic> incorrectAnswers;


  Question({this.categroyName, this.type, this.difficultly, this.question,
    this.correctAnswer, this.incorrectAnswers});

  Question.fromMap(Map<String , dynamic>data){
    categroyName=data["category"];
    type=data["type"]=="muitiple"?
    Type.multiple:Type.boolean;
    difficultly=data["Difficultly"]=="easy"?
    Difficultly.easy :data["difficultly"]=="medium"?
    Difficultly.medium :Difficultly.hard;
    question=data["question"];
    correctAnswer=data["correctanswer"];
    incorrectAnswers=data["incorrectanswer"];

  }
  static List<Question>fromData(List<Map<String,dynamic>>data){
    return data.map((g)=>Question.fromMap(g)).toList();
  }


}