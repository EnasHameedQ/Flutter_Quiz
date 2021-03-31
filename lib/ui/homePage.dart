import 'package:flutter/material.dart';
import 'package:q3/ui/Shat.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'Category.dart';

class homePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor:Colors.blue,

        title:
        Center(child: Text("Quize App", textAlign: TextAlign.right,style: TextStyle(fontFamily: 'Merriweather',),)),
        leading: Icon(Icons.home),




      ),
      body: Stack(
        children: <Widget>[
          Container(

            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(

            ),

            child: Image.asset('assets/blue&yellow.jpg', fit: BoxFit.cover),


          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only ( top:150,left: 20),
                  child: Text("Catogaryies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
                      color: Colors.white,fontFamily: 'Merriweather'),),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
                    buildGraidCard,
                    childCount: Categories.length

                ),gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10)




                  ,),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget  buildGraidCard( BuildContext context,int index){

    Category category =Categories[index];
    return
      MaterialButton(onPressed: (){
        showButtonCheet(context,category);
      },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
        ,color: Colors.yellow,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            category.icon!=null?Icon(category.icon,color: category.color,size: 30,):Icon(category.icon),
            SizedBox(height: 20,),
            Text(category.name,style: TextStyle(color: Colors.white,fontFamily: 'Merriweather'),)

          ],
        ),);


  }
  showButtonCheet(BuildContext ctx,Category category)
  {
    showBottomSheet(context: ctx, builder:(sheetctx)=>BottomSheet(
      builder: (_)=>Shat(category),
      onClosing: (){},
    ));

  }
}


List<Category> Categories = [
  Category(1, "رياضية", Colors.white,FontAwesomeIcons.footballBall),
  Category(1,  "ثقافية", Colors.white,FontAwesomeIcons.artstation),
  Category(1,  "دينية", Colors.white,FontAwesomeIcons.mosque),
  Category(1,  "علمية", Colors.white,FontAwesomeIcons.microscope),
];
