//
// TabBar(
//
// controller: _tabController,
// tabs: [
// Tab(icon: Icon(Icons.arrow_back_rounded)),
// Tab(icon: Icon(Icons.arrow_forward)),
// Tab(icon: Icon(Icons.restart_alt)),
// Tab(icon: Icon(Icons.home)),
// Tab(icon: Icon(Icons.back_hand_outlined),
// )
// ],
// ),

// floatingActionButton: Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     SizedBox(
//       width: 10,
//     ),
//     FloatingActionButton(
//       onPressed: () async {
//         await Provider.of<WebProvider>(context, listen: false).back();
//       },
//       child: const Icon(
//         Icons.arrow_back_rounded,
//       ),
//     ),
//     FloatingActionButton(
//       onPressed: () async {
//         await Provider.of<WebProvider>(context, listen: false).forward();
//       },
//       child: const Icon(
//         Icons.arrow_forward,
//       ),),
//       FloatingActionButton(
//       onPressed: (){
//         Navigator.pop(context);
//       },
//       child: const Icon(
//         Icons.home_mini,
//       ),
//     ),
//     SizedBox(
//       width: 50,
//     ),
//     FloatingActionButton(
//       onPressed: () async {
//         await Provider.of<WebProvider>(context, listen: false).refresh();
//       },
//       child: const Icon(
//         Icons.restart_alt,
//       ),
//     ),
//     FloatingActionButton(
//       onPressed: () async {
//         await Provider.of<WebProvider>(context, listen: false)
//             .homePage(args.webURL);
//       },
//       child: const Icon(
//         Icons.home,
//       ),
//     ),
//   ],
// ),
