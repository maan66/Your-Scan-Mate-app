import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF89852),
              Color(0xffFFCD34),
            ],
            begin: Alignment.centerRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Scan Mate",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Internship project of QR code and Barcode Scanner.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              Image.asset('assets/images/md-01.png', scale: 3,),
              SizedBox(height: MediaQuery.of(context).size.height/5,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
