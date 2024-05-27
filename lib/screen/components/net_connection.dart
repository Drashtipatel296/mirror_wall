import 'package:flutter/material.dart';

Padding netConnection() {
  return Padding(
    padding: const EdgeInsets.only(top: 70),
    child: Column(
      children: [
        Center(
          child: SizedBox(
            height: 350,
            width: 350,
            child: Image.asset(
              'assets/bg1.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Oooops!',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'No Internet connection found.\n      Check your connection.',
          style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 55,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Try Again',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}