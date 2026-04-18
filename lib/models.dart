class ScheduleItem {
  const ScheduleItem({
    required this.time,
    required this.title,
  });

  final String time;
  final String title;
}

class MorningBrief {
  const MorningBrief({
    required this.location,
    required this.temperatureC,
    required this.rainProbability,
    required this.pm25,
    required this.schedules,
  });

  final String location;
  final int temperatureC;
  final int rainProbability;
  final int pm25;
  final List<ScheduleItem> schedules;

  bool get needsUmbrella => rainProbability >= 40;
  bool get needsMask => pm25 >= 36;

  String get recommendation {
    final buffer = <String>[];

    if (needsUmbrella) buffer.add('우산 챙기기 ☔');
    if (needsMask) buffer.add('마스크 권장 😷');
    if (buffer.isEmpty) buffer.add('가볍게 나가도 좋아요 🌤️');

    return buffer.join(' · ');
  }
}
