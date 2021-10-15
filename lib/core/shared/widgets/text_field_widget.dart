import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class NewFormTextField extends StatefulWidget {
  const NewFormTextField({
    Key? key,
    this.focus,
    required this.keyboardType,
    this.isPass = false,
    required this.icon,
    required this.text,
    this.textInputAction,
    required this.controller,
    required this.formater,
     this.onFieldSubmitted,
  }) : super(key: key);

  final FocusNode? focus;
  final TextInputType keyboardType;
  final IconData icon;
  final String text;
  final TextEditingController controller;
  final bool isPass;
  final FilteringTextInputFormatter formater;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  @override
  _NewFormTextFieldState createState() => _NewFormTextFieldState();
}

class _NewFormTextFieldState extends State<NewFormTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: TextFormField(
        focusNode: widget.focus,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: [widget.formater],
        obscureText: widget.isPass ? !_passwordVisible : false,
        controller: widget.controller,
        style: ktsMediumBodyText.copyWith(color: kcIconDark),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: ktsMediumBodyText.copyWith(color: kcIconLight),
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          // errorBorder: OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          prefixIcon: Icon(
            widget.icon,
            size: 30,
          ),
          suffixIcon: widget.isPass
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: _passwordVisible
                      ? const Icon(Icons.visibility, color: Colors.blue)
                      : const Icon(
                          Icons.visibility_off,
                          color: kcIconDark,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
