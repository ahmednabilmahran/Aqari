import 'package:aqari/main.dart';
import 'package:aqari/models/notification_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton

/// NotificationsApi class
class NotificationsApi {
  /// getNotificationsForUser method
  Future<List<NotificationModel>> getNotificationsForUser(String userId) async {
    final response = await supabaseClient
        .from('notifications')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return response.map<NotificationModel>(NotificationModel.fromJson).toList();
  }
}
