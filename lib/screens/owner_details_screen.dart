import 'package:async_redux_boilerplate/connectors/owner_details.dart';
import 'package:flutter/material.dart';

class OwnerDetailsScreen extends StatelessWidget {
  OwnerDetailsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ownerName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('User $ownerName details'),
      ),
      body: OwnerDetails(),
    );
  }
}
