import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootprintIndicator extends StatelessWidget {
  const FootprintIndicator({
    Key key,
    @required this.footprintStatus,
    @required this.flow,
  }) : super(key: key);

  final int footprintStatus;
  final int flow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(1.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: IndexedStack(
          index: footprintStatus - 1,
          children: <Widget>[
            IndexedStack(
              //status: 1
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-1-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-1.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-1.png"),
                ),
              ],
            ),
            IndexedStack(
              //status: 2
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-2-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-2.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-2.png"),
                ),
              ],
            ),
            IndexedStack(
              //status: 3
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-3-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-3.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-3.png"),
                ),
              ],
            ),
            IndexedStack(
              //status: 4
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-4-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-4.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-4.png"),
                ),
              ],
            ),
            IndexedStack(
              //status: 5
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-5-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-5.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-5.png"),
                ),
              ],
            ),
            IndexedStack(
              //status: 6
              index: flow,
              children: <Image>[
                Image(
                  image: AssetImage("assets/tree_animation-5-reverse.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-5.gif"),
                ),
                Image(
                  image: AssetImage("assets/tree_animation-6.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
