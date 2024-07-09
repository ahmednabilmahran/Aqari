import 'package:aqari/apis/notifications_api.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'notifications_state.dart';

@injectable

/// NotificationsCubit class
class NotificationsCubit extends Cubit<NotificationsState> {
  /// NotificationsCubit constructor
  NotificationsCubit(this._notificationsApi) : super(NotificationsInitial());
  final NotificationsApi _notificationsApi;

  /// Fetch notifications for a specific user
  Future<void> fetchNotifications(String userId) async {
    try {
      emit(NotificationsLoading());
      final notifications =
          await _notificationsApi.getNotificationsForUser(userId);
      emit(NotificationsLoaded(notifications));
    } catch (e) {
      emit(NotificationsError(e.toString()));
    }
  }
}
