import 'package:flutter/material.dart';
import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/responsive.dart';

const List<String> roles = <String>[
  'Accountant',
  'Actuary',
  'AI',
  'Assembler',
  'Auditor',
  'Brand Specialist',
  'Cloud Solutions Architect',
  'Content Marketing',
  'Credit Analyst',
  'Cybersecurity Specialist',
];

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String dropdownValue = roles.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () => widget.scaffoldKey.currentState!.openDrawer(),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
              ),
            ),
          Expanded(
            child: DropdownMenu(
              initialSelection: roles.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  roles.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
