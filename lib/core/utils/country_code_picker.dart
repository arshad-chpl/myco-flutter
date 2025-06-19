import 'package:flutter/material.dart';

class CountryCode {
  final String name;
  final String dialCode;

  CountryCode({required this.name, required this.dialCode});
}

class CountryCodePicker extends StatefulWidget {
  final Function(String) onSelected;

  const CountryCodePicker({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  void _openPicker() {
    showDialog(
      context: context,
      builder: (context) => const CountryCodeDialog(),
    ).then((result) {
      if (result != null && result is CountryCode) {
        widget.onSelected(result.dialCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openPicker,
      child: const Row(
        children: [
          Icon(Icons.flag),
          SizedBox(width: 8),
          Text("Select Country Code"),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

class CountryCodeDialog extends StatefulWidget {
  const CountryCodeDialog({Key? key}) : super(key: key);

  @override
  State<CountryCodeDialog> createState() => _CountryCodeDialogState();
}

class _CountryCodeDialogState extends State<CountryCodeDialog> {
  final TextEditingController _searchController = TextEditingController();
  late List<CountryCode> _filtered;
  final List<CountryCode> _all = _countries;

  @override
  void initState() {
    super.initState();
    _filtered = _all;
    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        _filtered = _all.where((country) {
          return country.name.toLowerCase().contains(query) || country.dialCode.contains(query);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Country"),
      content: SizedBox(
        width: double.maxFinite,
        height: 500,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black)
                ),
              ),
            ),

            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: _filtered.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final country = _filtered[index];
                  return ListTile(
                    title: Text(country.name),
                    trailing: Text(country.dialCode),
                    onTap: () => Navigator.pop(context, country),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample data – replace with a complete list if needed
final List<CountryCode> _countries = [
  CountryCode(name: 'India', dialCode: '+91'),
  CountryCode(name: 'Afghanistan', dialCode: '+93'),
  CountryCode(name: 'Albania', dialCode: '+355'),
  CountryCode(name: 'Algeria', dialCode: '+213'),
  CountryCode(name: 'American Samoa', dialCode: '+1684'),
  CountryCode(name: 'Andorra', dialCode: '+376'),
  CountryCode(name: 'Angola', dialCode: '+244'),
  CountryCode(name: 'Anguilla', dialCode: '+1264'),
  CountryCode(name: 'Antarctica', dialCode: '+672'),
  CountryCode(name: 'Antigua & Barbuda', dialCode: '+1268'),
  CountryCode(name: 'Argentina', dialCode: '+54'),
  CountryCode(name: 'Armenia', dialCode: '+374'),
  CountryCode(name: 'Aruba', dialCode: '+297'),
  CountryCode(name: 'Australia', dialCode: '+61'),
  CountryCode(name: 'Austria', dialCode: '+43'),
  // Add more countries as needed...
];
