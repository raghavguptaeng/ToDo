import 'package:flutter/material.dart';

class Task{
  String _Name;
  String _Description;
  String _Deadline;
  List _tasks = [];
  void insert(String task,String deadline,String desc){
    this._Name = task;
    this._Description = desc;
    this._Deadline= deadline;
    List temp = [this._Name,this._Description,this._Deadline,false];
    _tasks.add(temp);
  }
  List getData(){
    return _tasks;
  }
}