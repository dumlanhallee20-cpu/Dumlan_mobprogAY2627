import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userAvatar: 'images/jm.png',
          userName: 'Hallee Dumlan',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
          hasImage: false,
        ),
        NewsFeedCard(
          userAvatar: 'images/jm.png',
          userName: 'Hallee Dumlan',
          postContent: 'Just finished my morning run!',
          numOfLikes: 150,
          date: 'October 12',
          hasImage: true,
          imagePath: 'images/dagoc.jpg', // Change to your post image asset path
        ),
      ],
    );
  }
}