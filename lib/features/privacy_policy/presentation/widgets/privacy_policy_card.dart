import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/panel_privacy_officer.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/privacy_policy.dart';
import 'panel_one.dart';
import 'title_panel.dart';

class PrivacyPolicyCard extends StatefulWidget {
  final LoginUser user;
  final PrivacyPolicy privacyPolicy;

  PrivacyPolicyCard(
      {Key key, @required this.user, @required this.privacyPolicy})
      : super(key: key);

  @override
  _PrivacyPolicyCardState createState() => _PrivacyPolicyCardState();
}

class _PrivacyPolicyCardState extends State<PrivacyPolicyCard> {
  List<bool> _expanded = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _expanded[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return TitlePanel(title: 'Data Type Collected');
            },
            canTapOnHeader: true,
            body: PanelOne(list: widget.privacyPolicy.getTypes),
            isExpanded: _expanded[0],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return TitlePanel(title: 'Data Usage Policy');
            },
            canTapOnHeader: true,
            body: PanelOne(list: widget.privacyPolicy.getUsages),
            isExpanded: _expanded[1],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return TitlePanel(title: 'Data Removal Policy');
            },
            canTapOnHeader: true,
            body: PanelOne(list: widget.privacyPolicy.getRemoval),
            isExpanded: _expanded[2],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return TitlePanel(title: 'Privacy Officer Contact');
            },
            canTapOnHeader: true,
            body: PanelPrivacyOfficer(
              contactLink: widget.privacyPolicy.contactLink,
              email: widget.privacyPolicy.email,
              fiLine: widget.privacyPolicy.fiLine,
              sLine: widget.privacyPolicy.sLine,
              tLine: widget.privacyPolicy.tLine,
              foLine: widget.privacyPolicy.foLine,
              user: widget.user,
            ),
            isExpanded: _expanded[3],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return TitlePanel(title: 'Full Privacy Policy');
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
              ],
            ),
            isExpanded: _expanded[4],
          ),
        ],
      ),
    );
  }
}
