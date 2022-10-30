// import '../configurations.dart';
// import '../models/categories_data.dart';
// import '../widgets/menu_widget.dart';

// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   static const categoriesData = [
//     mobile,
//     laptop,
//     camera,
//     tv,
//     home,
//     music,
//     book,
//     game
//   ];

//   int catIndex = 0;
//   bool tap = false;
//   List selectedCategory = categoriesData[0];

//   Widget itemCard(index, List selectedCategory) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(10, 30, 10, 18),
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       height: 500,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.network(
//             selectedCategory[index]['image'] as String,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(selectedCategory[index]['title'] as String,
//                   style: const TextStyle(
//                       fontSize: 15, fontWeight: FontWeight.bold)),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '\$${selectedCategory[index]["Amount"]}',
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const Icon(Icons.favorite_border_sharp)
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget catRow(String key, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               selectedCategory = categoriesData[index];
//               catIndex = index;
//               (tap && index != catIndex) ? tap = false : tap = true;
//             });
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             height: 50,
//             width: 50,
//             margin: const EdgeInsets.fromLTRB(0, 20, 30, 15),
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey[350]!,
//                       blurRadius: 30,
//                       offset: const Offset(0, 10))
//                 ],
//                 color: ((tap && index == catIndex))
//                     ? const Color(0xff416d6d)
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(
//               categories[key]!,
//               color: ((tap && index == catIndex))
//                   ? Colors.white
//                   : const Color(0xff416d6d),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 50,
//           child: Text(
//             key,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           actions: [
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               height: 10,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: const Color(0xff416d6d),
//                   borderRadius: BorderRadius.circular(5)),
//               child: const Center(
//                   child: Text(
//                 "M",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               )),
//             ),
//           ],
//           backgroundColor: Colors.white,
//           leading: const MenuWidget(),
//           centerTitle: true,
//         ),
//         body: Container(
//           padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.grey[50],
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//           ),
//           child: CustomScrollView(
//             physics: const BouncingScrollPhysics(),
//             slivers: [
//               const SliverToBoxAdapter(
//                 child: Text(
//                   "Categories",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                   child: SizedBox(
//                 height: 120,
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.length,
//                     itemBuilder: ((context, index) {
//                       if (index == 0) {
//                         tap = true;
//                       }
//                       String key = categories.keys.elementAt(index);
//                       return catRow(key, index);
//                     })),
//               )),
//               SliverGrid(
//                 delegate: SliverChildBuilderDelegate(((context, index) {
//                   return itemCard(index, selectedCategory);
//                 }), childCount: categoriesData.length),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     childAspectRatio: 2 / 4,
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 20,
//                     crossAxisSpacing: 15),
//               )
//             ],
//           ),
//         ));
//   }
// }



// import 'package:flutter/material.dart';
// import '../configurations.dart';
// import '../models/categories_data.dart';
// import '../widgets/menu_widget.dart';

// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   int? catIndex;
//   bool tap = false;

//   Widget itemCard(index){
//     return Container(
//                         padding: const EdgeInsets.fromLTRB(10, 30, 10, 18),
//                         decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20))),
//                         height: 500,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.network(
//                               mobile[index]['image'] as String,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(mobile[index]['title'] as String,
//                                     style: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold)),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       '\$${mobile[index]["Amount"]}',
//                                       style: const TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const Icon(Icons.favorite_border_sharp)
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//   }
//   Widget catRow(String key, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           splashColor: const Color(0xff416d6d),
//           onTap: () {
//             setState(() {
//               catIndex = index;
//               (tap && index != catIndex) ? tap = false : tap = true;
//             });
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             height: 50,
//             width: 50,
//             margin: const EdgeInsets.fromLTRB(0, 20, 30, 15),
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey[350]!,
//                       blurRadius: 30,
//                       offset: const Offset(0, 10))
//                 ],
//                 color: (tap && index == catIndex)
//                     ? const Color(0xff416d6d)
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(
//               categories[key]!,
//               color: (tap && index == catIndex)
//                   ? Colors.white
//                   : const Color(0xff416d6d),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 50,
//           child: Text(
//             key,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           actions: [
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               height: 10,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: Colors.grey, borderRadius: BorderRadius.circular(5)),
//             ),
//           ],
//           backgroundColor: Colors.white,
//           leading: const MenuWidget(),
//           centerTitle: true,
//         ),
//         body: Container(

//           padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           width: double.infinity,
//           // height: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.grey[50],
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Categories",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.length,
//                     itemBuilder: ((context, index) {
//                       String key = categories.keys.elementAt(index);

//                       return catRow(key, index);
//                     })),
//               ),
//               Flexible(
//                 flex: 4,
//                 child: GridView.builder(
//                   // physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: mobile.length,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 2 / 4,
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 20,
//                         crossAxisSpacing: 15),
//                     itemBuilder: ((context, index) {
//                       return itemCard(index);
//                     })),
//               )
//             ],
//           ),
//         ));
//   }
// }



  // Widget counterButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.grey[100],
  //         borderRadius: const BorderRadius.all(Radius.circular(30))),
  //     child: Row(
  //       children: [
  //         IconButton(
  //           onPressed: () {
  //             setState(() {
  //               if (numOfProducts != 0) {
  //                 numOfProducts = numOfProducts - 1;
  //               }
  //             });
  //           },
  //           icon: const Icon(
  //             Icons.remove,
  //           ),
  //         ),
  //         Text(
  //           '$numOfProducts',
  //           style: const TextStyle(fontSize: 20),
  //         ),
  //         IconButton(
  //           onPressed: () {
  //             setState(() {
  //               numOfProducts = numOfProducts + 1;
  //             });
  //           },
  //           icon: const Icon(Icons.add),
  //         ),
  //       ],
  //     ),
  //   );
  // }



