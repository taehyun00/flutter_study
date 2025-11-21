import 'package:flutter/material.dart';
import 'package:flutter_project_1/viewmodel/webtoon_viewmodel.dart';
import 'package:flutter_project_1/model/webtoon_model.dart';

class WebtonView extends StatefulWidget {
  const WebtonView({super.key});

  @override
  State<WebtonView> createState() => _WebtonViewState();
}

class _WebtonViewState extends State<WebtonView> {
  final WebtoonViewmodel viewModel = WebtoonViewmodel();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadWebtoons();
  }

  Future<void> loadWebtoons() async {
    await viewModel.getTodayWebtoon();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 49, 49),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: Text(
          "ToonRecommend",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.webtoon.length,
                    itemBuilder: (context, index) {
                      final webtoon = viewModel.webtoon[index];
                      return ListTile(
                        leading: Image.network(
                          webtoon.thumb,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(webtoon.name),
                        subtitle: Text('ID: ${webtoon.id}'),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
