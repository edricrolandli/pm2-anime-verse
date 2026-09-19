import 'package:anime_verse/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;


  const AppScaffold ({
    super.key,
    this.appBar,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
          body: body,
          appBar: appBar,
          backgroundColor: Colors.transparent,
        )
    );
  }
}