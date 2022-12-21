import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({super.key, this.hinttext,this.hidden});
  final String? hinttext;
  final bool? hidden;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 48,
        width: 312,
        child: TextFormField(
          maxLength: 50,
          obscureText: hidden??false,
          maxLines: 1,
          decoration: InputDecoration(
            counterText: '',
            
            filled: true,
            hintText: hinttext,
            fillColor: Colors.grey,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

const MaterialColor mainColor = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
const int _bluePrimaryValue = 0xFF92E3A9;
