import 'dart:math';

import 'models.dart';

class MorningBriefRepository {
  Future<MorningBrief> fetchTodayBrief() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final random = Random(DateTime.now().day);

    return MorningBrief(
      location: '서울 강남구',
      temperatureC: 12 + random.nextInt(12),
      rainProbability: 20 + random.nextInt(70),
      pm25: 10 + random.nextInt(60),
      schedules: const [
        ScheduleItem(time: '10:00', title: '팀 스탠드업'),
        ScheduleItem(time: '14:00', title: '병원 예약'),
      ],
    );
  }
}
