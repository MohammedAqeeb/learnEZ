import 'package:flutter/material.dart';

Widget bottomNavigationItem(int index) {
  List<Widget> widgets = [
    const Center(
      child: Text('HOME SCREEN'),
    ),
    const Center(
      child: Text('SEARCH SCREEN'),
    ),
    const Center(
      child: Text('COURSE SCREEN'),
    ),
    const Center(
      child: Text('CHAT SCREEN'),
    ),
    const Center(
      child: Text('Profile SCREEN'),
    ),
  ];

  return widgets[index];
}
