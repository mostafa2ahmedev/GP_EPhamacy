import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Auth/Presentation/Auth_View.dart';
import 'package:gppharmacy/Features/HomeScreen/data/Container_Item_Model.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Container_Item.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});
  static const List<ContainerItemModel> items = [
    ContainerItemModel(text: 'حصر المبيعات'),
    ContainerItemModel(text: 'الأدويه'),
    ContainerItemModel(text: 'عهده المخزن'),
    ContainerItemModel(text: 'الواردات'),
    ContainerItemModel(text: 'حصر الكليات'),
  ];

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  late ScrollController _scrollController;
  int selectedItem = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
      child: ListWheelScrollView(
        itemExtent: 160,
        children: List.generate(
          HomeMobileView.items.length,
          (index) => GestureDetector(
            onTap: () {
              selectContainerItem(index, selectedItem, context);
            },
            child: ContainerItem(
              containerItemModel: HomeMobileView.items[index],
              isSelected: selectedItem == index,
            ),
          ),
        ),
        onSelectedItemChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
    );
  }
}

void selectContainerItem(int index, int selectedItme, context) {
  if (index == 0 && index == selectedItme) {
    MethodHelper.navigateTo(context, const AuthView());
  } else if (index == 1) {
  } else if (index == 2) {
  } else if (index == 3) {
  } else if (index == 4) {}
}
