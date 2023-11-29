import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarCodeGenerator extends StatefulWidget {
  BarCodeGenerator({super.key});

  @override
  State<BarCodeGenerator> createState() => _BarCodeGeneratorState();
}

class _BarCodeGeneratorState extends State<BarCodeGenerator> {
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
          "BARCODE GENERATOR",
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
                     "Generate your own barcode",
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
                     "Barcode will generate automatically while writing",
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
                child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BarcodeWidget(
                  data: controller.text,
                  barcode: Barcode.code128(),
                  width: 500,
                  height: 200,
                  drawText: false,
                ),
              ),
            )),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Expanded(
                flex: 3,
                  child: buildTextField(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
          cursorColor: Colors.amber,
          controller: controller,
          onSubmitted: (_)=> setState(() {

          }),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: 'Enter your text',
            labelStyle: TextStyle(color: Colors.black),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Colors.amber),
              onPressed: () {
                // Handle submit action here
              },
            ),
          ),
        ),
  );
}
