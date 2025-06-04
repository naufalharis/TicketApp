import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:universal_html/html.dart' as html;
import 'package:open_file/open_file.dart';

import '../models/tiket.dart';

Future<void> generateAndDownloadPDF(Tiket tiket) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Padding(
        padding: const pw.EdgeInsets.all(24),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Bukti Pembayaran",
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Text("Nama Tiket: ${tiket.name}"),
            pw.Text("Tipe: ${tiket.type}"),
            pw.Text("Harga: Rp ${tiket.price}"),
            pw.SizedBox(height: 16),
            pw.Divider(),
            pw.Text("Total Pembayaran: Rp ${tiket.price}",
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 32),
            pw.Text("Terima kasih telah melakukan pembelian."),
          ],
        ),
      ),
    ),
  );

  final Uint8List bytes = await pdf.save();

  if (kIsWeb) {
    // Web: Download as Blob
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'bukti_pembayaran.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  } else {
    // Android/iOS/Desktop
    final dir = await getApplicationDocumentsDirectory();
    final file = io.File('${dir.path}/bukti_pembayaran.pdf');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }
}
