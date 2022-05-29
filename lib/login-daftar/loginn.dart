import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';

import 'daftarMitraLengkap/daftar-mitra-lengkap.dart';
part '../theme.dart';
// import 'package:flutter/widgets.dart';

Widget buildBlur({
    required Widget child,
    double sigmaX = 5,
    double sigmaY = 5
}) => 
  ClipRRect(
    borderRadius: BorderRadius.zero,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: child,
    ),
  ); 


class WellcomePage extends StatefulWidget {
  const WellcomePage({ Key? key }) : super(key: key);

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // height: size.height,
      // width: double.infinity,
      home: Scaffold(
          body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 50,
                  right: 0,
                  child: Image.asset("assets/images/ellipse1.png")
                ),
                Positioned(
                  top: 268,
                  left: 0,
                  child: Image.asset("assets/images/login-daftar-ellipse2.png")
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/login-daftar-ellipse3.png")
                ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset("assets/images/login-daftar.png"),
                          SizedBox(height: 20),
                          Text("E-Chasier", style: heading36White),
                          SizedBox(height: 5),
                          Text("Halo, Selamat Datang", style: heading24Secondary),
                          SizedBox(height: 20),
                          
                          //Login
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width /3,
                            child: ElevatedButton(
                              onPressed: () {
                                
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context, 
                                  builder: (context) => const login()
                                );
                              
                              }, 
                              child: Text(
                                "Login",
                                style: heading14SecondaryBold,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  side: BorderSide(
                                    width: 1, color: secondaryColor)
                                )
                              )
                            )
                          ),
                                      
                                      
                          SizedBox(height: 12),
                                      
                          //Daftar
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width /3,
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context, 
                                  builder: (context) => daftar()
                                  );
                              }, 
                              child: Text(
                                "Register",
                                style: heading14SecondaryBold,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  side: BorderSide(
                                    width: 1, color: secondaryColor)
                                )
                              )
                            )
                          ),
                        ],
                      ),]
                    ),
                  ),
                  
                
              ],
              ),
          ),
        
    );
  }
}


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _isHiddenPassword = true;
  bool _isRadioSelected = false;
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: [
        buildBlur(
          child: Container(
            // backgroundColor: ,
            width: MediaQuery.of(context).size.width,
            // color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
              color: Color.fromRGBO(6, 70, 53, 0.59),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20)
                )
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 24),
                  child: Column(
                    children: [
                      // Text("E-Chasier", style: loginDaftar),
                      Iconify(AntDesign.line_outline, color: whiteColor,),
                      SizedBox(height: 24),
                      Text("LOGIN", style: heading24White),
                      SizedBox(height: 12),
                      Text("Selamat Datang Kembali", style: heading16White),
                      SizedBox(height: 24),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                        child: TextField(
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          icon: Iconify(Ic.outline_alternate_email, color: whiteColor),
                          hintText: "Email", 
                          hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),
                          ),
                        ),
                          ),
                      ),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 10),
                        child: TextField(
                          obscureText: _isHiddenPassword,
                          textAlignVertical: TextAlignVertical.center,
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outlined, color: whiteColor),
                            hintText: "Password", 
                            hintStyle: TextStyle(color: Color.fromARGB(170, 235, 224, 224)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isHiddenPassword 
                                ? Icons.visibility_off_outlined 
                                : Icons.visibility_outlined,
                                  color: whiteColor,
                              ),
                              onPressed:() {
                                setState(() {
                                  _isHiddenPassword = !_isHiddenPassword;
                                });
                              },
                              
                            )
                          ),
                        ),
                          ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 12,),
                            primary: whiteColor
                          ),
                          onPressed: () {}, 
                          child: const Text('Lupa kata sandi?')
                        ),
                      ),
                      SizedBox(height: 24),
                      
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: Text(
                              "Masuk",
                              style: heading14SecondaryBold,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                  width: 1, color: whiteColor)
                              )
                            )
                          ),
                        )
                      ),
                  
                      SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum punya akun?", 
                          style: heading16White,),
                  
                          TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, decoration: TextDecoration.none),
                            primary: buttonColor
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, 
                            builder: (context) => daftar()
                            );
                            
                          }, 
                          child: const Text('Daftar disini')
                        ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        
          ),
        )
      ],
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label, style: heading14White,)
          ],
        ),
      ),
    );
  }
}

