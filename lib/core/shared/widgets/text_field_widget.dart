// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gira_mais/core/shared/ui/styles.dart';

// class NewFormTextField extends StatefulWidget {
//   const NewFormTextField({
//     Key? key,
//     this.focus,
//     required this.keyboardType,
//     this.isPass = false,
//     required this.icon,
//     required this.text,
//     required this.controller,
//     required this.formater,
//   }) : super(key: key);

//   final FocusNode? focus;
//   final TextInputType keyboardType;
//   final IconData icon;
//   final String text;
//   final TextEditingController controller;
//   final bool isPass;
//   final FilteringTextInputFormatter formater;

//   @override
//   _NewFormTextFieldState createState() => _NewFormTextFieldState();
// }

// class _NewFormTextFieldState extends State<NewFormTextField> {
//   late bool _passwordVisible;
//   @override
//   void initState() {
//     _passwordVisible = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         vertical: 10,
//       ),
//       child: TextFormField(
//         focusNode: widget.focus,
//         inputFormatters: [widget.formater],
//         obscureText: widget.isPass ? !_passwordVisible : false,
//         controller: widget.controller,
//         style: ktsMediumBodyText.copyWith(color: Colors.white),
//         keyboardType: widget.keyboardType,
//         decoration: InputDecoration(
//           hintText: widget.text,
//           hintStyle: ktsMediumBodyText.copyWith(color: Colors.white),
//           contentPadding: const EdgeInsets.all(0),
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.3),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
//             borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//           ),
//           // errorBorder: OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
//             borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//           ),
//           focusedErrorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           ),
//           prefixIcon: Icon(
//             widget.icon,
//             size: 30,
//             color: Colors.blue.shade200,
//           ),
//           suffixIcon: widget.isPass
//               ? GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   },
//                   child: _passwordVisible ?  Icon(Icons.visibility, color: Colors.blue.shade200) :  Icon(Icons.visibility_off, color: Colors.grey.shade200,),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }
