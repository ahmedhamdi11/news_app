import 'package:flutter/material.dart';

class NewsItemBuilder extends StatelessWidget {
  final int index;
  final List data;
  const NewsItemBuilder({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              height: 120,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: data[index]['urlToImage'] == null
                          ? const NetworkImage(
                              'http://store-images.s-microsoft.com/image/apps.33561.9007199266247846.b5c49955-e050-4553-b8e4-0e223ed6c5a1.a6d25753-d40a-4a54-ba54-cd26ed29e2b1',
                            )
                          : NetworkImage(data[index]['urlToImage'])))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${data[index]['title']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text(
                    '${data[index]['publishedAt']}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
