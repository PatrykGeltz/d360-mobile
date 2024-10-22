import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mariner/components/members/member_wants_to_join.dart';

@RoutePage()
class MembersJoinRequestsPage extends StatefulWidget {
  static const String id = '/members/wants_to_join';

  const MembersJoinRequestsPage({super.key});

  @override
  _MembersJoinRequestsPageState createState() => _MembersJoinRequestsPageState();
}

class _MembersJoinRequestsPageState extends State<MembersJoinRequestsPage> {
  List<Member> joinRequests = [];
  Map<String, dynamic> members={}; 
  bool fetchedData = false;
  bool change=false;
  @override
  void initState() {
    super.initState();
    _fetchMembersData().then((value) => _fetchMembersRequestsData());
  }

  Future<void> _fetchMembersRequestsData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/register-statuses';
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token");

      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        fetchedData=true;
        setState(() {

          joinRequests = data.map((memberData) {

            var member = _getMemberFromId(memberData['id']);
            Member _member = Member(
              id: memberData['id'].toString(),
              name: memberData['member_name'] ?? '',
              email: member['email'],
              phone: member['phone'],
              pesel: member['pesel'],
              address: member['address'],
              city:"${member['zip']} ${member['city']}",
              onChange:_onChange
            );
            return _member; 
          }).toList();
        });

      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  void _onChange() {
    setState(() {
      change=true;
    });
  }
  dynamic _getMemberFromId(var member_id){
    for(var member in members['data']){
      if(member['id'] == member_id) return member;
    }
  }

  Future<void> _fetchMembersData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/members';
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token");

      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          members = data;
        });
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if(change) {
      _fetchMembersData().then((value) => _fetchMembersRequestsData().then((v)=>{change=false}));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20.0,),
          if (!fetchedData)
            const CircularProgressIndicator()
          else
            ...joinRequests
        ],
      ),
    );
  }
}



