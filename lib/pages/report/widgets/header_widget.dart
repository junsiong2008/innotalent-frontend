import 'package:devhack_2023/utils/role_util.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/widgets/responsive.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
    required this.roleId,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final int roleId;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              enabled: false,
              initialSelection: RoleUtil.getRoleById(widget.roleId),
              dropdownMenuEntries:
                  RoleUtil.roles.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
