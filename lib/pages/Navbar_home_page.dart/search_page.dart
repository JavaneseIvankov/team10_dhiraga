import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'All';
  TextEditingController searchController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            _buildCategoryFilters(),
            SizedBox(height: 16),
            Expanded(child: _buildSearchResults()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.0),
          child: Image.asset('assets/Search.png', width: 24, height: 24),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(12.0),
          child: Image.asset('assets/filter.png', width: 24, height: 24),
        ),
        hintText: 'Beasiswa Unggulan',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    List<String> categories = ['All', 'Beasiswa', 'Mentor', 'Template'];
    return Row(
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
              selectedColor: Colors.yellow,
            );
          }).toList(),
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
    return Card(
      child: ListTile(
        leading: Image.asset('assets/beasiswa.png'),
        title: Text('Beasiswa Unggulan Kemendikbudristek'),
        subtitle: Text('4 Feb 2025 - 4 Mar 2025'),
        trailing: Icon(Icons.bookmark_border),
      ),
    );
  }

  Widget _buildMentorResults() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMentorCard('Harry Potter', 'Beasiswa 2022', 'Kimia'),
        _buildMentorCard('Edmund Pevs', 'Beasiswa 2023', 'Fisika'),
        _buildMentorCard('Lucy Pevs', 'Beasiswa 2024', 'Biologi'),
      ],
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
