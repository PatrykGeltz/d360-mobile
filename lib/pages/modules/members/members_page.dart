import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/members/member.dart';

@RoutePage()
class MembersUsersPage extends StatefulWidget {
  const MembersUsersPage({super.key});

  @override
  State<MembersUsersPage> createState() => _MembersUsersPageState();
}

class _MembersUsersPageState extends State<MembersUsersPage> {
  List<Member> members = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMembersData();
  }

  Future<void> _fetchMembersData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/members';
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        
        setState(() {
          members = data.map((memberData) {
            return Member(
              id: memberData['id'].toString(),
              name: memberData['name'] ?? '',
              phone: memberData['phone'] ?? '* Nie podano *',
              pesel: memberData['pesel'] ?? '* Nie podano *',
              email: memberData['email'] ?? '* Nie podano *',
              address: memberData['address'] ?? '* Nie podano *',
              city: memberData['city'] ?? '* Nie podano *',
              date_of_approval: memberData['register_status']['join_date'] ?? '',
              register_status: memberData['register_status']['type'],
              onDelete: () => _removeMemberFromList(memberData['id'].toString()),
            );
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Usunięcie członka z listy po akcji usunięcia
  void _removeMemberFromList(String memberId) {
    setState(() {
      members.removeWhere((member) => member.id == memberId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: members.isNotEmpty
                  ? members
                      .map((member) => Column(
                            children: [
                              member,
                              Divider(color: colors['special']),
                            ],
                          ))
                      .toList()
                  : const [
                      Center(
                        child: Text('Brak dostępnych członków'),
                      ),
                    ],
            ),
    );
  }
}
