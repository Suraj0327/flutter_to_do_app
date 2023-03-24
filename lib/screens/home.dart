import 'package:flutter/material.dart';
import 'package:second_flutter_app/constants/color.dart';


import '../model/todo.dart';
import '../widgets/todoitems.dart';
class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final todosList=ToDo.todo();
List<ToDo> _foundToDo=[];
final _todoController= TextEditingController();
@override
void initState(){

  _foundToDo=todosList;
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children:[
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(margin: const EdgeInsets.only(top:50,bottom:20,),
                      child: const Text('All ToDos',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,),),),
                      for(ToDo todo in _foundToDo.reversed)
                        ToDoitems(todo: todo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteitem: _deleteToDoitem,


                        ), ],
                  ),
                ),

  ],),),
            Align(
              alignment: Alignment.bottomCenter,
              child:Row(children:[Expanded(
    child:Container(
                margin:EdgeInsets.only(bottom:20,right:20,left:20,),
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const[BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0,0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),],
                  borderRadius: BorderRadius.circular(10),),
                  child:TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none,
                    ),
                  ),
                ),


              ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(fontSize: 40,),),
                    onPressed: (){
                      _addToDoitem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60,60 ),
                      elevation: 10,

                    ),
                  ),
                ),


              ],),), ],),
        );}
     void   _handleToDoChange(ToDo todo){
  setState(() {
    todo.isDone=! todo.isDone;
  });
        }
        void _deleteToDoitem(String id){
    setState(() {
      todosList.removeWhere((items) =>items.id==id );
    });
        }
        void _addToDoitem(String toDo){
   setState(() {
     todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(),todoText: toDo));
   });
   _todoController.clear();
        }
        void _runFilter(String enteredkeyword){
  List<ToDo> result=[];
  if(enteredkeyword.isEmpty){
    result=todosList;
  }
  else{
    result=todosList.where((item)=>item.todoText!.toLowerCase().contains(enteredkeyword.toLowerCase())).toList();
  }
  setState(() {
    _foundToDo=result;
  });
        }

      Widget searchBox(){
        return Container(
          padding: EdgeInsets.symmetric(horizontal:15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child:  TextField(
            onChanged: ( value)=> _runFilter( value),
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
