import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Utils/Constants.dart';

class AddAccountView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      drawer: Drawer(
        child: Container(color: Colors.white,),
      ),
      appBar: AppBar(
              backgroundColor: PrimaryColor,
              leading: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(icon: Icon(Icons.list_sharp , size: icon_size,color: Colors.white,), 
                  onPressed: (){scaffoldKey.currentState?.openDrawer();
                  print('done');
                  },
                  ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(icon: Icon(Icons.notifications_sharp , size: icon_size , color: Colors.white,), onPressed: (){},),
                ),
                ]
            ),
      body: Form(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}