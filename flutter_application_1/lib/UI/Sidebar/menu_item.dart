import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

List listitem = [
  routes.register,
  routes.register,
  routes.register,
  routes.register,
  routes.LoginRoute
];

///builds the different widgets for the sidebar
///
///@author Bobby Newsome

class MenuItemsPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItemsPage({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xffC860FF),
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 26,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
