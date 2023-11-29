import 'dart:typed_data';
import 'package:Your_Scan_Mate/Screens/QRcode/qr%20result.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
const Bgcolor = Color(0xfffafafa);

class QRSCANNER extends StatefulWidget {
  const QRSCANNER({super.key});

  @override
  State<QRSCANNER> createState() => _QRSCANNERState();
}

class _QRSCANNERState extends State<QRSCANNER> {
  bool isScannedcompleted = false;
  void closeScreen() {
    setState(() {
      isScannedcompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bgcolor,
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "QRCODE SCANNER",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  "Place the QR code in the area",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Scanning will start automatically",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            )),
            Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 20),
                      child: MobileScanner(
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          final Uint8List? image = capture.image;

                          if (barcodes.isNotEmpty && !isScannedcompleted) {
                            String code = barcodes.isNotEmpty
                                ? barcodes.first.rawValue ?? 'default'
                                : 'default';
                            setState(() {
                              isScannedcompleted = true;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QRRESULT(
                                  closeScreen: closeScreen,
                                  code: code,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Container(
              child: Text(
                "Developed by MD",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

//setState(() {
//                       isScannedcompleted = true;
//                     });
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => QRRESULT(
//                                 code: code, closeScreen: closeScreen)));
