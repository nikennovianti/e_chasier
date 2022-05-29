// import 'package:weekday_selector/weekday_selector.dart';

// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/entypo.dart';
import 'package:iconify_flutter/icons/ic.dart';
// import 'package:http/http.dart'  as http;
import 'list.dart';
import 'dayPicker.dart';
import '../loginn.dart';

class daftarMitraLengkap extends StatefulWidget {
  // List list;
  // int index;
  // daftarMitraLengkap({required this.list, required this.index});

   daftarMitraLengkap({ Key? key }) : super(key: key);

  @override
  State<daftarMitraLengkap> createState() => _daftarMitraLengkapState();
}

class _daftarMitraLengkapState extends State<daftarMitraLengkap> {
  
  
  //informasi provinsi, kabupaten, kecamatan
  String? _provinsi;
  final List<Map>? _listProvinsi = listProvinsi;
  String? _namaProvinsi;
  String? _kabupaten;
  final List<Map>? _listKabupaten=listKabupaten;
  String? _namaKabupaten;

  //time pickertime
  TimeOfDay selectedTimeBuka = TimeOfDay.now();
  TimeOfDay selectedTimeTutup = TimeOfDay.now();

  //pilih waktu buka
  _selectTimeBuka(BuildContext context) async {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTimeBuka,
        initialEntryMode: TimePickerEntryMode.dial,
 
      );
      if(timeOfDay != null && timeOfDay != selectedTimeBuka)
        {
          setState(() {
            selectedTimeBuka = timeOfDay;
          });
        }
  }
  //pilih waktu tutup
  _selectTimeTutup(BuildContext context) async {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTimeTutup,
        initialEntryMode: TimePickerEntryMode.dial,
 
      );
      if(timeOfDay != null && timeOfDay != selectedTimeTutup)
        {
          setState(() {
            selectedTimeTutup = timeOfDay;
          });
        }
  }

  //tambah gambar ktp/kitas
    // String? imageData;
    
    // File? _imageFile;
    // Future _pilihGambar() async{
    //   var pickedImage = await ImagePicker().getImage(
    //     source: ImageSource.gallery,
    //     maxHeight: 200.0,
    //     maxWidth: 200.0
    //   );

    //   setState(() {
    //     _imageFile = File(pickedImage!.path);
    //   });
    //   imageData = base64Encode(_imageFile!.readAsBytesSync());
    // }

    // // editData(){
    // //   http.post(Uri.parse("http://192.168.1.17/mahasiswa/editData.php"),
    // //   body: {
    // //     "image": imageData,
    // //     "id":widget.list[widget.index]['id'],
    // //   }
    // //   );
    // // }
    
    // _showImage(String image){
    //   return Image.memory(base64Decode(image));
    // }

  @override
  Widget build(BuildContext context) {
    var _kabupatenfilter =_listKabupaten?.where((kabupaten) => kabupaten["province_id"] =="$_provinsi").toList();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor
        ),
        title: Text("Daftar Sebagai Mitra",
          style: heading24Secondary,
          textAlign: TextAlign.center,
        ),
        elevation: 0, 
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20), 
                          topRight: Radius.circular(20)
                          )
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: buttonColor, width: 3.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text("Dummy Nama",style: heading14White,),
                                  Padding(padding: EdgeInsets.only(left: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("dummy@email", style: heading14White,),
                                      Padding(padding: EdgeInsets.only(left: 5.0)),
                                      Text("|",style: heading16White,),
                                      Padding(padding: EdgeInsets.only(left: 5.0)),
                                      Text("0123456789",style: heading14White,)
                                    ]
                                  ),
                                ]
                              ),
                            )
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            children: [
                              Card(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Iconify(Ic.round_table_restaurant, color:secondaryColor, size: 50, ),
                                          title: Text("Nama Restaurant", style: heading14SecondaryMedium,),
                                          subtitle: Text("Masukkan tanpa menggunakan karakter atau simbol seperti +, *, ^, #, dsb. Contoh: Rumah Makan Enak", style: heading12Secondary,),
                                        ),
                                        Container(
                                          constraints: BoxConstraints(maxHeight: double.infinity,),
                                          padding: EdgeInsets.only(left: 5, right:5),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                isDense: true,
                                                hintStyle: heading14Button,
                                                hintText: "Masukkan"
                                              )
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                              ),
                              
                              Card(
                                color: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0)
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Iconify(Entypo.location_pin, color:secondaryColor, size: 50, ),
                                        title: Text("Alamat Restaurant", style: heading14SecondaryMedium,),
                                        subtitle: Text("Masukkan alamat lengkap dengan nomor, RT/RW, kelurahan, dan kecamatan. Contoh: No.2, 01/02, Indah Sari, Kec. Xx", style: heading12Secondary,),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(maxHeight: double.infinity,),
                                        padding: EdgeInsets.only(left: 5, right:5),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                                              border: InputBorder.none,
                                              isDense: true,
                                              hintStyle: heading14Button,
                                              hintText: "Masukkan"
                                            )
                                          ),
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.only(top: 5.0),),

                                      Container(
                                        height: 35,
                                        padding: EdgeInsets.only(left: 5, right:5),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: DropdownButtonHideUnderline(
                                                      child: ButtonTheme(
                                                        // alignedDropdown: true,
                                                        child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                          hint: Text("PilihProvinsi", style: heading14Button),
                                                          value: _provinsi,
                                                          isDense: true,
                                                          dropdownColor: whiteColor,
                                                          onChanged: (String? newValue) {
                                                            setState(() {
                                                              _kabupaten=null;
                                                              _namaKabupaten=null;
                                                              _provinsi = newValue;
                                                              _namaProvinsi = _listProvinsi![int.parse(newValue!)-1]['name'];
                                                            });
                                                            print (_provinsi);
                                                          },
                                                          items: _listProvinsi?.map((Map prov) {
                                                            return DropdownMenuItem<String>(
                                                              value: prov['id'],
                                                              child: Text(prov['name'], style: TextStyle(fontSize: 14),),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      )
                                                    ),
                                                  )
                                                ],
                                              ),
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.only(top: 5.0),),

                                      Container(
                                        height: 35,
                                        padding: EdgeInsets.only(left: 5, right:5),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: DropdownButtonHideUnderline(
                                                      child: ButtonTheme(
                                                        // alignedDropdown: true,
                                                        child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                          hint: Text("Pilih Kabupaten/Kota", style: heading14Button),
                                                          value: _kabupaten,
                                                          isDense: true,
                                                          dropdownColor: whiteColor,
                                                          onChanged: (String? newKab) {
                                                            setState(() {
                                                                _kabupaten = newKab;
                                                              _namaKabupaten = _listKabupaten![int.parse(newKab!)-1]['name'];
                                                            });
                                                            print (_kabupaten);
                                                          },
                                                          items: _listKabupaten?.map((Map kab) {
                                                            return DropdownMenuItem<String>(
                                                              value: kab['id'],
                                                              child: Text(kab['name'], style: TextStyle(fontSize: 14),),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      )
                                                    ),
                                                  )
                                                ],
                                              ),
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.only(top: 5.0),),

                                      Container(
                                        constraints: BoxConstraints(maxHeight: double.infinity,),
                                        padding: EdgeInsets.only(left: 5, right:5),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                                              border: InputBorder.none,
                                              isDense: true,
                                              hintStyle: heading14Button,
                                              hintText: "Masukkan Kode Pos"
                                            )
                                          ),
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.only(top: 5.0),),

                                      Container(
                                        constraints: BoxConstraints(maxHeight: double.infinity,),
                                        padding: EdgeInsets.only(left: 5, right:5),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                                              border: InputBorder.none,
                                              isDense: true,
                                              hintStyle: heading14Button,
                                              hintText: "Link GMaps"
                                            )
                                          ),
                                        ),
                                      ),

                                    ]
                                  ),
                                ),
                              ),

                              Card(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Iconify(Bi.info_circle_fill, color:secondaryColor, size: 40, ),
                                          title: Text("Informasi Restaurant", style: heading14SecondaryMedium,),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          constraints: BoxConstraints(maxHeight: double.infinity,),
                                          // padding: EdgeInsets.only(left: 5, right:5),
                                          decoration: BoxDecoration(
                                          // color: whiteColor,
                                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Waktu Operasional", style: heading12Secondary,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text (
                                                    "Waktu Buka:",
                                                    style: heading14Secondary
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        _selectTimeBuka(context);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: whiteColor,
                                                        onPrimary: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0)
                                                        )
                                                      ),
                                                    child: Text("${selectedTimeBuka.hour}:${selectedTimeBuka.minute}",),
                                                  ),
                                                  Text (
                                                    "-",
                                                    style: heading14Secondary
                                                  ),
                                                  Text (
                                                    "Waktu Tutup:",
                                                    style: heading14Secondary
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        _selectTimeTutup(context);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: whiteColor,
                                                        onPrimary: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0)
                                                        )
                                                      ),
                                                    child: Text("${selectedTimeTutup.hour}:${selectedTimeTutup.minute}",),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: SelectedDaysUpdateExample()
                                              )
                                            ],
                                          ),
                                        ),
                                        
                                      ]
                                    ),
                                  ),
                              ),
                              
                              Card(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Iconify(Ic.round_table_restaurant, color:secondaryColor, size: 50, ),
                                          title: Text("KTP atau KITAS", style: heading14SecondaryMedium,),
                                          subtitle: Text("Unggah foto KTP atau KITAS dengan format JPEG/JPG berukuran maks. 2MB.", style: heading12Secondary,),
                                        ),
                                        ElevatedButton(
                                                      onPressed: () {
                                                        //upload foto
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: whiteColor,
                                                        onPrimary: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0)
                                                        )
                                                      ),
                                                    child: Text("unggah foto", style: heading14Button,),
                                                  ),
                                      ]
                                    ),
                                  ),
                              ),
                            
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    // _isChecked==true 
                                    // ? () {
                                    //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => daftarMitraLengkap()));
                                    //   }
                                    // : null, 
                                    child: Text(
                                      "Daftar",
                                      style: heading24Secondary,
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
                            ],
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
