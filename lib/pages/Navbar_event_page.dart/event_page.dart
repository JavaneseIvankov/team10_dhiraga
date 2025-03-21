import 'package:flutter/material.dart';
import 'event_detail_page.dart';
import 'notification_page.dart';
import 'package:team10_dhiraga/widgets/beasiswa_card.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 44, 74, 221),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: GradientBackground(
        // Menggunakan widget GradientBackground
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Beasiswa Bulan Ini!"),
              _buildEventGrid(beasiswaList, context),
              const SizedBox(height: 20),
              _buildSectionTitle("Seminar dan Webinar"),
              _buildEventGrid(seminarList, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildEventGrid(
    List<Map<String, String>> events,
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),

      itemCount: events.length,
      itemBuilder: (context, index) {
        return _buildEventCard(events[index], context);
      },
    );
  }

  Widget _buildEventCard(Map<String, String> event, BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      // child: BeasiswaCard(
      //   title: event['title']!,
      //   dateRange: event['date']!,
      //   imageUrl: 'https://via.placeholder.com/150',
      //   bookmarkIcon: Icons.bookmark_border,
      // ),
    );
  }

  List<Map<String, String>> beasiswaList = [
    {"title": "Beasiswa Djarum Plus", "date": "25 Mar 2025 - 4 Mei 2025"},
    {
      "title": "Beasiswa Bank Indonesia 2025",
      "date": "4 Jan 2025 - 7 Feb 2025",
    },
    {
      "title": "Beasiswa Ajinomoto 2026 S2 di Jepang",
      "date": "4 Feb 2025 - 4 Mar 2025",
    },
  ];

  List<Map<String, String>> seminarList = [
    {"title": "Strategi Jitu Lolos Beasiswa Djarum", "date": "10 Mei 2025"},
    {"title": "Webinar Socialisasi Pengenalan FT UB", "date": "15 Maret 2025"},
    {
      "title":
          "Webinar Pembekalan Karir \"Ingin Career Switch? Inilah Strategi Suksesnya\"",
      "date": "TBD",
    },
    {"title": "Webinar Karir - FIB UB", "date": "6 Maret 2025"},
    {"title": "Webinar Pelatihan Series - DPKA UB", "date": "6 Maret 2025"},
    {
      "title": "Webinar Series 1 Webinar Prodi Kimia UIN Malang",
      "date": "20 Maret 2025",
    },
    {
      "title": "Kuliah Tamu Capstone Project – Filkom UB",
      "date": "14 Maret 2025",
    },
  ];
}
