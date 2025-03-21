import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/models/beasiswa_model.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_beasiswa.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_mentors.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/beasiswa_filter_dialog.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/mentor_filter_dialog.dart';
import 'package:team10_dhiraga/widgets/beasiswa_card.dart';
import 'package:team10_dhiraga/widgets/circular_icon_button.dart';
import 'package:team10_dhiraga/widgets/mentor_card.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';
import 'package:team10_dhiraga/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'All';
  TextEditingController searchController = TextEditingController();
  GetBeasiswaParams getBeasiswaParams = GetBeasiswaParams();
  GetMentorParams getMentorParams = GetMentorParams();
  final getBeasiswas = sl<GetBeasiswas>();
  final getMentors = sl<GetMentors>();

  var beasiswas = <BeasiswaModel>[];
  var mentors = <MentorModel>[];

  _onSearchBeasiswas(query) {
    getBeasiswas(getBeasiswaParams);
  }

  _onSearchMentors(query) {
    getMentors(getMentorParams);
  }

  _showBeasiswaFilter() {
    BeasiswaFilterDialog.show(
      context,
      (params) => setState(() {
        getBeasiswaParams = params;
      }),
      getBeasiswaParams,
    );
  }

  _showMentorFilter() {
    MentorFilterDialog.show(
      context,
      (params) => setState(() {
        getMentorParams = params;
      }),
      getMentorParams,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildCategoryFilters(),
              SizedBox(height: 16),
              Expanded(child: _buildSearchResults()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: CustomSearchBar(
            controller: searchController,
            autofocus: true,
            placeholder: "Search",
          ),
        ),
        SizedBox(width: 10),
        CircularIconButton(
          icon: Icons.filter_alt,
          size: 48,
          onPressed: () {
            if (selectedCategory == 'Beasiswa') {
              _showBeasiswaFilter();
            } else if (selectedCategory == 'Mentor') {
              _showMentorFilter();
            }
          },
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildCategoryFilters() {
    List<String> categories = ['All', 'Beasiswa', 'Mentor', 'Template'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            categories.map((category) {
              return ChoiceChip(
                label: Text(category),
                selected: selectedCategory == category,
                onSelected: (bool selected) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: (AppColors.background),
                selectedColor: AppColors.alternative2,
                showCheckmark: false,
              );
            }).toList(),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (selectedCategory == 'All' || selectedCategory == 'Beasiswa') {
      return _buildBeasiswaResults();
    } else if (selectedCategory == 'Mentor') {
      return _buildMentorResults();
    } else if (selectedCategory == 'Template') {
      return _buildTemplateResults();
    }
    return Container();
  }

  Widget _buildBeasiswaResults() {
    return FutureBuilder<List<BeasiswaEntity>>(
      future: getBeasiswas(getBeasiswaParams),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          debugPrint("${snapshot.error}");
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada beasiswa yang ditemukan!'));
        } else {
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: 15,
            runSpacing: 15,
            children:
                snapshot.data!.map((beasiswa) {
                  return BeasiswaCard(beasiswa: beasiswa);
                }).toList(),
          );
        }
      },
    );
  }

  Widget _buildMentorResults() {
    return FutureBuilder<List<MentorModel>>(
      future: getMentors(getMentorParams),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          debugPrint("${snapshot.error}");
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada mentor yang ditemukan!'));
        } else {
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: 15,
            runSpacing: 15,
            children:
                snapshot.data!.map((mentor) {
                  return MentorCard(mentor: mentor);
                }).toList(),
          );
        }
      },
    );
  }

  Widget _buildMentorCard(String name, String batch, String subject) {
    return Card(
      child: Column(
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/mentor.png')),
          Text(name),
          Text(batch),
          Text(subject),
          Row(children: [Icon(Icons.star, color: Colors.yellow), Text('4.8')]),
        ],
      ),
    );
  }

  Widget _buildTemplateResults() {
    return Column(
      children: [
        _buildTemplateCard('Motivation Letter BU'),
        _buildTemplateCard('Essay BU'),
      ],
    );
  }

  Widget _buildTemplateCard(String title) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.insert_drive_file),
        title: Text(title),
        trailing: Icon(Icons.bookmark_border),
      ),
    );
  }
}
