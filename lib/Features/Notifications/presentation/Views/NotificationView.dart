import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Notifications/presentation/Maneger/cubit/notificaiton_state.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Utils/AppStyles.dart';
import '../Maneger/cubit/notificaiton_cubit.dart';
import 'NotificationItem.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getNotificationData(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'الاشعارات',
                style: AppStyles.styleBold35(context),
              ),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  var cubit = BlocProvider.of<NotificationCubit>(context);
                  if (state is GetNotificaitonLoadingState) {
                    return const CustomNotiList();
                  } else if (state is GetNotificaitonSuccessState) {
                    return Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTileNotificaiton(
                              notificationModel: cubit.notifications[index],
                            );
                          },
                          itemCount: cubit.notifications.length),
                    );
                  } else {
                    return const CustomFailureWidget();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNotificationIndicator extends StatelessWidget {
  const CustomNotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200.0,
      height: 50,
      child: Shimmer(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey],
          stops: const [0.4, 1.0],
          tileMode: TileMode.repeated,
        ),
        child: ListTileNotificaitonLoading(),
      ),
    );
  }
}

class CustomNotiList extends StatelessWidget {
  const CustomNotiList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemBuilder: (context, index) {
            return CustomNotificationIndicator();
          },
          itemCount: 12),
    );
  }
}
