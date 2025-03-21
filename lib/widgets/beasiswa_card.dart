import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/domain/usecases/add_to_bookmark.dart';
import 'package:team10_dhiraga/features/domain/usecases/remove_from_bookmark.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/widgets/circular_icon_button.dart';
import 'package:team10_dhiraga/widgets/custom_shadow.dart';
import 'package:team10_dhiraga/widgets/gradient_border.dart';
import 'package:intl/intl.dart';
import 'package:team10_dhiraga/widgets/snackbar.dart';

class BeasiswaCard extends StatefulWidget {
  final BeasiswaEntity beasiswa;
  final IconData bookmarkIcon;
  final Color dateBackgroundColor;

  const BeasiswaCard({
    super.key,
    required this.beasiswa,
    this.bookmarkIcon = Icons.bookmark_border,
    this.dateBackgroundColor = AppColors.alternative2,
  });

  @override
  _BeasiswaCardState createState() => _BeasiswaCardState();
}

class _BeasiswaCardState extends State<BeasiswaCard> {
  bool isBookmarked = false;
  final addToBookmark = sl<AddToBookmark>();
  final removeFromBookmark = sl<RemoveFromBookmark>();

  void _setIsBookmarked(bool status) {
    setState(() {
      isBookmarked = status;
    });
  }

  void _addToBookmark(BuildContext context, UserProvider userProvider) {
    _setIsBookmarked(true); // update optimis
    addToBookmark(
      AddToBookmarkParams(
        id: widget.beasiswa.id,
        onSuccess: () {
          debugPrint("Should show snackbar success");
          CustomSnackbar.show(
            context,
            message: "Berhasil menambahkan ke bookmark!",
          );
        },
        onFailed: (e) {
          _setIsBookmarked(false);
          CustomSnackbar.show(
            context,
            message: "Gagal menambahkan ke bookmark",
          );
        },
      ),
    );
  }

  void _removeFromBookmark(BuildContext context, UserProvider userProvider) {
    _setIsBookmarked(false);
    removeFromBookmark(
      RemoveFromBookmarkParams(
        id: widget.beasiswa.id,
        onSuccess: () {
          CustomSnackbar.show(
            context,
            message: "Berhasil menghapus dari bookmark!",
          );
        },
        onFailed: (e) {
          _setIsBookmarked(true);
          CustomSnackbar.show(
            context,
            message: "Gagal menghapus dari bookmark",
          );
        },
      ),
    );
  }

  void _toggleBookmark(BuildContext, UserProvider userProvider) {
    if (isBookmarked) {
      _removeFromBookmark(context, userProvider);
    } else {
      _addToBookmark(context, userProvider);
    }
  }

  String _buildDateRange(Timestamp mulai, Timestamp berakhir) {
    final DateFormat formatter = DateFormat('d MMM yyyy', 'id');
    final String startDate = formatter.format(mulai.toDate());
    final String endDate = formatter.format(berakhir.toDate());
    return '$startDate - $endDate';
  }

  Widget _buildBookmarkButton(BuildContextcontext, UserProvider userProvider) {
    buildButton(bool isActive) => CircularIconButton(
      icon: widget.bookmarkIcon,
      size: 30,
      onPressed: () {
        _toggleBookmark(BuildContext, userProvider);
      },
      isActive: isActive,
    );

    return FutureBuilder<Set<String>?>(
      future: userProvider.currentUserBookmark,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildButton(isBookmarked);
        }
        if (snapshot.hasData) {
          return buildButton(
            snapshot.data?.contains(widget.beasiswa.id) ?? false,
          );
        }
        return buildButton(isBookmarked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final String dateRange = _buildDateRange(
      widget.beasiswa.mulai,
      widget.beasiswa.berakhir,
    );

    return CustomShadow(
      child: GradientBorder(
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
                      widget.beasiswa.photoURL,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint(
                          "Error retreiving image for BeasiswaCard: $error",
                        );

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
                      child: _buildBookmarkButton(context, userProvider),
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
                        widget.beasiswa.nama,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          color: widget.dateBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            dateRange,
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
      ),
    );
  }
}
