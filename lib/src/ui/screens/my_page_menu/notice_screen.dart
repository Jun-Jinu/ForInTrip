import 'package:flutter/material.dart';
import '../../widgets/appbar/menu_appbar.dart';

class Notice {
  final String title;
  final String content;

  Notice({required this.title, required this.content});
}

class NoticeScreen extends StatelessWidget {
  final List<Notice> notice_list = [
    Notice(
      title: 'Notice 1',
      content: 'This is the content of notice 1',
    ),
    Notice(
      title: 'Notice 2',
      content: 'This is the content of notice 2',
    ),
    Notice(
      title: 'Notice 3',
      content: 'This is the content of notice 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(title: "Notice"),
      body: ListView.builder(
        itemCount: notice_list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notice_list[index].title),
            subtitle: Text(notice_list[index].content),
          );
        },
      ),
    );
  }
}