class daftar extends StatefulWidget {
  // const daftar({ Key? key }) : super(key: key);

  @override
  State<daftar> createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  bool _isHiddenPassword = true;
  bool _isHiddenKonfirmasiPassword = true;
  bool _isChecked = false;
  bool _isRadioSelected = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        buildBlur(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
              color: Color.fromRGBO(6, 70, 53, 0.59),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20)
                )
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 24),
                  child: Column(
                    children: [
                      
                      // Text("E-Chasier", style: loginDaftar),
                      Iconify(AntDesign.line_outline, color: whiteColor,),
                      SizedBox(height: 24),
                      Text("REGISTER", style: heading24White),
                      SizedBox(height: 24),
                      
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                        child: TextField(
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          icon: Iconify(AntDesign.user_outlined, color: whiteColor),
                          hintText: "Nama", 
                          hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),
                          ),
                        ),
                          ),
                      ),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                        child: TextField(
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          icon: Iconify(Ic.outline_alternate_email, color: whiteColor),
                          hintText: "Email", 
                          hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),
                          ),
                        ),
                          ),
                      ),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                        child: TextField(
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          icon: Iconify(Bi.telephone, color: whiteColor),
                          hintText: "No. Telepon", 
                          hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),
                          ),
                        ),
                          ),
                      ),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 10),
                        child: TextField(
                          obscureText: _isHiddenPassword,
                          textAlignVertical: TextAlignVertical.center,
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outlined, color: whiteColor),
                            hintText: "Password", 
                            hintStyle: TextStyle(color: Color.fromARGB(170, 235, 224, 224)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isHiddenPassword 
                                ? Icons.visibility_off_outlined 
                                : Icons.visibility_outlined,
                                  color: whiteColor,
                              ),
                              onPressed:() {
                                setState(() {
                                  _isHiddenPassword = !_isHiddenPassword;
                                });
                              },
                              
                            )
                          ),
                        ),
                          ),
                      ),
                      Card(
                        color: Color.fromRGBO(6, 70, 53, 0.66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(
                            width: 1, color: whiteColor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 10),
                        child: TextField(
                          obscureText: _isHiddenKonfirmasiPassword,
                          textAlignVertical: TextAlignVertical.center,
                          style: heading14White,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outlined, color: whiteColor),
                            hintText: "Password", 
                            hintStyle: TextStyle(color: Color.fromARGB(170, 235, 224, 224)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isHiddenKonfirmasiPassword 
                                ? Icons.visibility_off_outlined 
                                : Icons.visibility_outlined,
                                  color: whiteColor,
                              ),
                              onPressed:() {
                                setState(() {
                                  _isHiddenKonfirmasiPassword = !_isHiddenKonfirmasiPassword;
                                });
                              },
                              
                            )
                          ),
                        ),
                          ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Daftar Sebagai: "),
                          LabeledRadio(
                            label: 'User',
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            value: true,
                            groupValue: _isRadioSelected,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isRadioSelected = newValue;
                              });
                            },
                          ),
                          LabeledRadio(
                            label: 'Mitra',
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            value: false,
                            groupValue: _isRadioSelected,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isRadioSelected = newValue;
                              });
                            },
                          ),
                        ],
                      ),  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(2)
                              ),
                              child: Checkbox(
                                value: _isChecked, 
                                checkColor: whiteColor,
                                onChanged: (value){
                                  setState(() {
                                    _isChecked = 
                                    value!;
                                  });
                                }
                              ),
                            ),
                            Text(
                              "   Saya setuju dengan kebijakan privasi",
                              style: heading12White,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            onPressed: _isChecked==true 
                            ? () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                              isScrollControlled: true,
                              context: context, 
                              builder: (context) => login()
                            );
                              }
                            : null, 
                            child: Text(
                              "Selanjutnya",
                              style: heading14SecondaryBold,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                  width: 1, color: whiteColor)
                              )
                            )
                          ),
                        )
                      ),
        
                      SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sudah punya akun?", 
                          style: heading16White,),
                  
                          TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, decoration: TextDecoration.none),
                            primary: buttonColor
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, 
                            builder: (context) => const login()
                            );
                          }, 
                          child: const Text('Masuk disini')
                        ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        
          ),
        )
      ],
    );
  
  }
}


// }


