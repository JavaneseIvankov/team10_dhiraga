import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/data/constants/mentor_constants.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/widgets/custom_shadow.dart';
import 'package:team10_dhiraga/widgets/gradient_border.dart';

class MentorCard extends StatelessWidget {
  final MentorModel? mentor;
  final String imageUrl;
  final String name;
  final String description;
  List<String> tags;
  final double rating;

  MentorCard({
    super.key,
    this.mentor,
    String? imageUrl,
    String? name,
    String? description,
    List<String>? tags,
    double? rating,
  }) : imageUrl =
           mentor?.profilePictureURL ?? 'https://via.placeholder.com/150',
       name = mentor?.fullName ?? 'Unknown Mentor',
       description = mentor?.deskripsi ?? 'No description available',
       tags = [],
       rating = mentor?.rating ?? 0.0 {
    this.tags = _getDisplayTags();
  }

  List<String> _getDisplayTags() {
    if (mentor?.tags != null) {
      return (mentor?.tags
              .where((tag) => MentorTag.displayableTags.contains(tag))
              .toList()) ??
          [];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final imgSize = 70.0;
    final borderRadius = 12.0;

    return CustomShadow(
      child: GradientBorder(
        borderRadius: borderRadius + 2,
        child: Container(
          width: 170,
          // height: 230,
          constraints: BoxConstraints(minHeight: 240),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    imageUrl,
                    width: imgSize,
                    height: imgSize,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: imgSize,
                        height: imgSize,
                        color: Colors.grey,
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: AppColors.black),
                ),
                const SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 6,
                  children: tags.take(3).map((tag) => _buildTag(tag)).toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(fontWeight: FontWeight.bold),
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

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      decoration: BoxDecoration(
        color: AppColors.alternative2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}
