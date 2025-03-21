import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/widgets/circular_icon_button.dart';
import 'package:team10_dhiraga/widgets/gradient_border.dart';

class BeasiswaCard extends StatefulWidget {
  final String title;
  final String dateRange;
  final String imageUrl;
  final IconData bookmarkIcon;
  final Color dateBackgroundColor;

  const BeasiswaCard({
    super.key,
    required this.title,
    required this.dateRange,
    required this.imageUrl,
    this.bookmarkIcon = Icons.bookmark_border,
    this.dateBackgroundColor = AppColors.alternative2,
  });

  @override
  _BeasiswaCardState createState() => _BeasiswaCardState();
}

class _BeasiswaCardState extends State<BeasiswaCard> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      borderRadius: 14,
      child: Container(
        width: 170,
        constraints: BoxConstraints(minHeight: 200, maxHeight: 220),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircularIconButton(
                      icon: widget.bookmarkIcon,
                      size: 30,
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      isActive: isActive,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                      decoration: BoxDecoration(
                        color: widget.dateBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          widget.dateRange,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
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
}
