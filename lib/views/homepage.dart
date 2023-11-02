import 'package:flutter/material.dart';
import 'package:mirror_wall/model/tab_list.dart';

class HomePage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mirror Wall'),
        bottom: TabBar(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),

          dividerColor: Colors.black,
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(text: 'Entertainment'),
            Tab(text: 'Educational'),
            Tab(text: 'Search'),
            Tab(text: 'Govt. Services'),
            Tab(text: 'Example'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tablist,
      ),
    );
  }
}
