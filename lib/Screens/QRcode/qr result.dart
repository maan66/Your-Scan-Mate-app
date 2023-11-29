import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRRESULT extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const QRRESULT({super.key, required this.code, required this.closeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              closeScreen();
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "QRCODE RESULT",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: code,
              version: QrVersions.auto,
              size: 150,
            ),
            Text(
              "Scanned Result",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  print('Copied');
                },
                child: Text(
                  "Copy",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
