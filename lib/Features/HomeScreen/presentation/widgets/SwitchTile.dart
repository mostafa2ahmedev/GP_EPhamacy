import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/generated/l10n.dart';

class SwitchWithListTile extends StatelessWidget {
  const SwitchWithListTile({
    super.key,
    this.onChanged,
    required this.value,
    required this.text,
  });

  final void Function(bool)? onChanged;
  final bool value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.sunny,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: AppStyles.styleMeduim16(context),
      ),
      trailing: Switch(
          inactiveTrackColor: Theme.of(context).drawerTheme.backgroundColor,
          inactiveThumbColor: const Color(0xfffafafa),
          activeTrackColor: Theme.of(context).drawerTheme.backgroundColor,
          activeColor: Theme.of(context).cardColor,
          value: value,
          onChanged: onChanged),
    );
  }
}
