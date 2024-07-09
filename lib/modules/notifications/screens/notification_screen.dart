import 'package:aqari/apis/notifications_api.dart';
import 'package:aqari/core/injection_container.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/list_notification.dart';
import 'package:aqari/generated/l10n.dart';
import 'package:aqari/main.dart';
import 'package:aqari/modules/notifications/controllers/notifications_cubit.dart';
import 'package:aqari/modules/notifications/widgets/shimmer_notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// NotificationsScreen is used to manage the notifications screen
class NotificationsScreen extends StatelessWidget {
  /// Constructor
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(
        getIt<NotificationsApi>(),
      )..fetchNotifications(supabaseClient.auth.currentUser!.id),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: S.of(context).notifications,
        ),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const ShimmerNotificationsScreen();
            } else if (state is NotificationsLoaded) {
              final todayNotifications = state.notifications
                  .where(
                    (n) =>
                        n.createdAt.day == DateTime.now().day &&
                        n.createdAt.month == DateTime.now().month &&
                        n.createdAt.year == DateTime.now().year,
                  )
                  .toList();
              final yesterdayNotifications = state.notifications
                  .where(
                    (n) =>
                        n.createdAt.day ==
                            DateTime.now()
                                .subtract(const Duration(days: 1))
                                .day &&
                        n.createdAt.month ==
                            DateTime.now()
                                .subtract(const Duration(days: 1))
                                .month &&
                        n.createdAt.year ==
                            DateTime.now()
                                .subtract(const Duration(days: 1))
                                .year,
                  )
                  .toList();
              final olderNotifications = state.notifications
                  .where(
                    (n) => n.createdAt.isBefore(
                      DateTime.now().subtract(const Duration(days: 2)),
                    ),
                  )
                  .toList();

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    if (todayNotifications.isNotEmpty)
                      ListNotification(
                        day: 'Today',
                        notifications: todayNotifications,
                      ),
                    if (todayNotifications.isEmpty) const SizedBox(),
                    if (yesterdayNotifications.isNotEmpty)
                      ListNotification(
                        day: 'Yesterday',
                        notifications: yesterdayNotifications,
                      ),
                    if (yesterdayNotifications.isEmpty) const SizedBox(),
                    if (olderNotifications.isNotEmpty)
                      ListNotification(
                        day: 'Older',
                        notifications: olderNotifications,
                      ),
                    if (olderNotifications.isEmpty) const SizedBox(),
                  ],
                ),
              );
            } else if (state is NotificationsError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No notifications'));
            }
          },
        ),
      ),
    );
  }
}
