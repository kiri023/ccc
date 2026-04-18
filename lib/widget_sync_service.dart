import 'package:home_widget/home_widget.dart';

import 'models.dart';

class WidgetSyncService {
  static const _androidWidgetName = 'MorningBriefWidgetProvider';
  static const _iOSWidgetName = 'MorningBriefWidget';

  Future<void> sync(MorningBrief brief) async {
    await HomeWidget.saveWidgetData<String>('location', brief.location);
    await HomeWidget.saveWidgetData<int>('temperatureC', brief.temperatureC);
    await HomeWidget.saveWidgetData<int>('rainProbability', brief.rainProbability);
    await HomeWidget.saveWidgetData<int>('pm25', brief.pm25);
    await HomeWidget.saveWidgetData<String>('recommendation', brief.recommendation);

    final topSchedule = brief.schedules.isNotEmpty
        ? '${brief.schedules.first.time} ${brief.schedules.first.title}'
        : '오늘 일정 없음';
    await HomeWidget.saveWidgetData<String>('topSchedule', topSchedule);

    await HomeWidget.updateWidget(
      androidName: _androidWidgetName,
      iOSName: _iOSWidgetName,
    );
  }
}
