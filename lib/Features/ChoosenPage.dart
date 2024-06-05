// ChoosenView implementation
import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/CustomBarChart.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom%20card.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom_cartesian_chart.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Custom_Drawer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';
import 'package:gppharmacy/Features/Statistics/presentation/widgets/CustomPieChart.dart';

class ChoosenView extends StatelessWidget {
  ChoosenView({super.key});
  
  final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      appBar: HomeAppBar(scafoldKey: scafoldKey),
      drawer: CustomMobileDrawer(),
      backgroundColor: const Color.fromARGB(255, 1, 28, 49),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    icon: Icons.account_box,
                    mainText: '8347',
                    subText: "Students",
                  ),
                  CustomCard(
                    icon: Icons.receipt_long,
                    mainText: '13',
                    subText: "Prescriptions",
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    icon: Icons.hourglass_empty,
                    mainText: '58',
                    subText: "Near to expire",
                  ),
                  CustomCard(
                    icon: Icons.warning_amber_rounded,
                    mainText: '17',
                    subText: "Running Out",
                  ),
                ],
              ),
              SizedBox(height: 20),
              CartesianChart(),
              SizedBox(height: 20),
              CustomPieChart(),
              SizedBox(height: 20),
              CustomBarChart(),
              SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}