import 'package:alnair/src/providers/units_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  String submit = '';
  void _onSubmitted(String value) {
    print(value);

    setState(() {
      submit = value;
    });
    Provider.of<UnitsProvider>(context, listen: false).setSearchedTitle(value);
    _searchController.clear();
  }

  void _onChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          controller: _searchController,
          onChanged: _onChanged,
          onSubmitted: _onSubmitted,
          hintText: 'Search, for example "Emaar" , "Bussineess Bay"',
          hintStyle: WidgetStatePropertyAll<TextStyle?>(
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w700)),
          leading: const Icon(Icons.search),
          elevation: const WidgetStatePropertyAll<double?>(0),
        ),
        Text(submit),
      ],
    );
  }
}
