// TEMPLATE ONLY

import 'package:flutter/material.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/verinvest_appbar.dart';
import '../profile/user_profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Future<ProfileData?> future = loadData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VerinvestAppbar(),
        drawer: Hamburger(),
        body: RefreshIndicator(
          onRefresh: () {
            setState(() {
              future = loadData();
            });
            return future;
          },
          child: FutureBuilder(
            future: future,
            builder: (contex, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final ProfileData profile = snapshot.data!;

                return Column(
                  children: [
                    const Text('dummy'),
                    // Expanded(
                    //     child: ListView(
                    //   children: [
                    //     const Text("hello"),
                    //     GridView.count(
                    //       primary: false,
                    //       padding: const EdgeInsets.all(20),
                    //       crossAxisSpacing: 10,
                    //       mainAxisSpacing: 10,
                    //       crossAxisCount: 3,
                    //       children: <Widget>[
                    //         Container(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 8.0),
                    //           child: const Text("Name"),
                    //         ),
                    //         Container(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 8.0),
                    //           child: const Text("hello"),
                    //         ),
                    //         Container(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 8.0),
                    //           child: const Text("edit"),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // ))
                  ],
                );
              } else {
                return Text("Error Occurred");
              }
            },
          ),
        ));
  }
}

Future<ProfileData?> loadData() async {
  try {
    final url = "https://verinvest.up.railway.app/profile/json/";

    final res = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });
    final data = jsonDecode(res.body);

    for (dynamic item in data) {
      if (item != null) {
        return ProfileData.fromMap(item);
      }
    }
  } catch (error) {
    print(error);
  }
}
