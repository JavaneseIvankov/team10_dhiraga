import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/pages/Navbar_profile_page.dart/edit_profile_page.dart';
import '../pages/edit_profile_page.dart';
import '../Navbar_event_page.dart/event_page.dart';
import '../Navbar_mentoring_page.dart/mentoring_page.dart';
import '../pages/profile_page.dart';
import '../login_page.dart';
import 'notification_page.dart';
import 'beasiswa_page.dart';
import 'mentor_page.dart';
import 'template_page.dart' as tpl;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String username = "";
  String userRole = "student";
  int _selectedIndex = 0;
  List<String> bookmarkedItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    user = _auth.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    } else {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();

      setState(() {
        username = userData["username"] ?? "Pengguna";
        userRole = userData["role"] ?? "student";
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleBookmark(String item) {
    setState(() {
      if (bookmarkedItems.contains(item)) {
        bookmarkedItems.remove(item);
      } else {
        bookmarkedItems.add(item);
      }
    });
  }

  void _showBookmarks() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bookmarks"),
          content:
              bookmarkedItems.isEmpty
                  ? Text("Tidak ada item yang disimpan.")
                  : Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        bookmarkedItems
                            .map((item) => ListTile(title: Text(item)))
                            .toList(),
                  ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeContent(
        username: username,
        toggleBookmark: _toggleBookmark,
        bookmarkedItems: bookmarkedItems,
        searchQuery: searchQuery,
        onSearchChanged: (query) {
          setState(() {
            searchQuery = query;
          });
        },
      ),
      EventPage(),
      MentoringPage(),
      EditProfilePage(userType: userRole == "mentor" ? "mentor" : "student"),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.bookmark), onPressed: _showBookmarks),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Mentoring'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String username;
  final Function(String) toggleBookmark;
  final List<String> bookmarkedItems;
  final String searchQuery;
  final Function(String) onSearchChanged;

  const HomeContent({
    super.key,
    required this.username,
    required this.toggleBookmark,
    required this.bookmarkedItems,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat datang $username, ayo temukan peluang terbaik untukmu!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Temukan mentor, beasiswa, atau template",
                prefixIcon: Icon(Icons.search, color: Colors.blue.shade900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: onSearchChanged,
            ),
            SizedBox(height: 20),
            _buildSection(
              "Beasiswa Populer",
              context,
              BeasiswaPage(),
              toggleBookmark,
              bookmarkedItems,
              searchQuery,
            ),
            _buildSection(
              "Mentor Populer",
              context,
              MentorPage(),
              toggleBookmark,
              bookmarkedItems,
              searchQuery,
              isMentor: true,
            ),
            _buildSection(
              "Template Gratis",
              context,
              tpl.TemplatePage(),
              toggleBookmark,
              bookmarkedItems,
              searchQuery,
              isTemplate: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    BuildContext context,
    Widget nextPage,
    Function(String) toggleBookmark,
    List<String> bookmarkedItems,
    String searchQuery, {
    bool isMentor = false,
    bool isTemplate = false,
  }) {
    List<String> items = [
      if (isMentor)
        "Nama Mentor"
      else if (isTemplate)
        "Template Essay"
      else
        "Beasiswa Pertamina Sobat Bumi",
      if (isMentor)
        "Mentor Lainnya"
      else if (isTemplate)
        "Template Lainnya"
      else
        "Beasiswa Lainnya",
    ];

    List<String> filteredItems =
        items
            .where(
              (item) => item.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
              },
              child: Text("Lihat lainnya"),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                filteredItems
                    .map(
                      (item) => _buildItemCard(
                        context,
                        nextPage,
                        toggleBookmark,
                        bookmarkedItems,
                        isMentor,
                        isTemplate,
                        item,
                      ),
                    )
                    .toList(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildItemCard(
    BuildContext context,
    Widget nextPage,
    Function(String) toggleBookmark,
    List<String> bookmarkedItems,
    bool isMentor,
    bool isTemplate,
    String itemName,
  ) {
    bool isBookmarked = bookmarkedItems.contains(itemName);

    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Placeholder(fallbackHeight: 50),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      toggleBookmark(itemName);
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                itemName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                isMentor
                    ? "Pengalaman: 5 tahun, Rating: 4.8"
                    : isTemplate
                    ? "Contoh Essay LPDP"
                    : "4 Feb 2025 - 4 Mar 2025",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
