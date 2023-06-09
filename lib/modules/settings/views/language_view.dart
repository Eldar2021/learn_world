import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/l10n/l10n.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.loginPleaseSelectLang),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        itemCount: AppLocalizations.supportedLocales.length,
        itemBuilder: (BuildContext context, int index) {
          final locale = AppLocalizations.supportedLocales[index];
          return Card(
            child: ListTile(
              leading: Assets.icons.flags[index].svg(height: 25),
              title: Text(getLocaleName(locale), locale: locale),
              onTap: () => context.read<AppCubit>().changeLocale(locale.languageCode),
              trailing: appCubit.state.currentLocale == locale
                  ? CircleAvatar(
                      radius: 15,
                      backgroundColor: colorScheme.background,
                      child: Icon(Icons.check, color: colorScheme.primary),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  String getLocaleName(Locale locale) {
    return switch (locale.languageCode) {
      'en' => 'English',
      'ky' => 'Кыргызча',
      'tr' => 'Türkçe',
      'ru' => 'Русский',
      _ => 'English',
    };
  }
}
