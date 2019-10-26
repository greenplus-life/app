import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transactionInfo,
  }) : super(key: key);

  final transactionInfo;

  @override
  Widget build(BuildContext context) {
    bool positiveAction = transactionInfo['consumption'] % 2 == 0;
    return ListTile(
      leading: positiveAction
          ? Icon(Icons.thumb_up, color: Colors.green)
          : Icon(Icons.thumb_down, color: Colors.red),
      title: Text(transactionInfo['name']),
      subtitle: Text('CO2: ${transactionInfo['consumption']}'),
      trailing: positiveAction
          ? FlatButton(
              child: Icon(Icons.check),
            )
          : FlatButton(
              child: Icon(Icons.repeat),
              onPressed: () {
                print("Compensate!");
              },
            ),
    );
  }
}
