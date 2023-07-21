import 'package:actors_profile_app/Database/database.dart';
import 'package:actors_profile_app/widget/item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarSliverAppbar extends StatefulWidget {
  const TabBarSliverAppbar({ Key? key }) : super(key: key);

  @override
  _TabBarSliverAppbarState createState() => _TabBarSliverAppbarState();
}

class _TabBarSliverAppbarState extends State<TabBarSliverAppbar> 
  with SingleTickerProviderStateMixin{
    
    var database = Database();
    var tabController;

    @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }
  
  /*NestedScrollView - is a Wiget provided for a very particular 
  use-case - to put One Scrollable object inside another 
  (in most case - where the directions are not same).*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, i){
            return [
               SliverAppBar(
                 backgroundColor: Colors.black,
                 leading: IconButton(
                  icon: const Icon(Icons.menu_outlined),
                  onPressed: (){
                    },
                  splashRadius: 20.0,
               ),
                expandedHeight: 50.0,
                floating: false,
                pinned: false,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                ),
               ),
                 SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text:'Globally'),
                        Tab(text:'Locally')
                      ],
                        labelColor: Colors.white,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        unselectedLabelColor: Colors.white,
                        unselectedLabelStyle: GoogleFonts.poppins(
                          fontSize: 14
                        ),
                        indicatorColor: Colors.white70,
                    ),
                  ),
                  pinned: true,
               ), 
            ];
          }, 
          body: TabBarView(
            controller: tabController,
            children: [
              listGenerator(),
              listGenerator()
            ]
          )
        )
      )
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
    _SliverAppBarDelegate(this._tabBar);

    final TabBar _tabBar;

    @override
    double get minExtent => _tabBar.preferredSize.height;
    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(
        BuildContext context, double shrinkOffset, bool overlapsContent) {
      return new Container(
        color: Colors.black,
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
      return false;
    }
  }