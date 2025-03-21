import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_mentors.dart';
import 'package:team10_dhiraga/widgets/custom_button.dart';

class MentorFilterDialog extends StatefulWidget {
  final Function(GetMentorParams) mutator;
  final GetMentorParams initialParams;

  const MentorFilterDialog({
    super.key,
    required this.mutator,
    required this.initialParams,
  });

  static void show(
    BuildContext context,
    Function(GetMentorParams) mutator,
    GetMentorParams initialParams,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => MentorFilterDialog(
            mutator: mutator,
            initialParams: initialParams,
          ),
    );
  }

  @override
  State<MentorFilterDialog> createState() => _MentorFilterDialogState();
}

class _MentorFilterDialogState extends State<MentorFilterDialog> {
  late bool offline;
  late bool online;
  late bool akademik;
  late bool beasiswa;
  late bool minimalRating;
  late bool senin;
  late bool selasa;
  late bool rabu;
  late bool kamis;
  late bool jumat;
  late bool sabtu;
  late bool minggu;
  late bool productManager;
  late bool backend;
  late bool frontend;
  late bool uiUx;
  late bool inggris;
  late bool jerman;
  late bool korea;
  late bool jepang;
  late bool biologi;
  late bool fisika;
  late bool kimia;
  late bool matematika;
  late bool sejarah;

  @override
  void initState() {
    super.initState();
    offline = widget.initialParams.offline;
    online = widget.initialParams.online;
    akademik = widget.initialParams.akademik;
    beasiswa = widget.initialParams.beasiswa;
    minimalRating = widget.initialParams.minimalRating;
    senin = widget.initialParams.senin;
    selasa = widget.initialParams.selasa;
    rabu = widget.initialParams.rabu;
    kamis = widget.initialParams.kamis;
    jumat = widget.initialParams.jumat;
    sabtu = widget.initialParams.sabtu;
    minggu = widget.initialParams.minggu;
    productManager = widget.initialParams.productManager;
    backend = widget.initialParams.backend;
    frontend = widget.initialParams.frontend;
    uiUx = widget.initialParams.uiUx;
    inggris = widget.initialParams.inggris;
    jerman = widget.initialParams.jerman;
    korea = widget.initialParams.korea;
    jepang = widget.initialParams.jepang;
    biologi = widget.initialParams.biologi;
    fisika = widget.initialParams.fisika;
    kimia = widget.initialParams.kimia;
    matematika = widget.initialParams.matematika;
    sejarah = widget.initialParams.sejarah;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Media Mentoring"),
            _buildCheckbox(
              "Offline",
              offline,
              (val) => setState(() => offline = val!),
            ),
            _buildCheckbox(
              "Online",
              online,
              (val) => setState(() => online = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Tipe Mentor"),
            _buildCheckbox(
              "Akademik",
              akademik,
              (val) => setState(() => akademik = val!),
            ),
            _buildCheckbox(
              "Beasiswa",
              beasiswa,
              (val) => setState(() => beasiswa = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Rating"),
            _buildCheckbox(
              "Rating > 4.5",
              minimalRating,
              (val) => setState(() => minimalRating = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Ketersediaan Hari"),
            _buildCheckbox(
              "Senin",
              senin,
              (val) => setState(() => senin = val!),
            ),
            _buildCheckbox(
              "Selasa",
              selasa,
              (val) => setState(() => selasa = val!),
            ),
            _buildCheckbox("Rabu", rabu, (val) => setState(() => rabu = val!)),
            _buildCheckbox(
              "Kamis",
              kamis,
              (val) => setState(() => kamis = val!),
            ),
            _buildCheckbox(
              "Jumat",
              jumat,
              (val) => setState(() => jumat = val!),
            ),
            _buildCheckbox(
              "Sabtu",
              sabtu,
              (val) => setState(() => sabtu = val!),
            ),
            _buildCheckbox(
              "Minggu",
              minggu,
              (val) => setState(() => minggu = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Keahlian IT Developer"),
            _buildCheckbox(
              "Product Manager",
              productManager,
              (val) => setState(() => productManager = val!),
            ),
            _buildCheckbox(
              "Back End",
              backend,
              (val) => setState(() => backend = val!),
            ),
            _buildCheckbox(
              "Front End",
              frontend,
              (val) => setState(() => frontend = val!),
            ),
            _buildCheckbox("UI/UX", uiUx, (val) => setState(() => uiUx = val!)),
            SizedBox(height: 20),
            _buildSectionTitle("Keahlian Bahasa"),
            _buildCheckbox(
              "Inggris",
              inggris,
              (val) => setState(() => inggris = val!),
            ),
            _buildCheckbox(
              "Jerman",
              jerman,
              (val) => setState(() => jerman = val!),
            ),
            _buildCheckbox(
              "Korea",
              korea,
              (val) => setState(() => korea = val!),
            ),
            _buildCheckbox(
              "Jepang",
              jepang,
              (val) => setState(() => jepang = val!),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Mata Pelajaran"),
            _buildCheckbox(
              "Biologi",
              biologi,
              (val) => setState(() => biologi = val!),
            ),
            _buildCheckbox(
              "Fisika",
              fisika,
              (val) => setState(() => fisika = val!),
            ),
            _buildCheckbox(
              "Kimia",
              kimia,
              (val) => setState(() => kimia = val!),
            ),
            _buildCheckbox(
              "Matematika",
              matematika,
              (val) => setState(() => matematika = val!),
            ),
            _buildCheckbox(
              "Sejarah",
              sejarah,
              (val) => setState(() => sejarah = val!),
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
            GetMentorParams params = GetMentorParams(
              offline: offline,
              online: online,
              akademik: akademik,
              beasiswa: beasiswa,
              minimalRating: minimalRating,
              senin: senin,
              selasa: selasa,
              rabu: rabu,
              kamis: kamis,
              jumat: jumat,
              sabtu: sabtu,
              minggu: minggu,
              productManager: productManager,
              backend: backend,
              frontend: frontend,
              uiUx: uiUx,
              inggris: inggris,
              jerman: jerman,
              korea: korea,
              jepang: jepang,
              biologi: biologi,
              fisika: fisika,
              kimia: kimia,
              matematika: matematika,
              sejarah: sejarah,
            );

            widget.mutator(params);
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
