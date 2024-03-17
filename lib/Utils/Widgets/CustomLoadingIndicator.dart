import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/Themes.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
          ),
          CircularProgressIndicator(
            color: Theme.of(context).drawerTheme.backgroundColor,
            semanticsLabel: 'nooooooo',
          ),
        ],
      ),
    );
  }
}
