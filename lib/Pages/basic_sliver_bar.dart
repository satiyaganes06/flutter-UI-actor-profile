import 'package:actors_profile_app/Database/database.dart';
import 'package:actors_profile_app/widget/item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicSliverBar extends StatelessWidget {
  var database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: (){

              },
              splashRadius: 20.0,
            ),
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: homeBanner(),
              title: Text('pF-Acts', style: GoogleFonts.ubuntu(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
            actions: const [
              CircleAvatar(
                backgroundImage: NetworkImage('https://365psd.com/images/istock/previews/9730/97305669-avatar-icon-of-girl-in-a-baseball-cap.jpg'),
              ),
              
              SizedBox(width: 10,)
            ],
            expandedHeight: 400,
          ),
          
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
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
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (bCtx, i) => Actors_Card(
                    database.actorLists[i].name, 
                    database.actorLists[i].rating_value, 
                    database.actorLists[i].img
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget homeBanner(){
    return Container(
      width: 150,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://www.onlykollywood.com/wp-content/uploads/2023/04/leo-fan-made-poster.jpg'),
          fit: BoxFit.cover
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 1],
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.95)
            ],
          ),
        )
      )
    );
  }
}
