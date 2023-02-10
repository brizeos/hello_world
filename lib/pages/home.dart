import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/service/PictureService.dart';
import 'package:hello_world/service/TakePictureScreen.dart';
import 'package:hello_world/system/router_config.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Accueil")),
      body: Center(
        child: ListView(
          children: [
            Center(child:)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PictureService().init();
          // context.goNamed(CustomRouterConfiguration.SINGLE_PRODUCT, params: {"id" : "3244081500005"});
        },
        child: const Icon(Icons.add, color: Colors.white),

      ),
    );
  }
}
