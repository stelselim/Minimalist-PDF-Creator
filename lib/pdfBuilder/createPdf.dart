import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfmaker/pdfBuilder/imageEdit.dart';
import 'package:printing/printing.dart' as printing;

Future buildPdf({@required List<Asset> data, @required int quality}) async {
  final pdf = pw.Document();

  for (int i = 0; i < data.length; i++) {
    var local = await data[i].getByteData(quality: quality);
    final buffer = local.buffer;


    final localImage = PdfImage.file(
      pdf.document,
      bytes: buffer.asUint8List(),
    );

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat(
            PdfPageFormat.a4.width, PdfPageFormat.a4.height,
            marginAll: 8 * PdfPageFormat.mm),
        build: (pw.Context context) {
          if (localImage.width > localImage.height) {
            return pw.Center(
              child: pw.Image(localImage, fit: pw.BoxFit.fitWidth),
            ); // Center

          } else {
            return pw.Center(
              child: pw.Image(localImage, fit: pw.BoxFit.fitHeight),
            ); // Center
          }
        }));
  }

  var time = DateTime.now();

  var name = time.millisecondsSinceEpoch;

  print(name);

  final output = await getTemporaryDirectory();
  final res = pdf.save();
  //await File("${output.path}/$name.pdf").writeAsBytes(res);

  await printing.Printing.sharePdf(
    bytes: res,
    filename: "$name.pdf",
  );

  return "${output.path}/$name.pdf";
}
