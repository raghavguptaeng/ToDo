import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/Data%20Handler/Task.dart';
import 'package:todo/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String displayforDeadline = "Deadline";
  String Taskname = '';
  String Description = '';
  List taskList = [
    ['', '', '',false] // temp list to store data in main screen
  ];
  Task t = new Task(); // central class to store task values
  DateTime selectedDate = DateTime.now(); // for getting date
  final TextEditingController _taskNameController = new TextEditingController();
  final TextEditingController _descController = new TextEditingController();
  // following function is used to activate date picker
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String Temp = selectedDate.toString().split(' ')[0];
        List Date = Temp.split('-');
        displayforDeadline = Date[2] + '-' + Date[1] + '-' + Date[0];
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Inputs(context),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.black))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                child: Text('ADD / SAVE'),
                onPressed: () {
                  t.insert(Taskname, displayforDeadline, Description);
                  final snackBar = SnackBar(
                    content: Text('Task added / updated successfully'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    Taskname = '';
                    displayforDeadline = 'Deadline';
                    Description = '';
                    taskList = t.getData();
                  });
                },
              ), //flexible
            ),
            Text('TODO', style: GoogleFonts.rubik(fontSize: 35)),
            Column(
                children: taskList.map<Widget>((data) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    Taskname = data[0];
                    displayforDeadline = data[2];
                    Description = data[1];
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data[0],
                      style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      data[2],
                      style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
  // input widgets in a common method
  Column Inputs(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Deadline:",
                  style: GoogleFonts.dancingScript(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  child: Text(displayforDeadline),
                  onPressed: () => _selectDate(context),
                ), //flexible
              ), //container
            ], //widget
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Task:",
                  style: GoogleFonts.dancingScript(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Flexible(
                  child: TextField(
                    controller: _taskNameController,
                    onChanged: (value) {
                      Taskname = value;
                    },
                    decoration: Input_field_decor.copyWith(
                        hintText: 'Please enter Task', labelText: Taskname),
                  ),
                ),
              ), //flexible
              //container
            ], //widget
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Description:",
                style: GoogleFonts.dancingScript(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width*0.10,
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Flexible(
                  child: TextField(
                    controller: _descController,
                    onChanged: (value) {
                      Description = value;
                    },
                    maxLines: 4,
                    decoration: Input_field_decor.copyWith(
                        hintText: 'Please Provide new Task Description',
                        labelText: Description),
                  ),
                ), //flexible
              ), //container
            ], //widget
          ),
        ),
      ],
    );
  }
}
