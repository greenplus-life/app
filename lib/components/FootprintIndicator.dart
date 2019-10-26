import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootprintIndicator extends StatelessWidget {
  const FootprintIndicator({
    Key key,
    @required this.imageNr,
    @required this.flow,
  }) : super(key: key);

  final int imageNr;
  final int flow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(1.8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: IndexedStack(
        index: imageNr - 1,
        children: <Widget>[
          IndexedStack(
            index: flow,
            children: <Image>[
              Image(
                image: AssetImage("assets/tree_animation-1-reverse.gif"),
              ),
              Image(
                image: AssetImage("assets/tree_animation-1.gif"),
              ),
            ],
          ),
          IndexedStack(
            index: flow,
            children: <Image>[
              Image(
                image: AssetImage("assets/tree_animation-2-reverse.gif"),
              ),
              Image(
                image: AssetImage("assets/tree_animation-2.gif"),
              ),
            ],
          ),
          IndexedStack(
            index: flow,
            children: <Image>[
              Image(
                image: AssetImage("assets/tree_animation-3-reverse.gif"),
              ),
              Image(
                image: AssetImage("assets/tree_animation-3.gif"),
              ),
            ],
          ),
          IndexedStack(
            index: flow,
            children: <Image>[
              Image(
                image: AssetImage("assets/tree_animation-4-reverse.gif"),
              ),
              Image(
                image: AssetImage("assets/tree_animation-4.gif"),
              ),
            ],
          ),
          IndexedStack(
            index: flow,
            children: <Image>[
              Image(
                image: AssetImage("assets/tree_animation-5-reverse.gif"),
              ),
              Image(
                image: AssetImage("assets/tree_animation-5.gif"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
