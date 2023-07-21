import 'package:actors_profile_app/Database/database.dart';
import 'package:actors_profile_app/widget/item_card.dart';
import 'package:flutter/material.dart';

class AdvancedSliverAppbar extends StatefulWidget {
  const AdvancedSliverAppbar({ Key? key }) : super(key: key);

  @override
  _AdvancedSliverAppbarState createState() => _AdvancedSliverAppbarState();
}

class _AdvancedSliverAppbarState extends State<AdvancedSliverAppbar> {
  var database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers:  [
            const SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                expandedHeight:200
              ),
              pinned: true,
            ),

            

            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) => Actors_Card(
                  database.actorLists[i].name, 
                  database.actorLists[i].rating_value, 
                  database.actorLists[i].img
                ),
                childCount: 10
              ), 
              
            )
          ],
        ),
      ),
    );
  }

  Widget listGenerator(){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15
          ),
          primary:false,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (bCtx, i) => Actors_Card(
            database.actorLists[i].name, 
            database.actorLists[i].rating_value, 
            database.actorLists[i].img
          ),
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
     // overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          title: Text("pf-Acts"),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Image.network(
      'https://source.unsplash.com/random?mono+dark',
      fit: BoxFit.cover,
    ),
  );

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          child: Row(
            children: [
              Expanded(child: buildButton(text: 'Share', icon: Icons.share)),
              Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
            ],
          ),
        ),
      );

  Widget buildButton({
    @required String text = 'heloo',
    @required IconData icon = Icons.ac_unit,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}