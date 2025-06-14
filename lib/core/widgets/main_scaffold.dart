import 'package:e_commerce_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const MainScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = true,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      appBar: title != null
          ? AppBar(
              title: MainTextWidget(
                text: title!,
                styleType: TextStyleType.titleMedium,
              ),
              centerTitle: true,
              automaticallyImplyLeading: showBackButton,
              actions: actions,
              bottom: bottom,
            )
          : null,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
