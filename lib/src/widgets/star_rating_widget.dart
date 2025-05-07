import 'package:animated_star_rating/animated_star_rating.dart';
import 'package:flutter/material.dart';

class AnimatedStarRating extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final StarAnimationType animationType;

  const AnimatedStarRating({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
    this.animationType = StarAnimationType.scale,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedStarRatingState createState() => _AnimatedStarRatingState();
}

class _AnimatedStarRatingState extends State<AnimatedStarRating>
    with SingleTickerProviderStateMixin {
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  Widget _buildAnimatedStar(bool isSelected, int index) {
    final star = Icon(
      isSelected ? Icons.star : Icons.star_border,
      color: isSelected ? Colors.amber : Colors.grey,
      size: 50,
    );

    switch (widget.animationType) {
      case StarAnimationType.scale:
        return AnimatedScale(
          scale: isSelected ? 1.4 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: star,
        );
      case StarAnimationType.rotate:
        return AnimatedRotation(
          turns: isSelected ? 0.2 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: star,
        );
      case StarAnimationType.fade:
        return AnimatedOpacity(
          opacity: isSelected ? 1.0 : 0.4,
          duration: const Duration(milliseconds: 300),
          child: star,
        );
      case StarAnimationType.bounce:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceOut,
          builder: (context, value, child) => Transform.scale(
            scale: value,
            child: star,
          ),
        );
      case StarAnimationType.slide:
        return TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(
              begin: const Offset(0, 0.5),
              end: isSelected ? Offset.zero : const Offset(0, 0.5)),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          builder: (context, value, child) => Transform.translate(
            offset: value * 10,
            child: star,
          ),
        );
      case StarAnimationType.shake:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isSelected ? 8 : 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticIn,
          builder: (context, value, child) => Transform.translate(
            offset: Offset(value * (index.isEven ? 1 : -1), 0),
            child: star,
          ),
        );
      case StarAnimationType.flip:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isSelected ? 3.14 : 0),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          builder: (context, value, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(value),
            child: star,
          ),
        );
      case StarAnimationType.wobble:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isSelected ? 0.1 : 0.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticInOut,
          builder: (context, value, child) => Transform.rotate(
            angle: value * (index.isEven ? 1 : -1),
            child: star,
          ),
        );
      case StarAnimationType.zoom:
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: isSelected ? 1.5 : 1.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutBack,
          builder: (context, value, child) => Transform.scale(
            scale: value,
            child: star,
          ),
        );

      default:
        return star;
    }
  }

  Widget _buildStar(int index) {
    bool isSelected = index < _rating;

    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index + 1.0;
          widget.onRatingChanged(_rating);
        });
      },
      onPanUpdate: (details) {
        if (details.localPosition.dx >= (index * 50) &&
            details.localPosition.dx < ((index + 1) * 50)) {
          setState(() {
            _rating = index + 1.0;
            widget.onRatingChanged(_rating);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: _buildAnimatedStar(isSelected, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => _buildStar(index)),
    );
  }
}
