import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_localization/cubit/locale_cubit.dart';
import 'package:flutter_cubit_localization/localization/app_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(context)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<LocaleCubit, LocaleState>(
            listener: (context, state) {
              Navigator.of(context).pop();
            },
            builder: (context, state) {
              if (state is LocaleChangedState) {
                return DropdownButton(
                  value: state.locale.languageCode,
                  items: ['en', 'ar']
                      .map((String item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocaleCubit>().changeLanguageCode(newValue);
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
