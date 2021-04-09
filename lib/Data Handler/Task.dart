class Task{
  String _Name;
  String _Description;
  String _Deadline;
  List _tasks = [];
  void insert(String task,String deadline,String desc){
    this._Name = task;
    this._Description = desc;
    this._Deadline= deadline;
    bool flag = false;
    // loop below will be used to determine weather the task with same name is already present or not
    for(int i=0 ; i<_tasks.length ; ++i){
      if(task==_tasks[i][0]){
        _tasks[i][0] = task;
        _tasks[i][1] = desc;
        _tasks[i][2] = deadline;
        flag = true;
        break;
      }
    }
    //--------- if task not present , it will make a new task
    if(flag == false){
      List temp = [this._Name,this._Description,this._Deadline,false];
      _tasks.add(temp);
    }
  }
  List getData(){
    // this will sort our list on the basis of dates
    _tasks.sort((a,b) {
      var ta = a[2];
      var tb = b[2];
      return ta.compareTo(tb);
    });
    //-----------------------------------
    return _tasks;
  }
}