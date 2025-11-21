import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '네이버 웹툰',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const WebtoonListPage(),
    );
  }
}

class WebtoonListPage extends StatefulWidget {
  const WebtoonListPage({super.key});

  @override
  State<WebtoonListPage> createState() => _WebtoonListPageState();
}

class _WebtoonListPageState extends State<WebtoonListPage> {
  List<dynamic> webtoons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWebtoons();
  }

  Future<void> fetchWebtoons() async {
    try {
      final response = await http.get(
        Uri.parse('https://korea-webtoon-api-cc7dda2f0d77.herokuapp.com/webtoons?provider=NAVER&updateDay=MON'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          webtoons = data['webtoons'] ?? [];
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('네이버 웹툰 - 월요일'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: webtoons.length,
              itemBuilder: (context, index) {
                final webtoon = webtoons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    // leading 제거하고 title만 사용
                    title: Text(
                      webtoon['title'] ?? '제목 없음',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('작가: ${webtoon['author'] ?? '알 수 없음'}'),
                        Text('장르: ${webtoon['additional']?['new'] == true ? "🆕 " : ""}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // 웹툰 상세 페이지로 이동
                      print('선택된 웹툰: ${webtoon['title']}');
                    },
                  ),
                );
              },
            ),
    );
  }
}
