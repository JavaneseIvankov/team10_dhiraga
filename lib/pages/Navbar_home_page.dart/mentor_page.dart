import 'package:flutter/material.dart';

class MentorPage extends StatefulWidget {
  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  bool isAboutSelected = true;
  bool isScheduleSelected = false;
  bool isReviewSelected = false;
  bool isOfflineSelected = true;
  bool isOnlineSelected = false;
  bool showOverview = false;
  bool showPayment = false;
  DateTime? selectedDate;
  String? selectedPaymentMethod;
  String? selectedTimeSlot;
  String? selectedField;
  String? selectedPackage;
  TextEditingController locationController = TextEditingController();

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
                    showOverview = false;
                    showPayment = false;
                  });
                }),
                SizedBox(width: 10),
                _buildTabButton("Jadwal & Harga", isScheduleSelected, () {
                  setState(() {
                    isAboutSelected = false;
                    isScheduleSelected = true;
                    isReviewSelected = false;
                    showOverview = false;
                    showPayment = false;
                  });
                }),
                SizedBox(width: 10),
                _buildTabButton("Ulasan", isReviewSelected, () {
                  setState(() {
                    isAboutSelected = false;
                    isScheduleSelected = false;
                    isReviewSelected = true;
                    showOverview = false;
                    showPayment = false;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            if (isAboutSelected) _buildAboutSection(),
            if (isScheduleSelected && !showOverview && !showPayment)
              _buildScheduleSection(),
            if (isReviewSelected) _buildReviewSection(),
            if (showOverview && !showPayment) _buildOverviewSection(),
            if (showPayment) _buildPaymentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? Icons.info : Icons.info_outline,
                color: isSelected ? Colors.white : Colors.blue,
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Domisili",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Jawa Timur - Kota Malang"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Riwayat Pendidikan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("S2 - Hogwarts University, Chemistry 2021 (GPA 3.5)"),
                  Text(
                    "S1 - Universitas Brawijaya, Teknik Kimia 2016 (GPA 3.95)",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Riwayat Beasiswa",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Beasiswa Unggulan 2017"),
                  Text("Hogwarts Scholarship 2021"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sertifikasi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("IELTS 8.7"),
                  Text("Potion Master"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Saya adalah seorang mentor di bidang kimia dengan latar belakang akademik yang kuat. "
                    "Saya menyelesaikan S1 di Universitas Brawijaya, Teknik Kimia (GPA 3.95), lalu melanjutkan S2 di Hogwarts University, Chemistry (GPA 3.5). "
                    "Sepanjang perjalanan akademik, saya menerima Beasiswa Unggulan 2017 dan Hogwarts Scholarship 2021. Selain itu, saya juga memiliki sertifikasi IELTS 8.7 dan Potion Master, yang mendukung keterampilan bahasa serta keahlian dalam ilmu ramuan. "
                    "Dengan pengalaman ini, saya berkomitmen untuk membimbing dengan pendekatan praktis dan inovatif, membantu mentee memahami teori sekaligus mengaplikasikannya dalam dunia nyata.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              _buildScheduleTypeButton(
                "Mentoring Online",
                isOnlineSelected,
                () {
                  setState(() {
                    isOfflineSelected = false;
                    isOnlineSelected = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Pilih Paket",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildPackageOption(
            "4 Sesi",
            isOfflineSelected ? "Rp 180.000" : "Rp 108.000",
            "10% Off!",
            "4 Sesi",
          ),
          _buildPackageOption(
            "1 Sesi",
            isOfflineSelected ? "Rp 50.000" : "Rp 30.000",
            "",
            "1 Sesi",
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
              _buildTimeSlot("15.30 - 17.30"),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Pilih Bidang",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: selectedField,
            hint: Text("Pilih Bidang Mentoring"),
            onChanged: (String? newValue) {
              setState(() {
                selectedField = newValue;
              });
            },
            items:
                <String>[
                  'Kimia',
                  'Biologi',
                  'Fisika',
                  'Matematika',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (selectedDate != null &&
                    selectedTimeSlot != null &&
                    selectedField != null &&
                    selectedPackage != null) {
                  setState(() {
                    showOverview = true;
                  });
                }
              },
              child: Text("Pesan Mentor"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageOption(
    String title,
    String price,
    String discount,
    String package,
  ) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(price),
        trailing:
            discount.isNotEmpty
                ? Text(discount, style: TextStyle(color: Colors.green))
                : null,
        onTap: () {
          setState(() {
            selectedPackage = package;
          });
        },
        tileColor:
            selectedPackage == package ? Colors.blue.withOpacity(0.1) : null,
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTimeSlot == time ? Colors.blue : Colors.white,
        foregroundColor: selectedTimeSlot == time ? Colors.white : Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
      onPressed: () {
        setState(() {
          selectedTimeSlot = time;
        });
      },
      child: Text(time),
    );
  }

  Widget _buildReviewSection() {
    List<Map<String, String>> reviews = [
      {
        "name": "J******r",
        "review":
            "Mentornya sangat baik, penjelasannya mudah dimengerti, on time banget",
        "rating": "★★★★★★",
      },
      {
        "name": "D******i",
        "review":
            "Good mentor, thankyou for the lesson. now I got my scholarship, so grateful",
        "rating": "★★★★★★",
      },
      {
        "name": "D******a",
        "review": "Terima kasih telah mengajari saya, sukses terus kak",
        "rating": "★★★★★★",
      },
      {
        "name": "F******r",
        "review":
            "Mentornya sangat baik, penjelasannya mudah dimengerti, on time banget",
        "rating": "★★★★★★",
      },
      {
        "name": "R******n",
        "review": "Kakaknya baik, penjelasannya mudah dimengerti",
        "rating": "★★★★★☆",
      },
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ulasan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...reviews.map((review) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${review["name"]} ${review["rating"]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(review["review"]!),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
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

  Widget _buildOverviewSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOverviewTabButton("Overview", true, () {}),
              SizedBox(width: 10),
              _buildOverviewTabButton("Pembayaran", false, () {
                setState(() {
                  showPayment = true;
                });
              }),
            ],
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Review Paket",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Paket: ${selectedPackage}"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tanggal: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "Belum dipilih"}",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lokasi Mentoring",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: "Masukkan lokasi mentoring",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rincian Pembayaran",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Text(isOfflineSelected ? "Rp 180.000" : "Rp 108.000"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Diskon"), Text("Rp 0")],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      Text(
                        isOfflineSelected ? "Rp 180.000" : "Rp 108.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showPayment = true;
                });
              },
              child: Text("Pilih Metode Pembayaran"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTabButton(
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Metode Pembayaran",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "E-Wallet",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          _buildPaymentOption("DANA"),
          _buildPaymentOption("Gopay"),
          _buildPaymentOption("Shopeepay"),
          SizedBox(height: 20),
          Text(
            "Bank",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          _buildPaymentOption("Bank BCA"),
          _buildPaymentOption("Bank Mandiri"),
          _buildPaymentOption("Bank BRI"),
          _buildPaymentOption("Bank BNI"),
          _buildPaymentOption("Bank BSI"),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentLoadingPage()),
                );
              },
              child: Text("Bayar"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String option) {
    return ListTile(
      title: Text(option),
      leading: Radio(
        value: option,
        groupValue: selectedPaymentMethod,
        onChanged: (String? value) {
          setState(() {
            selectedPaymentMethod = value;
          });
        },
      ),
    );
  }
}

class PaymentLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Menunggu Pembayaran..."),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 20),
            Text(
              "Pembayaran Berhasil!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
