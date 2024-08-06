import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onCountrySelected;

  const CustomAppbar({super.key, required this.onCountrySelected});

  @override
  CustomAppbarState createState() => CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppbarState extends State<CustomAppbar> {
  late Size screenSize;
  String _title = 'Top News';

  void _updateTitle(String country) {
    setState(() {
      switch (country) {
        case 'it':
          _title = 'Italy News';
          break;
        case 'us':
          _title = 'USA News';
          break;
        case 'ar':
          _title = 'Argentina News';
          break;
        case 'tr':
          _title = 'Turkey News';
          break;
        case 'bbc':
          _title = 'BBC News';
          break;
        default:
          _title = 'Top News';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.apps),
        onPressed: () {},
      ),
      title: Center(
        child: Text(
          _title,
          style: GoogleFonts.poppins(
              fontSize: screenSize.width * 0.023, fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            widget.onCountrySelected(value);
            _updateTitle(value);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'it',
              child: Text('Italy News'),
            ),
            const PopupMenuItem<String>(
              value: 'us',
              child: Text('USA News'),
            ),
            const PopupMenuItem<String>(
              value: 'ar',
              child: Text('Argentina News'),
            ),
            const PopupMenuItem<String>(
              value: 'tr',
              child: Text('Turkey News'),
            ),
            const PopupMenuItem<String>(
              value: 'bbc',
              child: Text('BBC News'),
            ),
          ],
        ),
      ],
    );
  }
}
