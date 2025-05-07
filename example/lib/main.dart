import 'package:animated_star_rating/animated_star_rating.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _buildRatingRow(String label, StarAnimationType animationType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        AnimatedStarRating(
          initialRating: 3.0,
          animationType: animationType,
          onRatingChanged: (rating) {
            // print('$label Rating changed: $rating');
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Rating Animation',
      home: Scaffold(
        appBar: AppBar(title: const Text('All Star Rating Animations')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildRatingRow("Bounce Animation", StarAnimationType.bounce),
                _buildRatingRow("Scale Animation", StarAnimationType.scale),
                _buildRatingRow("Rotate Animation", StarAnimationType.rotate),
                _buildRatingRow("Fade Animation", StarAnimationType.fade),
                _buildRatingRow("Slide Animation", StarAnimationType.slide),
                _buildRatingRow("Shake Animation", StarAnimationType.shake),
                _buildRatingRow("Flip Animation", StarAnimationType.flip),
                _buildRatingRow("Wobble Animation", StarAnimationType.wobble),
                _buildRatingRow("Zoom Animation", StarAnimationType.zoom),
                _buildRatingRow("No Animation", StarAnimationType.none),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
