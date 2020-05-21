import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import 'email_send_widget_body.dart';


class EmailSendWidget extends StatelessWidget {
  final LoginUser user;
  final String email;

  const EmailSendWidget({Key key, @required this.user, @required this.email}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(title: 'Send Email',imageUrl: user.getImageUrl,),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
              child: EmailSendWidgetBody(email: email),
          ),
        ),
      ),
    );
  }


}


