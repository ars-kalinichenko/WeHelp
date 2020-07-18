import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_input_field.dart';
import 'package:we_help/services/debouncer.dart';
import 'package:we_help/services/rest_api.dart';
import 'package:we_help/types/User.dart';

class SearchScreen extends StatefulWidget {
  final String searchText;

  SearchScreen(this.searchText);

  final String title = "Search Customer Screen";

  @override
  SearchScreenState createState() => SearchScreenState(this.searchText);
}

class SearchScreenState extends State<SearchScreen> {
  String searchText;

  SearchScreenState(this.searchText);

  final _debouncer = Debouncer(milliseconds: 500);
  List<User> users = List();
  List<User> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    UsersApi.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          RoundedInputField(
            icon: Icons.search,
            height: 0.07,
            startText: searchText,
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredUsers = users
                      .where((user) => (user.fullName
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          user.email
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                      .toList();
                  searchText = string;
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          filteredUsers[index].fullName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          filteredUsers[index].email.toLowerCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
