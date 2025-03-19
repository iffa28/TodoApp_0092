import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController namecontroller = TextEditingController();
  final key = GlobalKey<FormState>();
  List<String> daftarNama = [];

  void addData() {
    setState(() {
      daftarNama.add(namecontroller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/kucing.jpg'),
                    radius: 30,
                  ),
                  Text('Felix'),
                ],
              ),
              Form(
                key: key,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama masih kosong';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: Text('Nama Pendaftar'),
                          hintText: 'Masukkan nama lengkap pendaftar',
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          addData();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: ListView.builder(
                  itemCount: daftarNama.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(daftarNama[index])]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
