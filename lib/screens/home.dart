import 'package:flutter/material.dart';
import 'package:second_flutter_app/constants/color.dart';


import '../model/todo.dart';
import '../widgets/todoitems.dart';
class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
final todosList=ToDo.todoList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children:[
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(margin: const EdgeInsets.only(top:50,bottom:20,),
                  child: const Text('All ToDos',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,),),),
                  for(ToDo todo in todosList)
                    ToDoitems(todo: todo,),

                ],
              ),
            )
  ],),),);}
      Widget searchBox(){
        return Container(
          padding: EdgeInsets.symmetric(horizontal:15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search,color: tdBlack,size: 20),
              prefixIconConstraints:BoxConstraints(maxHeight: 20,minWidth: 25,),
              border: InputBorder.none,
              hintText:'Search',
              hintStyle: TextStyle(color:tdGrey),
            ),),);




      }
  AppBar _buildAppBar(){
    return AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
          Icon(Icons.menu,color:tdBlack,size:30,),
          Container(
            height: 40,
            width: 40,
            child:ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child:Image.asset('assets/images/coder.png'),
            ) ,
          )
        ]
       ),


    );
  }
}
