import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imagePath; // Enhancement 1: Optional path for media asset

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.postContent,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imagePath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Enhancement 2: Dynamic Profile Avatar
                CircleAvatar(
                  backgroundImage: AssetImage(userAvatar),
                  radius: ScreenUtil().setWidth(20),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(3),
                        ),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // Post Content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            
            // Enhancement 1: Dynamic Image / Placeholder handling
            hasImage == true
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
                      child: imagePath != null
                          ? Image.asset(
                              imagePath!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: ScreenUtil().setHeight(250),
                            )
                          : const Placeholder(fallbackHeight: 200),
                    ),
                  )
                : SizedBox(
                    height: ScreenUtil().setHeight(1),
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    print('Liked');
                  },
                  icon: const Icon(
                    Icons.thumb_up,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: numOfLikes.toString(),
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.redo,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
              ],
            ),
            // Enhancement 3: Widget-based Action Buttons Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_outlined, color: Colors.grey),
                  label: CustomText(
                    text: 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined, color: Colors.grey),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(),

            // Enhancement 3: "Most relevant" dropdown indicator header
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: 'Most relevant ',
                  fontSize: ScreenUtil().setSp(11),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: ScreenUtil().setSp(16),
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),

            // Enhancement 3: Comment Input Container with embedded accessory icons
            Row(
              children: [
                // Enhancement 2: Comment Input Avatar
                CircleAvatar(
                  backgroundImage: AssetImage(userAvatar),
                  radius: ScreenUtil().setWidth(14),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                      vertical: ScreenUtil().setHeight(5),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(20)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Write a comment...',
                            fontSize: ScreenUtil().setSp(11),
                            color: Colors.grey,
                          ),
                        ),
                        // Accessory icons matching the design reference
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.gif_box_outlined, size: 16, color: Colors.grey),
                            SizedBox(width: ScreenUtil().setWidth(4)),
                            Icon(Icons.emoji_emotions_outlined, size: 16, color: Colors.grey),
                            SizedBox(width: ScreenUtil().setWidth(4)),
                            Icon(Icons.camera_alt_outlined, size: 16, color: Colors.grey),
                            SizedBox(width: ScreenUtil().setWidth(4)),
                            Icon(Icons.sticky_note_2_outlined, size: 16, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}