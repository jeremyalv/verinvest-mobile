import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/theme/base_colors.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../profile/profile.dart';
import '../navigation/verinvest_appbar.dart';
import '../education_post/education.dart';
import '../education_post/education_post.dart';

class EducationPostDetail extends StatefulWidget {
  final Education education;

  EducationPostDetail(this.education, {Key? key}) : super(key: key);

  @override
  _EducationPostDetailState createState() => _EducationPostDetailState(education);
}

class _EducationPostDetailState extends State<EducationPostDetail> {
  Education _education;
  bool upvoteStatus = false;
  String comment = "";

  _EducationPostDetailState(this._education);

  void _incrementUpvotes() {
    setState(() {
      upvoteStatus = true;
      _education.fields.upvotes++;
    });
  }

  void _decrementUpvotes() {
    setState(() {
      if(_education.fields.upvotes > 0){
        upvoteStatus = false;
        _education.fields.upvotes--;
      }
    });
  }

  void _incrementViews() {
    setState(() {
      _education.fields.viewers++;
    });
  }

  void _incrementComments() {
    setState(() {
      _education.fields.commentsCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VerinvestAppbar(),
        drawer: Hamburger(),
        body: SafeArea(
          child: Column(
            children: [
              Navbar(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(_education.fields.title, style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                          )
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle),
                                  Text(_education.fields.author.first_name + " " + _education.fields.author.last_name, style: TextStyle(
                                      fontSize: 18.0),
                                  ),
                                  Icon(Icons.calendar_today),
                                  Text(_education.fields.dateCreated.toString(), style: TextStyle(
                                      fontSize: 18.0),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  (upvoteStatus == false) ?
                                  FloatingActionButton(
                                    onPressed: _incrementUpvotes,
                                    child: Icon(Icons.thumb_up), backgroundColor: Colors.black,
                                  ) : FloatingActionButton(
                                    onPressed: _decrementUpvotes,
                                    child: Icon(Icons.thumb_up), backgroundColor: BaseColors.green[500],
                                  ),
                                  Text(_education.fields.upvotes.toString(), style: TextStyle(
                                      fontSize: 18.0),
                                  ),
                                  Icon(Icons.visibility),
                                  Text(_education.fields.viewers.toString(), style: TextStyle(
                                      fontSize: 18.0),
                                  ),
                                  Icon(Icons.comment),
                                  Text(_education.fields.commentsCount.toString(), style: TextStyle(
                                      fontSize: 18.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text(_education.fields.content, style: TextStyle(
                                fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                          child: const Text('Comment', style: TextStyle(fontSize: 20, color: Colors.white)),
                            style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(BaseColors.green[500]),
                            ),
                          onPressed: () async {
                            final comment = await openDialog();
                            if(comment == null || comment.isEmpty) return;
                            setState(() {
                              EducationComment(post: _education, commenter: _education.fields.author, dateCreated: DateTime.now(), content: comment, upvotes: 0);
                            });
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => EducationCommentFormPage()));
                          },
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: double.infinity,
                              child:TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text('Back',
                                    style: TextStyle(fontSize: 20, color: Colors.white)
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(BaseColors.green[500]),
                                ),
                              )
                          )
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Comment'),
      content: TextField(
        decoration: InputDecoration(hintText: 'Enter your comment here...'),
      ),
      actions: [
        TextButton(
          child: Text("Post"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ],
    )
  );
}

class EducationPostDetailDummy extends StatefulWidget {
  const EducationPostDetailDummy({super.key});

  @override
  _EducationPostDetailDummyState createState() => _EducationPostDetailDummyState();
}

class _EducationPostDetailDummyState extends State<EducationPostDetailDummy>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Container(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text("Education Post Title", style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                          )
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text("John Doe", style: TextStyle(
                                fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text("2022-12-12", style: TextStyle(
                                fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas dui id ornare arcu odio ut sem nulla pharetra. Cras sed felis eget velit aliquet sagittis. Rhoncus dolor purus non enim. Augue ut lectus arcu bibendum at varius vel.", style: TextStyle(
                                fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        child: const Text('Comment', style: TextStyle(fontSize: 20, color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BaseColors.green[500]),
                        ),
                        onPressed: () {

                        },
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: double.infinity,
                              child:TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text('Back',
                                    style: TextStyle(fontSize: 20, color: Colors.white)
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(BaseColors.green[500]),
                                ),
                              )
                          )
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}