import 'package:flutter/material.dart';

class CustomSalesInventoryDetailsItem extends StatefulWidget {
  const CustomSalesInventoryDetailsItem({super.key, required this.data});
  final String data;
  @override
  State<CustomSalesInventoryDetailsItem> createState() =>
      _CustomSalesInventoryDetailsItemState();
}

class _CustomSalesInventoryDetailsItemState
    extends State<CustomSalesInventoryDetailsItem> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          showDragHandle: true,
          isDismissible: false,
          elevation: 5,
          context: context,
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomDetailsItem(
                      note: 'كود الدواء',
                      data: widget.data,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomDetailsItem extends StatelessWidget {
  const CustomDetailsItem({
    super.key,
    required this.note,
    required this.data,
  });
  final String note;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(note),
        const Text('كود الدواء'),
      ],
    );
  }
}
