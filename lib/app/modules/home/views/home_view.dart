import 'package:alquran_app/app/data/models/surah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Surah>>(
          future: controller.getAllSurah(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No Data'),
              );
              // print(snapshot.data);
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  Surah surah = snapshot.data[index];
                  return ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      child: Text('${surah.number}'),
                    ),
                    title:
                        Text("${surah.name?.transliteration?.id ?? 'Error'}"),
                    subtitle: Text(
                        "${surah.numberOfVerses}  Ayat | ${surah.revelation?.id ?? 'Error'}"),
                    trailing: Text("${surah.name?.short ?? 'Error'}"),
                  );
                },
                itemCount: snapshot.data.length);
          },
        ));
  }
}
