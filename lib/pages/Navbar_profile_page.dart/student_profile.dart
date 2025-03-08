import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final Function(String) onEducationChanged;
  final Function(String) onStudyProgramChanged;
  final Function(String) onDomicileChanged;
  final Function(String) onFullAddressChanged;
  final Function(String) onDescriptionChanged;

  StudentProfile({
    required this.onEducationChanged,
    required this.onStudyProgramChanged,
    required this.onDomicileChanged,
    required this.onFullAddressChanged,
    required this.onDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField("Pendidikan", onEducationChanged),
        _buildTextField("Program Studi", onStudyProgramChanged),
        _buildTextField("Domisili", onDomicileChanged),
        _buildTextField("Alamat Lengkap", onFullAddressChanged),
        _buildTextField(
          "Deskripsi Diri (maks 100 kata)",
          onDescriptionChanged,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    Function(String) onChanged, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
