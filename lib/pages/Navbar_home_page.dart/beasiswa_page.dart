import 'package:flutter/material.dart';

class BeasiswaPage extends StatefulWidget {
  @override
  _BeasiswaPageState createState() => _BeasiswaPageState();
}

class _BeasiswaPageState extends State<BeasiswaPage> {
  bool isBookmarked = false; // State untuk bookmark

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    // Simpan bookmark ke state global atau database
    // Contoh: Simpan ke SharedPreferences atau Provider
  }

  void _navigateToLink(String link) {
    // Navigasi ke halaman baru atau buka browser
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LinkPage(link: link)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beasiswa Pertamina Sobat Bumi')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BEASISWA PERTAMINA SOBAT BUMI 2025 DIBUKA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "4 FEBRUARI 2025 - 4 MART 2025",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "4 Feb 2025 - 4 Mar 2025",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pertamina Foundation",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text("D3/D4/D1", style: TextStyle(fontSize: 14)),
                    Text(
                      "Universitas Indonesia (dan 37 lainnya)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Manfaat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("- Fully Funded", style: TextStyle(fontSize: 14)),
                    Text(
                      "- Bantuan biaya pendidikan / UKT",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Bantuan biaya hidup",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Koneksi dengan mahasiswa seuruh Indonesia, Pertamina Group, dan Pertamina Foundation",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Persyaratan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- Warga Negara Indonesia (WNI)",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Kuliah di kampus mitra Pertamina Foundation",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Mahasiswa aktif (tidak sedang tidak cuti)",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Minimal semester 2 dan maksimal semester 6 dengan IP dan/atau IPK terakhir ≥ 3,00",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Tidak sedang menerima beasiswa dari pihak manapun (periode Januari-Desember 2024)",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "- Memiliki sertifikat atau prediction TOEFL atau IELTS menjadi nilai tambah.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Lampiran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:
                          () => _navigateToLink("https://example.com/panduan"),
                      child: Text(
                        "- Link Panduan",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap:
                          () => _navigateToLink("https://example.com/template"),
                      child: Text(
                        "- Link Template",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman pendaftaran atau tindakan lainnya
                  },
                  child: Text("Daftar"),
                ),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: _toggleBookmark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
