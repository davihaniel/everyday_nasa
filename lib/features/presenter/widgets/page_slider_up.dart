import 'package:everyday_nasa/features/presenter/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class PageSliderUp extends StatelessWidget {
  final VoidCallback onSlideUp;
  final Widget child;
  const PageSliderUp({
    super.key,
    required this.onSlideUp,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (update) {
        if (update.delta.dy < 0) {
          onSlideUp();
        }
      },
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            child,
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: CustomShimmer(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_up,
                        size: 35,
                      ),
                      Text(
                        "Slide up to see the description",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
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