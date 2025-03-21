import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_beasiswa.dart';
import 'package:team10_dhiraga/widgets/custom_button.dart';

class BeasiswaFilterDialog extends StatefulWidget {
  final Function(GetBeasiswaParams) mutator;
  final GetBeasiswaParams initialParams;

  const BeasiswaFilterDialog({
    super.key,
    required this.mutator,
    required this.initialParams,
  });

  static void show(
    BuildContext context,
    Function(GetBeasiswaParams) mutator,
    GetBeasiswaParams initialParams,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => BeasiswaFilterDialog(
            mutator: mutator,
            initialParams: initialParams,
          ),
    );
  }

  @override
  State<BeasiswaFilterDialog> createState() => _BeasiswaFilterDialogState();
}

class _BeasiswaFilterDialogState extends State<BeasiswaFilterDialog> {
  late bool sortDeadline;
  late bool sortPopular;
  late bool s1;
  late bool s2;
  late bool s3;
  late bool d4;
  late bool d3;
  late bool sma;
  late bool fullyFunded;
  late bool partiallyFunded;
  late bool minimumIPK;
  late bool semester1;
  late bool semester2;
  late bool semester3;
  late bool semester4;
  late bool semester5;
  late bool lebihSemester6;

  @override
  void initState() {
    super.initState();
    sortDeadline = widget.initialParams.deadlineTerdekat;
    sortPopular = widget.initialParams.palingDicari;
    s1 = widget.initialParams.s1;
    s2 = widget.initialParams.s2;
    s3 = widget.initialParams.s3;
    d4 = widget.initialParams.d4;
    d3 = widget.initialParams.d3;
    sma = widget.initialParams.sma;
    fullyFunded = widget.initialParams.fullyFunded;
    partiallyFunded = widget.initialParams.partial;
    minimumIPK = widget.initialParams.minimumIPK;
    semester1 = widget.initialParams.semester1;
    semester2 = widget.initialParams.semester2;
    semester3 = widget.initialParams.semester3;
    semester4 = widget.initialParams.semester4;
    semester5 = widget.initialParams.semester5;
    lebihSemester6 = widget.initialParams.lebihSemester6;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Sort by"),
            _buildCheckbox(
              "Deadline terdekat",
              sortDeadline,
              (val) => setState(() => sortDeadline = val!),
            ),
            _buildCheckbox(
              "Paling banyak dicari",
              sortPopular,
              (val) => setState(() => sortPopular = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Jenjang"),
            _buildCheckbox("S1", s1, (val) => setState(() => s1 = val!)),
            _buildCheckbox("S2", s2, (val) => setState(() => s2 = val!)),
            _buildCheckbox("S3", s3, (val) => setState(() => s3 = val!)),
            _buildCheckbox("D4", d4, (val) => setState(() => d4 = val!)),
            _buildCheckbox("D3", d3, (val) => setState(() => d3 = val!)),
            _buildCheckbox(
              "SMA/sederajat",
              sma,
              (val) => setState(() => sma = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Benefit"),
            _buildCheckbox(
              "Fully funded",
              fullyFunded,
              (val) => setState(() => fullyFunded = val!),
            ),
            _buildCheckbox(
              "Partially funded",
              partiallyFunded,
              (val) => setState(() => partiallyFunded = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Ketentuan"),
            _buildCheckbox(
              "Tanpa minimal nilai/IPK",
              minimumIPK,
              (val) => setState(() => minimumIPK = val!),
            ),
            _buildCheckbox(
              "Semester 1",
              semester1,
              (val) => setState(() => semester1 = val!),
            ),
            _buildCheckbox(
              "Semester 2",
              semester2,
              (val) => setState(() => semester2 = val!),
            ),
            _buildCheckbox(
              "Semester 3",
              semester3,
              (val) => setState(() => semester3 = val!),
            ),
            _buildCheckbox(
              "Semester 4",
              semester4,
              (val) => setState(() => semester4 = val!),
            ),
            _buildCheckbox(
              "Semester 5",
              semester5,
              (val) => setState(() => semester5 = val!),
            ),
            _buildCheckbox(
              "Semester >6",
              lebihSemester6,
              (val) => setState(() => lebihSemester6 = val!),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        CustomButton(
          text: "Apply",
          fontWeight: FontWeight.normal,
          intent: "primary",
          width: 140,
          onPressed: () {
            GetBeasiswaParams params = GetBeasiswaParams(
              deadlineTerdekat: sortDeadline,
              palingDicari: sortPopular,
              s1: s1,
              s2: s2,
              s3: s3,
              d4: d4,
              d3: d3,
              sma: sma,
              fullyFunded: fullyFunded,
              partial: partiallyFunded,
              minimumIPK: minimumIPK,
              semester1: semester1,
              semester2: semester2,
              semester3: semester3,
              semester4: semester4,
              semester5: semester5,
              lebihSemester6: lebihSemester6,
            );

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return SizedBox(
      height: 28.0,
      child: CheckboxListTile(
        title: Text(label),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.black,
      ),
    );
  }
}
