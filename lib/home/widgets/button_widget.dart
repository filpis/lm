import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.isLoading,
    required this.onTap,
  });
  final bool isLoading;
  final VoidCallback onTap;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFF5715),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 500,
            height: 50,
            child: Center(
              child: widget.isLoading == true
                  ? const Padding(
                      padding: EdgeInsets.all(6),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      "Pedir desconto",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            )),
      ),
    );
  }
}
