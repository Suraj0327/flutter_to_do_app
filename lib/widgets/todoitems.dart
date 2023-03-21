import 'package:flutter/material.dart';
import 'package:second_flutter_app/constants/color.dart';

import '../model/todo.dart';
class  ToDoitems extends StatelessWidget {
  const ToDoitems({Key? key, required this.todo}) : super(key: key);
  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ListTile(
            onTap: (){
              print('clicked on ToDoitem.');
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
           contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            tileColor: Colors.white,
            leading:  Icon(todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color: tdBlue,),
            title: Text(todo.todoText!,style: TextStyle(fontSize: 16,color: tdBlack,decoration: todo.isDone?TextDecoration.lineThrough:null,),),
         trailing: Container(
           padding: EdgeInsets.all(0),
           margin: EdgeInsets.symmetric(vertical: 8),
           height: 35,
           width: 35,
           decoration: BoxDecoration(
             color: tdRed,
             borderRadius: BorderRadius.circular(5),
           ),
           child: IconButton(
             color: Colors.white,
             iconSize: 18,
             icon: const Icon(Icons.delete),
             onPressed: (){
               print('clicked on delete button');
             },
           ),
         ), ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children:[
            Expanded(child: Container(margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                decoration:  BoxDecoration(
              color: Colors.white,
              boxShadow:const [ BoxShadow(color: Colors.grey,offset: Offset(0.0,0.0),
              blurRadius: 10.0,
              spreadRadius: 10.0),


              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child:TextField(
              decoration:InputDecoration(
                hintText: 'Add a new todo item',
                border: InputBorder.none
              ),
            ),),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right:20,
              ),
              child: ElevatedButton(
                child: Text('+',style:TextStyle(fontSize: 40)),
                onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  primary: tdBlue,
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),

              ),
            )
          ]),
        ),
      ],
    );
  }
}
