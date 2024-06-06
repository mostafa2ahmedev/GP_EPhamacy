// ChoosenView implementation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/CustomBarChart.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom%20card.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom_cartesian_chart.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom_loading_indicator.dart';
import 'package:gppharmacy/Features/Dashboard/CustomWidgets/custom_pie_chart.dart';
import 'package:gppharmacy/Features/Dashboard/manager/Cubit/dashboard_cubit.dart';
import 'package:gppharmacy/Features/Dashboard/manager/Cubit/dashboard_state.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Custom_Drawer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';

class ChoosenView extends StatefulWidget {
  const ChoosenView({super.key});

  @override
  State<ChoosenView> createState() => _ChoosenViewState();
}

class _ChoosenViewState extends State<ChoosenView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).fetchStatisticsData(2024);
  }

  final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return Center(child: DottedProgressBar());
        } else if (state is DashboardSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(
                        icon: Icons.account_box,
                        mainText: BlocProvider.of<DashboardCubit>(context)
                            .statisticsModel!
                            .studentCount
                            .toString(),
                        subText: "Students",
                      ),
                      CustomCard(
                        icon: Icons.receipt_long,
                        mainText: BlocProvider.of<DashboardCubit>(context)
                            .statisticsModel!
                            .prescriptionCount
                            .toString(),
                        subText: "Prescriptions",
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(
                        icon: Icons.hourglass_empty,
                        mainText: BlocProvider.of<DashboardCubit>(context)
                            .statisticsModel!
                            .aboutToExpire
                            .toString(),
                        subText: "Near to expire",
                      ),
                      CustomCard(
                        icon: Icons.warning_amber_rounded,
                        mainText: BlocProvider.of<DashboardCubit>(context)
                            .statisticsModel!
                            .runningOut
                            .toString(),
                        subText: "Running Out",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CartesianChart(
                    statisticsModel: BlocProvider.of<DashboardCubit>(context)
                        .statisticsModel!,
                  ),
                  const SizedBox(height: 20),
                  CustomPieChart(
                    studentPerCollage: BlocProvider.of<DashboardCubit>(context)
                        .statisticsModel!
                        .studentPerCollage!,
                  ),
                  const SizedBox(height: 20),
                  CustomBarChart(
                    prescriptionPerCollage:
                        BlocProvider.of<DashboardCubit>(context)
                            .statisticsModel!
                            .prescriptionPerCollage!,
                  ),
                  const SizedBox(height: 42),
                ],
              ),
            ),
          );
        } else {
          return const Text("Error Loading Data");
        }
      },
    );
  }
}
