import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/base_colors.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../profile/profile.dart';
import '../navigation/verinvest_appbar.dart';
import '../profile/user_profile.dart';
import '../education_post/education.dart';
import '../education_post/education_post_detail.dart';

class EducationD {
  late Profile author;
  late DateTime dateCreated;
  late String title;
  late String content;
  late int upvotes;
  late int viewers;
  late int commentsCount;

  static List<EducationD> listdummy = [];

  EducationD(this.author, this.dateCreated, this.title, this.content, this.upvotes, this.viewers, this.commentsCount);
}

class EducationPost extends StatefulWidget {
  const EducationPost({Key? key}) : super(key: key);

  @override
  _EducationPostState createState() => _EducationPostState();
}

class _EducationPostState extends State<EducationPost> {
  Profile author = Profile("John", "Doe", "johndoe@gmail.com", "12 December 2012", "Student");
  DateTime dateCreated = DateTime(2022,12,12);
  String title = "Education Post Title";
  String content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas dui id ornare arcu odio ut sem nulla pharetra. Cras sed felis eget velit aliquet sagittis. Rhoncus dolor purus non enim. Augue ut lectus arcu bibendum at varius vel.";
  int upvotes = 0;
  int viewers = 0;
  int commentsCount = 0;

  Future<List<Education>> fetchEducation() async {
    var url = Uri.parse('https://verinvest.up.railway.app/collections/education/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Education
    List<Education> listEducation = [];
    for (var d in data) {
      if (d != null) {
        listEducation.add(Education.fromJson(d));
      }
    }

    return listEducation;
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Education ", style: TextStyle(color: BaseColors.green[500], fontSize: 28.0, fontWeight: FontWeight.bold)),
                  Text("Post", style: TextStyle(color: Colors.grey, fontSize: 28.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EducationPostDetailDummy()));
                      },
                      child:Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                blurRadius: 2.0
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(title, style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.thumb_up),
                                        Text(upvotes.toString(),
                                          style: const TextStyle(fontSize: 16.0),
                                        ),
                                        Text("   "),
                                        Icon(Icons.visibility),
                                        Text(viewers.toString(),
                                          style: const TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    )
                                  )
                                ]
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.account_circle),
                                            Text(author.first_name + " " + author.last_name,
                                              style: const TextStyle(fontSize: 14.0),
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today),
                                            Text(DateFormat("yyyy-MM-dd").format(dateCreated),
                                              style: const TextStyle(fontSize: 14.0),
                                            ),
                                          ],
                                        )
                                    )
                                  ]
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(content,
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                              ),
                          ]
                      ),
                      )
                    );
                  }
              )
          ),
            FutureBuilder(
              future: fetchEducation(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Tidak ada education post :(",
                          style: TextStyle(
                              color: Color(0xff59A5D8),
                              fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EducationPostDetail(snapshot.data![index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 2.0
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${snapshot.data![index].fields.title}",
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.thumb_up),
                                              Text("${snapshot.data![index].fields.upvotes}",
                                                style: const TextStyle(fontSize: 16.0),
                                              ),
                                              Text("   "),
                                              Icon(Icons.visibility),
                                              Text("${snapshot.data![index].fields.viewers}",
                                                  style: const TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        )
                                      ],
                                    )
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.account_circle),
                                              Text(
                                                "${snapshot.data![index].fields.author.first_name}" + " " + "${snapshot.data![index].fields.author.last_name}",
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.calendar_today),
                                              Text(DateFormat("yyyy-MM-dd").format(snapshot.data![index].fields.dateCreated),
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${snapshot.data![index].fields.content}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                    );
                  }
                }
              }
              ),
          ],
        ),
      ),
    );
  }
}
