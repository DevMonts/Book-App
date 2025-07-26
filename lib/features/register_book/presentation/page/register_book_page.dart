import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/features/register_book/presentation/widget/register_book_dialog.dart';
import 'package:flutter/material.dart';

class RegisterBookPage extends StatefulWidget {
  const RegisterBookPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<RegisterBookPage> createState() => _RegisterBookPageState();
}

class _RegisterBookPageState extends State<RegisterBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Bookcase
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const RegisterBookDialog();
              },
            );
          },
          child: const Text(AppStrings.registerBook),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(side: BorderSide(width: 6)),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(null), label: ''),
            BottomNavigationBarItem(icon: Icon(null), label: ''),
          ],
          backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
        ),
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 6))),
      ),
    );
  }
}
