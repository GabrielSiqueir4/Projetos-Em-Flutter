// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:atividade01/PAGES/Audio_Page.dart';
import 'package:atividade01/PAGES/Camera_page.dart';
import 'package:atividade01/PAGES/Foto_Screen.dart';
import 'package:atividade01/PAGES/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int paginaAtual = 0;
  late PageController pc;

 

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: [
          HomePage(),
          CameraScreen(),
          AudioComponent(File('abc')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        fixedColor: Colors.black,

        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.blueAccent,
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.audiotrack_outlined,
              color: Colors.blueAccent,
            ),
            label: 'Audio',
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
