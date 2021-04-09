import 'package:flutter/material.dart';

class kalkulatorbmi extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<kalkulatorbmi> {
  //controller untuk mendapatkan value dari inputan
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  double _hitung;

  @override
  Widget build(BuildContext context) {
    return Scaffold( //untuk mengatur struktur visual layout
      appBar: AppBar(
        title: Text('Kalkulator BMI 185411194'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            //untuk mengontrol field tinggi badan
            TextField(
              controller: _tinggiController, //controller menangkap input
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
              ),
            ),
            SizedBox(height: 24),
            //untuk mengontrol field berat badan
            TextField(
              controller: _beratController, //controller menangkap input
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
              ),
            ),
            SizedBox(height: 20),
            //untuk mengontrol tombol hitung
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: kalkulatorBMI,
            ),
            SizedBox(height: 15),
            Text(
              _hitung == null ? "Tambahkan angka" : "BMI Anda adalah ${_hitung.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void kalkulatorBMI() {
    // variabel untuk parsing inputan
    double tinggi = double.parse(_tinggiController.text) / 100; //dibagi 100 karena satuan inputan cm sedangkan formula yg ada itu meter
    double berat = double.parse(_beratController.text);

    // proses penghitungan dengan variabel
    // Rumus BMI3
    // BMI = (BB) / (TB)2

    double tinggi2 = tinggi * tinggi;
    double hasil = berat / tinggi2;
    // untuk mengembalikan nilai hasil perhitungan
    _hitung = hasil;

    setState(() {});
  }
}
