// File: lib/screens/mobil_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/mobil.dart';

class MobilScreen extends StatelessWidget {
    final ApiService api = ApiService();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Daftar Mobil')),
            body: FutureBuilder<List<Mobil>>(
                future: api.fetchMobil(),
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                                Mobil mobil = snapshot.data![index];
                                return ListTile(
                                    title: Text(mobil.brand ?? 'No Brand'),
                                    subtitle: Text(mobil.model ?? 'No Model'),
                                );
                            },
                        );
                    }
                },
            ),
        );
    }
}
