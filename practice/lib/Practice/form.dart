import 'package:flutter/material.dart';



  class MyCustomForm extends StatefulWidget{
    @override
    MyCustomFormState createState() {
      return MyCustomFormState();
    }
  }

  class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
   int uiCourseNo = 1;
  
  int cNumber;
  String courseName = "";
  TextEditingController courseNumber = new TextEditingController();
  int appCourseNumber = 1;
  String initialCourse = "Course 1";
  TextStyle style =
      TextStyle(fontFamily: "Montserrat", fontSize: 25, color: Colors.black);
  TextEditingController myCourseName = TextEditingController();
  _printLatestValue() {
    print("Second text field: ${myCourseName.text}");
  }
  FocusNode myFocusNode;

  @override
  void dispose() {
    //clean up the controller when the widget is removed from the widget tree
    myCourseName.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    //start listening to changes 
    myCourseName.addListener(_printLatestValue);
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Build form widget using the _formKey above
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("Courses",
      ),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(6),
          children: <Widget>[
            Column(children: <Widget>[ Container(
              padding: EdgeInsets.all(20),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10),],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Course $uiCourseNo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),),
                        
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        focusNode: myFocusNode,
                        controller: myCourseName,
                        onChanged: (text) {
                          if(text.isEmpty){
                          return "Please enter Course Name";
                          }

                          return courseName = text;
                          

                        },
                      ),
                    ),
                    SizedBox(height: 20,),

                    
                    RaisedButton(
                      onPressed: () {
                        // of the form is valid, display a snackbar. In the real world. 
                        // you'd often call a server or save the information in a database. 
                        if(_formKey.currentState.validate()){
                          Scaffold
                                  .of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text("Submit"),
                      elevation: 10,
                    ),

                    SizedBox(height: 10,),

                    FloatingActionButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(myFocusNode);
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              //retrieve the text the user has enetered into the text field
                              content: Text(myCourseName.text), 
                            );
                          }
                        );
                      },
                      tooltip: 'Show me the value',
                      child: Icon(Icons.text_fields),
                    ),
                  ],
                ),
              ),
            )],)
          ],
        ),
      ),
    );
   }
  }
    