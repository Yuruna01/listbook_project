import 'package:flutter/material.dart';
import 'package:listbook_project/data1.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.81,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                itemCount: dataImages.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                //Bagian gambar yang bisa dislide
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(dataImages[index]),
                    )),
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: List.generate(
                    dataImages.length,
                    (index) => Padding(
                        padding: const EdgeInsets.only(left: 16 / 4),
                        child: IndicatorDot(isActive: index == _currentPage))),
              ),
            )
          ],
        )
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}