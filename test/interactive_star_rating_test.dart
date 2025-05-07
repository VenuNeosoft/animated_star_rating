import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animated_star_rating/animated_star_rating.dart';

void main() {
  testWidgets('Interactive Star Rating widget test',
      (WidgetTester tester) async {
    double rating = 0.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedStarRating(
            initialRating: 3.0,
            onRatingChanged: (newRating) {
              rating = newRating;
            },
          ),
        ),
      ),
    );

    // Test initial state
    expect(rating, 3.0);

    // Test tapping a star to change the rating
    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();
    expect(rating, 1.0);
  });
}
