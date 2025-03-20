import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/features/data/models/student_model.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/pages/Navbar_profile_page.dart/edit_profile_page.dart';
import 'package:team10_dhiraga/widgets/beasiswa_card.dart';
import 'package:team10_dhiraga/widgets/custom_bottom_navbar.dart';
import 'package:team10_dhiraga/widgets/large_text.dart';
import 'package:team10_dhiraga/widgets/mentor_card.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';
import '../Navbar_event_page.dart/event_page.dart';
import '../Navbar_mentoring_page.dart/mentoring_page.dart';
import 'beasiswa_page.dart';
import 'mentor_page.dart';
import 'template_page.dart' as tpl;

class HomePage extends StatefulWidget {
  final List<Map<String, String>> savedNotifications;
  final Function(Map<String, String>) addNotification;

  const HomePage({
    Key? key, // Gunakan Key? key untuk konsistensi
    required this.savedNotifications,
    required this.addNotification,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State logic here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Page Content"),
      ),
    );
  }
}
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  String username = "";
  String userRole = "student";
  int _selectedIndex = 0;
  List<String> bookmarkedItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
  }

  void _showNotifications() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Notifikasi"),
          content:
              widget.savedNotifications.isEmpty
                  ? Text("Tidak ada notifikasi baru.")
                  : Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        widget.savedNotifications
                            .map(
                              (notif) => ListTile(
                                title: Text(notif['title'] ?? "Tanpa Judul"),
                                subtitle: Text(notif['message'] ?? ""),
                              ),
                            )
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
    final userProvider = Provider.of<UserProvider>(context);

    final List<Widget> pages = [
      HomeContent(
        toggleBookmark: _toggleBookmark,
        searchQuery: searchQuery,
        onSearchChanged: (query) {
          setState(() {
            searchQuery = query;
          });
        },
        showNotifications: _showNotifications, // Pass the method here
      ),
      EventPage(),
      MentoringPage(),
      EditProfilePage(userType: userRole),
    ];

    return FutureProvider<UserEntity?>(
      create: (_) => userProvider.currentUser,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.bookmark), onPressed: _showBookmarks),
          ],
        ),
        body: GradientBackground(child: pages[_selectedIndex]),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final Function(String) toggleBookmark;
  final String searchQuery;
  final Function(String) onSearchChanged;
  final Function showNotifications; // Add this parameter

  const HomeContent({
    super.key,
    required this.toggleBookmark,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.showNotifications, // Initialize the parameter
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserEntity?>(context);
    final username = user?.username ?? "Pengguna";
    List<String> bookmarkedItems = [];
    if (user is StudentModel) bookmarkedItems = user.bookmark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LargeText(
                    text:
                        "Selamat datang $username, ayo temukan peluang terbaik untukmu!",
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.blue.shade900),
                  onPressed: () {
                    showNotifications(); // Use the passed function here
                  },
                ),
              ],
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
            LargeText(
              text: title,
              textStyle: TextStyle(
                fontSize: 24,
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
                filteredItems.map((item) {
                  if (isMentor) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: MentorCard(
                        imageUrl:
                            "https://images5.fanpop.com/image/photos/25400000/Harry-Potter-Wallpaper-harry-james-potter-25493299-1024-768.jpg",
                        name: "Harry Pottah dsafdafcv xcvcxvfsd",
                        description: "Hogwart's super rookie",
                        tags: ["Tag1", "Tag2"],
                        rating: 4.8,
                      ),
                    );
                  } else if (isTemplate) {
                    return _buildItemCard(
                      context,
                      nextPage,
                      toggleBookmark,
                      bookmarkedItems,
                      isMentor,
                      isTemplate,
                      item,
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: BeasiswaCard(
                        title: item,
                        dateRange: "4 Feb 2025 - 4 Mar 2025",
                        imageUrl:
                            "https://mmc.tirto.id/image/share/tw/2023/08/18/pertamina-foundation--3_ratio-16x9.jpg",
                        bookmarkIcon:
                            bookmarkedItems.contains(item)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                      ),
                    );
                  }
                }).toList(),
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
