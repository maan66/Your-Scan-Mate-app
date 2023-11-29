import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class BarCodeScanenr extends StatefulWidget {
  BarCodeScanenr({super.key});

  @override
  State<BarCodeScanenr> createState() => _BarCodeScanenrState();
}

class _BarCodeScanenrState extends State<BarCodeScanenr> {
  String? Scanresult;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "BARCODE SCANNER",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  "Place your barcode",
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 60),
                  elevation: 0,
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                ),
                onPressed: scanBarcode,
                child: Text(
                  "Scan Barcode",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),),
            SizedBox(height: 25,),
            Expanded(
                child: Text(
              Scanresult == null ? 'Scan Barcode' : 'ScanResult : $Scanresult',
            ))
          ],
        ),
      ),
    );
  }

  Future scanBarcode() async {
    String Scanresult;
    try {
      Scanresult = await FlutterBarcodeScanner.scanBarcode(
          'FFC107FF', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      Scanresult = 'Failed to get ';
    }
    if (!mounted) return;
    setState(() => this.Scanresult = Scanresult);
  }
}
