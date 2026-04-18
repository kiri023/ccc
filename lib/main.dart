import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models.dart';
import 'morning_brief_repository.dart';
import 'widget_sync_service.dart';

void main() {
  runApp(const MorningBriefApp());
}

class MorningBriefApp extends StatelessWidget {
  const MorningBriefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morning Brief',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MorningBriefPage(),
    );
  }
}

class MorningBriefPage extends StatefulWidget {
  const MorningBriefPage({super.key});

  @override
  State<MorningBriefPage> createState() => _MorningBriefPageState();
}

class _MorningBriefPageState extends State<MorningBriefPage> {
  final _repository = MorningBriefRepository();
  final _widgetSyncService = WidgetSyncService();

  MorningBrief? _brief;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    final brief = await _repository.fetchTodayBrief();
    await _widgetSyncService.sync(brief);

    if (!mounted) return;
    setState(() {
      _brief = brief;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('M월 d일 (E)', 'ko_KR').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('아침 브리핑')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('오늘 $today', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            if (_loading && _brief == null)
              const Center(child: CircularProgressIndicator())
            else if (_brief != null)
              _BriefCard(brief: _brief!)
            else
              const Text('데이터를 불러오지 못했습니다.'),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _loading ? null : _refresh,
              icon: const Icon(Icons.sync),
              label: const Text('위젯 포함 새로고침'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BriefCard extends StatelessWidget {
  const _BriefCard({required this.brief});

  final MorningBrief brief;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📍 ${brief.location} / ${brief.temperatureC}℃'),
            const SizedBox(height: 8),
            Text('🌧️ 강수확률 ${brief.rainProbability}%'),
            Text('🌫️ PM2.5 ${brief.pm25}'),
            const Divider(height: 24),
            Text('추천: ${brief.recommendation}'),
            const SizedBox(height: 12),
            const Text('오늘 일정', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            for (final item in brief.schedules)
              Text('- ${item.time}  ${item.title}'),
          ],
        ),
      ),
    );
  }
}
