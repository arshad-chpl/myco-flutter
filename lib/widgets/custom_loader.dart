import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        // const ModalBarrier(dismissible: false, color: Colors.white),
        Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(
              'assets/gifs/mycoLoading.gif',
              width: 120,
              height: 120,
            ),
          ),
        ),
      ],
    );
}
