import 'package:flutter/material.dart';
import 'package:employeesdb/model/employee.dart';
import 'package:employeesdb/utils/database_helper.dart';
import 'package:employeesdb/ui/employee_screen.dart';
import 'package:employeesdb/ui/employee_info.dart';

class ListViewEmployees extends StatefulWidget{
  @override
    _ListViewEmployeesState createState() => new _ListViewEmployeesState();
}

class _ListViewEmployeesState extends State<ListViewEmployees>{

  List<Employee> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db.getAllEmployees().then((employees){
      setState(() {
        employees.forEach((employee){
          items.add(Employee.fromMap(employee));
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Employees',
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Employees'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
              padding:const EdgeInsets.all(15.0),
              itemBuilder: (context , position){
              return Column(
                children: <Widget>[
                  Divider(height: 5.0,),
                  Row(
                     children: <Widget>[

                       new Expanded(
                           child: ListTile(
                             title: Text('${items[position].name}',
                               style: TextStyle(fontSize: 22.0,color: Colors.redAccent
                               ),
                             ),
                             subtitle: Text('${items[position].age} - ${items[position].city} - ${items[position].department}',
                               style: TextStyle(fontSize: 14.0,fontStyle: FontStyle.italic,
                               ),
                             ),
                             leading: Column(
                               children: <Widget>[
                                 Padding(padding: EdgeInsets.all(1.0)),
                                 CircleAvatar(
                                   backgroundColor: Colors.amber,
                                   radius: 18.0,
                                   child: Text('${items[position].id}',
                                     style: TextStyle(fontSize: 22.0,color: Colors.white
                                     ),
                                   ),
                                 ),

                               ],
                             ),
                             onTap: () => _navigateToEmployeeInfo(context , items[position]),
                           )
                       ),

                       IconButton(icon: Icon(Icons.edit,color: Colors.blueAccent,),
                           onPressed: () => _navigateToEmployee(context , items[position]),
                       ),

                       IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                           onPressed: () => _deleteEmployee(context,items[position],position)
                       )
                     ],
                  ),



                ],

              );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.deepOrange,
            onPressed: () => _createNewEmployee(context)),
      ),
    );
  }




  _deleteEmployee(BuildContext context,Employee employee,int position) async{
    db.deleteEmployee(employee.id).then((employees){
      setState(() {
        items.removeAt(position);
      });
    });
  }


 void  _navigateToEmployee(BuildContext context ,Employee employee)async{
    String result = await Navigator.push(
        context,
      MaterialPageRoute(builder:(context) => EmployeeScreen(employee)),
    );

    if(result == 'update'){
      db.getAllEmployees().then((employees){
         setState(() {
           items.clear();
           employees.forEach((employee){
             items.add(Employee.fromMap(employee));
           });
         });
      });
    }
 }




  void  _navigateToEmployeeInfo(BuildContext context ,Employee employee)async{
      await Navigator.push(
      context,
      MaterialPageRoute(builder:(context) => EmployeeInfo(employee)),
    );


  }



 void _createNewEmployee(BuildContext context) async{
   String result = await Navigator.push(
     context,
     MaterialPageRoute(builder:(context) => EmployeeScreen(
         Employee(  '', '', '', '', ''))),
   );

   if(result == 'save'){
     db.getAllEmployees().then((employees){
       setState(() {
         items.clear();
         employees.forEach((employee){
           items.add(Employee.fromMap(employee));
         });
       });
     });
   }
 }

}