import 'package:flutter/material.dart';
import '../screens/Bukti_PembayaranScreen.dart';
import '../models/tiket.dart';
import 'package:flutter/services.dart';

class MetodeKartuKreditScreen extends StatelessWidget {
  final Tiket tiket;

  const MetodeKartuKreditScreen({super.key, required this.tiket});

  @override
  Widget build(BuildContext context) {
    const cardNumber = "8810 7766 1234 9876";

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pembayaran Kartu Kredit",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          tooltip: 'Tutup',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Margin bawah untuk judul
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 229, 229), // Background abu-abu muda
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        "assets/images/credit_card.png",
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              cardNumber,
                              style: const TextStyle(fontSize: 16, letterSpacing: 1.2),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Clipboard.setData(const ClipboardData(text: cardNumber));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Nomor kartu disalin!")),
                              );
                            },
                            icon: const Icon(Icons.copy, size: 18),
                            label: const Text("Salin"),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              minimumSize: const Size(0, 32),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Transfer Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Pastikan nominal dan tujuan pembayaran sudah benar sebelum melanjutkan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BuktiPembayaranScreen(tiket: tiket),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Konfirmasi Pembayaran"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
