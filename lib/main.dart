import 'package:e_chasier/login-daftar/daftarMitraLengkap/daftar-mitra-lengkap.dart';
import 'package:e_chasier/login-daftar/loginn.dart';
import 'package:flutter/material.dart';
// part 'theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor:Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(0, 255, 255, 255))
      ),
      home: daftarMitraLengkap(),
      
    );
  }
}