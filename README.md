# Animated Star Rating

A Flutter package to add interactive animated star ratings with various animation types like scale, rotate, bounce, fade and etc.
<table>

  <tr>
    <td><img src="https://raw.githubusercontent.com/VenuNeosoft/animated_star_rating/main/demo.gif" width=270 height=560></td>
  
  </tr>
 </table>

## 🚀 Getting Started

### 1. **Add Dependency**
Add the following to your `pubspec.yaml`:

``` yaml
dependencies:
  animated_star_rating: ^1.0.0
  ```
2. Install Package
Run the following command:

flutter pub get

3. Import the Package
``` package
import 'package:animated_star_rating/animated_star_rating.dart';
```

📖 Usage
🖼️ Give rating number and animation
``` example ratings
Widget _buildRatingRow(String label, StarAnimationType animationType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

    _buildRatingRow("Bounce Animation", StarAnimationType.bounce),
```



# 📸 Developed by
✅ VENU RENANGI  
✅ SONAM GUPTA
✅ KAMNA JOSHI