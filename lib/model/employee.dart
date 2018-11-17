class Employee{

  int _id;
  String _age;
  String _name;
  String _department;
  String _city;
  String _description;

  Employee(
        this._age, this._name , this._department,
      this._city,this._description

      );

  Employee.map(dynamic obj){
    this._id = obj['id'];
    this._age = obj['age'];
    this._name = obj['name'];
    this._department = obj['department'];
    this._city = obj['city'];
    this._description = obj['description'];
  }

  int get id => _id;
  String get age => _age;
  String get name => _name;
  String get department => _department;
  String get city => _city;
  String get description => _description;


  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;
    }

    map['age'] = _age;
    map['name'] = _name;
    map['department'] = _department;
    map['city'] = _city;
    map['description'] = _description;

    return map;
  }

  Employee.fromMap(Map<String , dynamic> map){

   this._id = map['id'] ;
   this._age = map['age'] ;
    this._name = map['name']  ;
    this._department  = map['department']   ;
    this._city = map['city'] ;
    this._description  = map['description']   ;


  }


}