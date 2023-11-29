import 'package:flutter/material.dart';
import '../constants/about.dart';
import '../constants/button container.dart';
import 'Barcode/barcode_generator.dart';
import 'QRcode/qr_code.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: height * .65,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270),
              child: Container(
                height: height * .75,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: width * .15,
              top: height * .40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose',
                    style: TextStyle(
                      inherit: false,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'your scan option',
                    style: TextStyle(
                      inherit: false,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * .50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BtnContainer(
                          BtnText: 'Barcode Generator',
                          icon: Icons.bar_chart,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BarCodeGenerator()));
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        BtnContainer(
                          BtnText: 'Barcode    Scanner',
                          icon: Icons.barcode_reader,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRSCANNER()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        BtnContainer(
                            BtnText: 'QR-Code',
                            icon: Icons.qr_code_2_outlined,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRSCANNER()));
                            }),
                        SizedBox(
                          width: 15,
                        ),
                        BtnContainer(
                          BtnText: 'About',
                          icon: Icons.info_outline_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: MediaQuery.of(context).size.width / 3.5,
                child: Image.asset(
                  'assets/images/md-01.png',
                  scale: 13,
                )),
          ],
        ),
      ),
    );
  }
}
