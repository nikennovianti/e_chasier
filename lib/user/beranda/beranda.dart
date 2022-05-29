import 'package:flutter/material.dart';


class berandaUser extends StatefulWidget {
  const berandaUser({ Key? key }) : super(key: key);

  @override
  State<berandaUser> createState() => _berandaUserState();
}

class _berandaUserState extends State<berandaUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        
                      ),
                    )
                  ]
                ),
              ),
            )
          )
        ]
      )
    );
    
  }
}