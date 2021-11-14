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
    this.textCapitalization,
    this.onChanged,
    required this.formater,
    this.onFieldSubmitted,
  }) : super(key: key);

  final FocusNode? focus;
  final TextInputType keyboardType;
  final IconData icon;
  final String text;
  final  Function(String)? onChanged;
  final TextEditingController controller;
  final bool isPass;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter> formater;
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
        textCapitalization: widget.textCapitalization !=null? widget.textCapitalization! : TextCapitalization.none,
        focusNode: widget.focus,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.formater,
        obscureText: widget.isPass ? !_passwordVisible : false,
        controller: widget.controller,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: ktsMediumBodyText.copyWith(color: kcIconDark),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.text,
          errorStyle: ktsSmallBodyText.copyWith(color: Colors.red),
          hintStyle: ktsMediumBodyText.copyWith(color: kcIconLight),
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
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

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      required this.hintText,
      required this.focus,
      this.onSubmit,
      this.onChanged,
      required this.controller,
      required this.onClear})
      : super(key: key);
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final String hintText;
  final FocusNode focus;
  final Function onClear;
  final TextEditingController controller;
  

  @override
  Widget build(BuildContext context) {
   
    return TextField(
      keyboardType: TextInputType.text,
      onSubmitted: (text) => onSubmit!(text),
      onChanged: (text) => onChanged!(text),
      controller: controller,
      autofocus: false,
      focusNode: focus,
      style: ktsMediumBodyText.copyWith(color: Colors.grey.shade800),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: kcPrimary,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () => onClear(),
                child: const Icon(Icons.cancel, size: 19, color: Colors.black),
              ),
        hintText: hintText,
        hintStyle: ktsMediumBodyText.copyWith(color: Colors.grey)
        ,
      ),
    );
  }
}