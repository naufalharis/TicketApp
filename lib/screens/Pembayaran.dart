import 'package:flutter/material.dart';
import '../models/tiket.dart';
import '../metode/MetodeQRISScreen.dart';
import '../metode/MetodeKartuKreditScreen.dart';
import '../metode/MetodeTunaicreen.dart';

class PembayaranScreen extends StatelessWidget {
  final Tiket tiket;

  const PembayaranScreen({super.key, required this.tiket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCard(),
            const SizedBox(height: 24),
            const Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildPaymentMethodWithImage(
              context,
              "Tunai (Cash)",
              "assets/images/icons/Cash.png",
              Colors.green.shade100,
              MetodeTunaiScreen(tiket: tiket),
            ),
            _buildPaymentMethodWithImage(
              context,
              "Kartu Kredit",
              "assets/images/icons/Kredit.png",
              Colors.purple.shade100,
              MetodeKartuKreditScreen(tiket: tiket),
            ),
            _buildPaymentMethodWithImage(
              context,
              "QRIS / QR Pay",
              "assets/images/icons/Qris.png",
              Colors.blue.shade100,
              MetodeQRISScreen(tiket: tiket),
            ),
            const SizedBox(height: 28),
            const Text(
              "Punya pertanyaan?",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.help_outline, size: 20, color: Colors.blue),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Hubungi Admin untuk bantuan pembayaran.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/icons/Dolar.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Tagihan",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rp ${tiket.price}",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Nama Pesanan",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  "${tiket.name} - ${tiket.type}",
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text(
                  "Tanggal",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  _formatTanggal(),
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodWithImage(
    BuildContext context,
    String label,
    String imagePath,
    Color bgColor,
    Widget destination,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0.8,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Image.asset(imagePath, width: 24, height: 24),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
      ),
    );
  }

  String _formatTanggal() {
    final now = DateTime.now();
    return "${now.day} ${_bulanIndo(now.month)} ${now.year}";
  }

  String _bulanIndo(int bulan) {
    const namaBulan = [
      "", "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return namaBulan[bulan];
  }
}
