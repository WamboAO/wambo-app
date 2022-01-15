import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    required this.navigation,

    required this.back,
    required this.search,
  }) : super(key: key);

  final TextEditingController controller;
 
  final Function navigation, back;
  final Function(String) search;

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        elevation: 0.6,
        backgroundColor: kcWhite,
        automaticallyImplyLeading: false,
        title: Container(
          height: screenHeightPercentage(context, percentage: 0.06),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                  
                    keyboardType: TextInputType.text,
                    onSubmitted: (text) => navigation(),
                    onChanged: (text) => search(text),
                    controller: controller,
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        filled: true,
                        fillColor: kcIconLight,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 25,
                          color: kcIcon,
                        ),
                        // suffixIcon: search.text.isEmpty
                        //     ? null
                        //     : GestureDetector(
                        //         onTap: () => search.clear(),
                        //         child: const Icon(Icons.cancel,
                        //             size: 19,
                        //             color: Colors.black),
                        //       ),
                        hintText: "Pesquisa",
                        hintStyle: ktsSmallBodyText.copyWith(
                            color: kcIcon, fontSize: 14)),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: AutoSizeText(
                      'Cancelar',
                      style: ktsSmallBodyText.copyWith(color: kcSecondary),
                    )),
                onTap: () => back(),
              )
            ],
          ),
        ));
  }
}
