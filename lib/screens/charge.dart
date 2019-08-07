import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ChargeScreen extends StatefulWidget {
  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charge"),
        actions: <Widget>[
          IconButton(
            onPressed: () => print("print"),
            icon: Icon(Icons.print),
          )
        ],
      ),

      body: Container(
        alignment: Alignment.center,
        
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Icon(Icons.check_circle_outline, size: 130, color: Theme.of(context).primaryColor,),
                  ), 
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Total: 2.00"),
                        Text("Cash: 10.00"),
                        Text("Change: 8.00", style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Customer email...",
                    suffix: RaisedButton(
                      onPressed: () => print("send receipt"),
                      child: Text("SEND"),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {
                  print("back to home");
                  Navigator.of(context).pushNamed('/home');
                },
                color: Colors.lightGreen,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New sale",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.check_circle, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
