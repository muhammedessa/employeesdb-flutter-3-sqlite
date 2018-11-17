import 'package:flutter/material.dart';
import 'package:employeesdb/model/employee.dart';
import 'package:employeesdb/utils/database_helper.dart';


class EmployeeInfo extends StatefulWidget{
  final Employee employee;
  EmployeeInfo(this.employee);
  @override
  _EmployeeInfoState createState() => new _EmployeeInfoState();

}

class _EmployeeInfoState extends State<EmployeeInfo> {

  DatabaseHelper db = new DatabaseHelper();

  String age = '';
  String name = '';
  String department = '';
  String city = '';
  String description = '';
//
//  TextEditingController _ageController;
//  TextEditingController _nameController;
//  TextEditingController _departmentController;
//  TextEditingController _cityController;
//  TextEditingController _descriptionController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

      age = widget.employee.age;
      name = widget.employee.name;
      department = widget.employee.department;
      city = widget.employee.city;
      description = widget.employee.description;

//      _ageController = new TextEditingController(text: widget.employee.age);
//      _nameController = new TextEditingController(text: widget.employee.name);
//      _departmentController = new TextEditingController(text: widget.employee.department);
//      _cityController = new TextEditingController(text: widget.employee.city);
//      _descriptionController = new TextEditingController(text: widget.employee.description);

  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Employee Information') ,

       ),
       body: Container(
         margin: EdgeInsets.all(15.0),
//         alignment: Alignment.center,
         child: Column(
           children: <Widget>[
             Padding(padding: EdgeInsets.only(top: 20.0)),
              Text('name : $name',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0,
                ),
              ),
             Padding(padding: EdgeInsets.only(top: 20.0)),
             Text('age : $age',
               style: TextStyle(
                 fontStyle: FontStyle.normal,
                 fontSize: 22.0,
               ),),
             Padding(padding: EdgeInsets.only(top: 20.0)),
             Text('department: $department',
               style: TextStyle(
                 fontStyle: FontStyle.normal,
                 fontSize: 22.0,
               ),),
             Padding(padding: EdgeInsets.only(top: 20.0)),
             Text('city: $city',
               style: TextStyle(
                 fontStyle: FontStyle.normal,
                 fontSize: 22.0,
               ),),
             Padding(padding: EdgeInsets.only(top: 20.0)),
             Text('description: $description',
               style: TextStyle(
                 fontStyle: FontStyle.normal,
                 fontSize: 22.0,
               ),   maxLines: 10,),



           ],
         ),
       ),
     );
  }
}