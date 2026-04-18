import 'package:flutter_test/flutter_test.dart';
import 'package:morning_brief/models.dart';

void main() {
  test('rain >= 40 이면 우산 추천', () {
    const brief = MorningBrief(
      location: '서울',
      temperatureC: 15,
      rainProbability: 45,
      pm25: 20,
      schedules: [],
    );

    expect(brief.needsUmbrella, isTrue);
    expect(brief.recommendation, contains('우산'));
  });

  test('pm25 >= 36 이면 마스크 추천', () {
    const brief = MorningBrief(
      location: '서울',
      temperatureC: 15,
      rainProbability: 10,
      pm25: 50,
      schedules: [],
    );

    expect(brief.needsMask, isTrue);
    expect(brief.recommendation, contains('마스크'));
  });
}
