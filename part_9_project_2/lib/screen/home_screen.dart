import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(10, (index) => UserStory(userName: "user$index")),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(24)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: "userName", likeCount: 40, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "gesture", likeCount: 2, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "setting", likeCount: 643, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "navigator", likeCount: 213, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "theme", likeCount: 1, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "project", likeCount: 68, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "you", likeCount: 43, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
  FeedData(userName: "hi", likeCount: 57, content: "에헿ㅎ힣힣ㅎ헿ㅎ헤"),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "좋아요 ${feedData.likeCount}개",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: feedData.userName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
              text: feedData.content,
            ),
          ], style: TextStyle(color: Colors.black))),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
