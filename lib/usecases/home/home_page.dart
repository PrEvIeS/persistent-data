import 'package:flutter/material.dart';
import 'package:flutter_template/constants/app_spacing.dart';
import 'package:flutter_template/constants/widget_keys.dart';
import 'package:flutter_template/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(WidgetKeys.homeScaffoldKey),
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Center(
        child: Column(
          children: [
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              child: Text(S.of(context).setting),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
