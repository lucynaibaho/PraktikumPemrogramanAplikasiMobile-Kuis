import 'package:flutter/material.dart';

import '../Models/destination_model.dart';
import 'destination_cover.dart';

class DestinationDetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DestinationDetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 210,
                height: 300,
                child: DestinationCover(destination: destination),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              destination.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF54263A),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${destination.location}  ·  ${destination.category}",
              style: const TextStyle(color: Color(0xFF8A6877), fontSize: 15),
            ),
            const SizedBox(height: 18),
            // Row(
            //   children: [
            //     ...List.generate(5, (index) {
            //       final starValue = index + 1;
            //       final icon = destination.g>= starValue
            //           ? Icons.star_rounded
            //           : destination.rating >= starValue - 0.5
            //           ? Icons.star_half_rounded
            //           : Icons.star_border_rounded;
            //       return Icon(icon, color: const Color(0xFFFFB300), size: 22);
            //     }),
            //     const SizedBox(width: 8),
            //     Text(
            //       destination.rating.toStringAsFixed(1),
            //       style: const TextStyle(
            //         color: Color(0xFF54263A),
            //         fontWeight: FontWeight.w700,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFE8CBD6)),
            const SizedBox(height: 12),
            _DestinationInfoRow(label: "Nama Destinasi", value: destination.name),
            _DestinationInfoRow(label: "Kategori Destinasi", value: destination.category),
            _DestinationInfoRow(label: "Lokasi", value: destination.location),
            // _DestinationInfoRow(
            //   // label: "Jumlah kunjungan",
            //   // value: "${destination.visitCount} kali",
            // ),
            const SizedBox(height: 16),
            const Text(
              "Detail Destinasi",
              style: TextStyle(
                color: Color(0xFF54263A),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              destination.description,
              style: const TextStyle(
                color: Color(0xFF684A58),
                height: 1.55,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.tonalIcon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text("Kembali ke Daftar Destinasi"),
                style: FilledButton.styleFrom(
                  foregroundColor: const Color(0xFF9E3E68),
                  backgroundColor: const Color(0xFFF9DCE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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

class _DestinationInfoRow 
extends StatelessWidget {
  final String label;
  final String value;

  const _DestinationInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF8A6877)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF54263A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}