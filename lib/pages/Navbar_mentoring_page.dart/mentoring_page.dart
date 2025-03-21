import 'package:flutter/material.dart';
import 'mentor_chat_page.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';

class MentoringPage extends StatelessWidget {
  const MentoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentoring"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika pencarian di sini
            },
          ),
        ],
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mentoring Aktif",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildMentoringItem(context, "Socrates Carpenter", "20/03/2025"),
              _buildMentoringItem(context, "Harry Potter", "24/03/2025"),
              SizedBox(height: 20),
              Text(
                "Riwayat Mentoring",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildMentoringItem(context, "Harry Potter", "10/03/2025"),
              _buildMentoringItem(context, "Cut Rizz", "27/01/2025"),
              _buildMentoringItem(context, "Fara Zuhra", "04/11/2024"),
              SizedBox(height: 20),
              Text(
                "Eman Supriadi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildMessageItem(
                "Hari ini",
                "Selamat pagi kak, izin konfirmasi, apakah mentoring hari ini jadi dilaksanakan jam 10:30?",
                "1 Beam Bikas",
              ),
              _buildMessageItem(
                "Hari ini",
                "Selamat pagi, iya jadi ya, sooo",
                "8000",
              ),
              _buildMessageItem("Talk", "Terima kasih kak, sooo", ""),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMentoringItem(BuildContext context, String name, String date) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigasi ke halaman chat dengan mentor
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MentorChatPage(mentorName: name),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageItem(String time, String message, String details) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(time),
        subtitle: Text(message),
        children: [
          Padding(padding: EdgeInsets.all(16.0), child: Text(details)),
        ],
      ),
    );
  }
}
