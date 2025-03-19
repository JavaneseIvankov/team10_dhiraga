import 'package:flutter/material.dart';

class MentorProfilePage extends StatefulWidget {
  @override
  _MentorProfilePageState createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
  bool isAboutSelected = true;
  bool isScheduleSelected = false;
  bool isReviewSelected = false;
  bool isOfflineSelected = true;
  bool isOnlineSelected = false;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Mentor")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/mentor.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              "Harry Potter",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("4.8 ⭐", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton("Tentang", isAboutSelected, () {
                  setState(() {
                    isAboutSelected = true;
                    isScheduleSelected = false;
                    isReviewSelected = false;
                  });
                }),
                SizedBox(width: 10),
                _buildTabButton("Jadwal & Harga", isScheduleSelected, () {
                  setState(() {
                    isAboutSelected = false;
                    isScheduleSelected = true;
                    isReviewSelected = false;
                  });
                }),
                SizedBox(width: 10),
                _buildTabButton("Ulasan", isReviewSelected, () {
                  setState(() {
                    isAboutSelected = false;
                    isScheduleSelected = false;
                    isReviewSelected = true;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            if (isAboutSelected) _buildAboutSection(),
            if (isScheduleSelected) _buildScheduleSection(),
            if (isReviewSelected) _buildReviewSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Domisili",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("Jawa Timur - Kota Malang"),
          SizedBox(height: 10),
          Text(
            "Riwayat Pendidikan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("S2 - Hogwarts University, Chemistry 2021 (GPA 3.5)"),
          Text("S1 - Universitas Brawijaya, Teknik Kimia 2016 (GPA 3.95)"),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildScheduleTypeButton(
              "Mentoring Offline",
              isOfflineSelected,
              () {
                setState(() {
                  isOfflineSelected = true;
                  isOnlineSelected = false;
                });
              },
            ),
            SizedBox(width: 20),
            _buildScheduleTypeButton("Mentoring Online", isOnlineSelected, () {
              setState(() {
                isOfflineSelected = false;
                isOnlineSelected = true;
              });
            }),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Pilih Tanggal",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2026, 12, 31),
            );
            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          child: Text(
            selectedDate == null
                ? "Pilih Tanggal"
                : "${selectedDate!.toLocal()}".split(' ')[0],
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Pilih Jam",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 10,
          children: [
            _buildTimeSlot("08.00 - 10.00"),
            _buildTimeSlot("10.30 - 12.30"),
            _buildTimeSlot("13.00 - 15.00"),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    List<Map<String, String>> reviews = [
      {
        "name": "J******r",
        "review":
            "Mentornya sangat baik, penjelasannya mudah dimengerti, on time banget",
      },
      {
        "name": "P*****j",
        "review":
            "Good mentor, thankyou for the lesson. now i got my scholarship, so grateful",
      },
      {
        "name": "D*****a",
        "review": "Terima kasih telah mengajari saya, sukses terus kak",
      },
      {
        "name": "F******r",
        "review":
            "Mentornya sangat baik, penjelasannya mudah dimengerti, on time banget",
      },
      {
        "name": "R*****n",
        "review": "Kakaknya baik, penjelasannya mudah dimengerti",
      },
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children:
            reviews.map((review) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.orange, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review["name"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(review["review"]!),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildScheduleTypeButton(
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }

  Widget _buildTimeSlot(String time) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
      onPressed: () {},
      child: Text(time),
    );
  }
}
