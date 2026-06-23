import 'package:book/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Current()));
}

class Current extends StatelessWidget {

  const Current({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
