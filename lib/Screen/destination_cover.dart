import 'package:flutter/material.dart';

import '../Models/destination_model.dart';

class DestinationCover extends StatelessWidget {
  final DestinationModel destination;
  final BoxFit fit;

  const DestinationCover({super.key, required this.destination, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Image.network(
        destination.imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _FallbackDestinationCover(destination: destination);
        },
        errorBuilder: (context, error, stackTrace) =>
            _FallbackDestinationCover(destination: destination),
      ),
    );
  }
}

class _FallbackDestinationCover extends StatelessWidget {
  final DestinationModel destination;

  const _FallbackDestinationCover({required this.destination});

  @override
  Widget build(BuildContext context) {
    final colors = switch (destination.category.toLowerCase()) {
      'wisata pegunungan' => const [Color(0xFF8A3C67), Color(0xFFD66A91)],
      'wisata pantai' => const [Color(0xFFB74370), Color(0xFFE78BA7)],
      'wisata budaya' => const [Color(0xFF704153), Color(0xFFB36B7F)],
      'wisata bahari' => const [Color(0xFF563546), Color(0xFFA14F6B)],
      'wisata edukasi' => const [Color(0xFF9B4E67), Color(0xFFE18B78)],
      _ => const [Color(0xFF77465F), Color(0xFFC47A98)],
    };

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_stories_rounded,
            color: Colors.white70,
            size: 25,
          ),
          const Spacer(),
          Text(
            destination.name,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              height: 1.1,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            destination.location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}