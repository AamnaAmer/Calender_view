import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight)
  {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }
  Container taskList(String title, String description, IconData iconImg, Color iconColor)
  {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            iconImg,
            color: iconColor,
            size: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width:MediaQuery.of(context).size.width*0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(title, style:(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    description, style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,),),

                ],
              )
          )
        ],
      ),
    );
  }
  @override
  void initState()
  {
    super.initState();
    _controller = CalendarController();
  }
  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                SizedBox (height: 30,),
                  TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      weekdayStyle: dayStyle(FontWeight.normal),
                      weekendStyle: dayStyle(FontWeight.normal),
                      selectedColor: Color(0xff30374b),
                      todayColor: Colors.grey,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Color(0xff30384c), fontWeight: FontWeight.bold, fontSize: 16),
                      weekendStyle: TextStyle(color: Color(0xff30384c), fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: Color(0xff30384c), fontWeight: FontWeight.bold, fontSize: 20),
                    leftChevronIcon: Icon(Icons.chevron_left, color:Color(0xff30384c)),
                      rightChevronIcon: Icon(Icons.chevron_right, color:Color(0xff30384c)),
                    ),
                    calendarController: _controller,
                  ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(50), topRight: Radius.circular(50) ),
                    color:Color(0xff30384c),
                  ),
                  child: Stack(
                    children: <Widget>[
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Padding(padding: EdgeInsets.only(top:50),
                        child: Text("Today", style: TextStyle(
                         color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,),),
                       ),
                        taskList("Recording One", "Description of Recording One to be Updated Here.", CupertinoIcons.heart_solid, Color(0xff00cf8c), ),
                       taskList("Recording Two", "Description of Recording Two to be Updated Here.", CupertinoIcons.heart_solid, Color(0xffff9e00)),
                       taskList("Recording Three", "Description of Recording Three to be Updated Here.", CupertinoIcons.heart_solid, Color(0xffff9e00)),
                       taskList("Recording Three", "Description of Recording Three to be Updated Here.", CupertinoIcons.heart_solid, Color(0xffff9e00)),
                     ]
                   ),
                      Positioned(
                        bottom: 0,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end:FractionalOffset.bottomCenter,
                              colors: [
                                Color(0xff30384c).withOpacity(0),
                                Color(0xff30384c)
                              ],
                              stops:[
                                0.0,
                                1.0,
                              ]
                            )
                          ),
                        )
                      ),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.all((10)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xffb038f1),
                            boxShadow: [BoxShadow(
                            color:Colors.black38,
                                blurRadius: 30,
                            )]
                          ),
                          child: Text("+", style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),


                          ),
                        ),
                      ),
                    ]
                )
                )
              ]
          ),
      ),
    ),
    );
  }
}
