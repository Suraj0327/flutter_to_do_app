class ToDo{
  String?id;
  String?todoText;
  late bool isDone;

ToDo({
  required this.id,
required this.todoText,
this.isDone=false,
});
static List<ToDo>todoList(){
  return[
    ToDo(id: '01', todoText: 'Morning Exercise',isDone: true),
    ToDo(id: '02', todoText: 'Reading books',isDone: true),
    ToDo(id: '03', todoText: 'Breakfast',),
    ToDo(id: '04', todoText: 'Coding',),
    ToDo(id: '05', todoText: 'Do project',),

  ];
}}