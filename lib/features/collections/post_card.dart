import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      // width: double.maxFinite,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  post.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.postType == "forum"
                        ? "Forum Thread"
                        : "Education Article"),
                    Text(DateFormat.yMMMEd().format(post.dateCreated)),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  post.postType == 'forum'
                      ? Icon(
                          Icons.forum,
                          size: 30,
                          color: Colors.green[700],
                        )
                      : Icon(
                          Icons.school,
                          size: 30,
                          color: Colors.green[700],
                        )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(post.content),
            )
            // Container(
            //   padding: const EdgeInsets.all(16.0),
            //   alignment: Alignment.centerLeft,
            //   child: post.postType == 'forum'
            //       ? Text("You spent Rp${budgets.amount.toString()}",
            //           style: TextStyle(color: Colors.red[700]))
            //       : Text(
            //           "You received Rp${budgets.amount.toString()}",
            //           style: TextStyle(color: Colors.green[700]),
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
