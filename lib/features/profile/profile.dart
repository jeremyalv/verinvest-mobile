// TEMPLATE ONLY

import 'package:flutter/material.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/verinvest_appbar.dart';
import '../profile/user_profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Future<ProfileData?> future = loadData();

  Future<http.Response> updateString(String url, String name) {
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );
  }

  void first_name(String name) async {
    http.Response response =
        await updateString("https://verinvest.up.railway.app/profile/first_name/", name);
    print(response.body);
  }

  void last_name(String name) async {
    http.Response response =
        await updateString("https://verinvest.up.railway.app/profile/last_name/", name);
    print(response.body);
  }

  void email(String name) async {
    http.Response response =
        await updateString("https://verinvest.up.railway.app/profile/email/", name);
    print(response.body);
  }

  void birth_date(String name) async {
    http.Response response =
        await updateString("https://verinvest.up.railway.app/profile/birthdate/", name);
    print(response.body);
  }

  void occupation(String name) async {
    http.Response response =
        await updateString("https://verinvest.up.railway.app/profile/occupation/", name);
    print(response.body);
  }

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

                String getBirthDate() {
                  if (profile.fields.birth_date == null) {
                    return "";
                  } else {
                    return profile.fields.birth_date!;
                  }
                }

                String getOccupation() {
                  if (profile.fields.occupation == null) {
                    return "";
                  } else {
                    return profile.fields.occupation!;
                  }
                }

                final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                final controllerString = TextEditingController();

                return Column(children: [
                  Text(
                      "${profile.fields.first_name} ${profile.fields.last_name}"),
                  Container(
                    padding: const EdgeInsets.all(50.0),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text("First Name"),
                          Text(profile.fields.first_name),
                          TextButton(
                            child: Text("Edit"),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Edit First Name'),
                                actions: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Column(children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your first name',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {}
                                          setState(() {
                                            profile.fields.first_name = value!;
                                            first_name(value);
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context, 'OK');
                                              }
                                            },
                                            child: const Text('Submit'),
                                          ))
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text("Last Name"),
                          Text(profile.fields.last_name),
                          TextButton(
                            child: Text("Edit"),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Edit Last Name'),
                                actions: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Column(children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your last name',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {}
                                          setState(() {
                                            profile.fields.last_name = value!;
                                            last_name(value);
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context, 'OK');
                                              }
                                            },
                                            child: const Text('Submit'),
                                          ))
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text("Email"),
                          Text(profile.fields.email),
                          TextButton(
                            child: Text("Edit"),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Edit Email'),
                                actions: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Column(children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your new email',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {}
                                          setState(() {
                                            profile.fields.email = value!;
                                            email(value);
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context, 'OK');
                                              }
                                            },
                                            child: const Text('Submit'),
                                          ))
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text("Birthdate"),
                          Text(getBirthDate()),
                          TextButton(
                            child: Text("Edit"),
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  profile.fields.birth_date =
                                      formattedDate; //set output date to TextField value.
                                  birth_date(formattedDate);
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          )
                        ]),
                        TableRow(children: [
                          Text("Occupation"),
                          Text(getOccupation()),
                          TextButton(
                            child: Text("Edit"),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Edit Occupation'),
                                actions: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Column(children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your new occupation',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {}
                                          setState(() {
                                            profile.fields.occupation = value!;
                                            occupation(value);
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context, 'OK');
                                              }
                                            },
                                            child: const Text('Submit'),
                                          ))
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  )
                ]);
              } else {
                return const Text("Error Occurred");
              }
            },
          ),
        ));
  }
}
