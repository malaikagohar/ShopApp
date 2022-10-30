// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/configurations.dart';
// import '../providers/product.dart';
// import '../providers/products.dart';

// class EditProductScreen extends StatefulWidget {
//   static const routeName = '/edit-product';

//   const EditProductScreen({Key? key}) : super(key: key);
//   @override
//   State<EditProductScreen> createState() => _EditProductScreenState();
// }

// class _EditProductScreenState extends State<EditProductScreen> {
//   final _priceFocusNode = FocusNode();
//   final _titleFocusNode = FocusNode();

//   final _descriptionFocusNode = FocusNode();
//   final _imageUrlController = TextEditingController();
//   final _categoryController = TextEditingController();
//   final _imageUrlFocusNode = FocusNode();
//   final _form = GlobalKey<FormState>();
//   final _isInit = true;
//   var _isLoading = false;
//   var _editedProduct =
//       Product(id: '', title: '', price: 0, description: '', imageUrl: '',category: '');
//   var _initValues = {
//     'title': '',
//     'description': '',
//     'price': '',
//     'imageUrl': '',
//     'category':''
//   };

//   @override
//   void initState() {
//     _imageUrlFocusNode.addListener(_updateImageUrl);
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       final productId = ModalRoute.of(context)!.settings.arguments;
//       if (productId != null) {
//         _editedProduct = Provider.of<Products>(context, listen: false)
//             .findById(productId as String);
//         _initValues = {
//           'title': _editedProduct.title,
//           'description': _editedProduct.description,
//           'price': _editedProduct.price.toString(),
//           'imageUrl': '',
//           'category': ''
//         };
//         _categoryController.text = _editedProduct.category;
//         _imageUrlController.text = _editedProduct.imageUrl;
//       }
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     _imageUrlController.removeListener(_updateImageUrl);
//     _priceFocusNode.dispose();
//     _descriptionFocusNode.dispose();
//     _imageUrlController.dispose();
//     _imageUrlFocusNode.dispose();
//     _categoryController.dispose();
//     _titleFocusNode.dispose();
//     super.dispose();
//   }

//   void _updateImageUrl() {
//     if (!_imageUrlFocusNode.hasFocus) {
//       if ((!_imageUrlController.text.startsWith('http') &&
//               !_imageUrlController.text.startsWith('https')) ||
//           (!_imageUrlController.text.endsWith('.png') && 
//               !_imageUrlController.text.endsWith('.jpg') &&
//               !_imageUrlController.text.endsWith('.jpeg') && !_imageUrlController.text.endsWith('.gif'))) {
//         return;
//       }

//       setState(() {});
//     }
//   }

//   Future<void> _saveForm() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final isValid = _form.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _form.currentState!.save();

//     // ignore: unnecessary_null_comparison
//     if (_editedProduct.id != null && _editedProduct.id != '') {
//       await Provider.of<Products>(context, listen: false)
//           .updateProduct(_editedProduct.id, _editedProduct);
//     } else {
//       try {
//         await Provider.of<Products>(context, listen: false)
//             .addProduct(_editedProduct, _categoryController.text.trim());
//       } catch (error) {
//         // print(error);
//         await showDialog<void>(
//             context: context,
//             builder: (ctx) => AlertDialog(
//                   title: const Text('An error occurred!'),
//                   content: Text(error.toString()),
//                   actions: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(ctx).pop();
//                         },
//                         child: const Text('Go back'))
//                   ],
//                 ));
//         throw error;

//       }
//     }
//     setState(() {
//       _isLoading = false;
//     });
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Product'),
//         actions: [
//           TextButton(
//               onPressed: _saveForm,
//               child: const Text(
//                 "DONE",
//                 style: TextStyle(color: Colors.white),
//               )),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16),
//               child: Form(
//                 key: _form,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                        TextFormField(
//                         controller: _categoryController,
//                         decoration: const InputDecoration(labelText: 'Category'),
//                         textInputAction: TextInputAction.next,
//                         onFieldSubmitted: (_) => FocusScope.of(context)
//                             .requestFocus(_titleFocusNode),
//                         onSaved: (value) {
//                           _editedProduct = Product(
//                             id: _editedProduct.id,
//                             title: value!,
//                             description: _editedProduct.description,
//                             price: _editedProduct.price,
//                             imageUrl: _editedProduct.imageUrl,
//                             category: value,
//                             isFavorite: _editedProduct.isFavorite,
//                           );
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Empty field!';
//                           }
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         initialValue: _initValues['title'],
//                         decoration: const InputDecoration(labelText: 'Title'),
//                         textInputAction: TextInputAction.next,
//                         onFieldSubmitted: (_) => FocusScope.of(context)
//                             .requestFocus(_priceFocusNode),
//                         onSaved: (value) {
//                           _editedProduct = Product(
//                             id: _editedProduct.id,
//                             title: value!,
//                             description: _editedProduct.description,
//                             price: _editedProduct.price,
//                             imageUrl: _editedProduct.imageUrl,
//                             category: _editedProduct.category,
//                             isFavorite: _editedProduct.isFavorite,
//                           );
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Empty field!';
//                           }
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         initialValue: _initValues['price'],
//                         decoration: const InputDecoration(labelText: 'Price'),
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         focusNode: _priceFocusNode,
//                         onFieldSubmitted: (_) => FocusScope.of(context)
//                             .requestFocus(_descriptionFocusNode),
//                         onSaved: (value) {
//                           _editedProduct = Product(
//                               id: _editedProduct.id,
//                               title: _editedProduct.title,
//                               description: _editedProduct.description,
//                               price: double.parse(value!),
//                               imageUrl: _editedProduct.imageUrl,
//                               category: _editedProduct.category,
//                               isFavorite: _editedProduct.isFavorite);
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Empty field!';
//                           }
//                           if (double.tryParse(value) == null ||
//                               double.parse(value) < 0) {
//                             return 'Invalid input!';
//                           }
//                           if (double.parse(value) == 0) {
//                             return 'Price should be greater than 0.';
//                           }
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         initialValue: _initValues['description'],
//                         decoration:
//                             const InputDecoration(labelText: 'Description'),
//                         maxLines: 3,
//                         keyboardType: TextInputType.multiline,
//                         focusNode: _descriptionFocusNode,
//                         onSaved: (value) {
//                           _editedProduct = Product(
//                               id: _editedProduct.id,
//                               title: _editedProduct.title,
//                               description: value!,
//                               price: _editedProduct.price,
//                               imageUrl: _editedProduct.imageUrl,
//                               category: _editedProduct.category,
//                               isFavorite: _editedProduct.isFavorite);
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Empty field!';
//                           }
//                           if (value.length < 10) {
//                             return 'Should be atleast 10 characters long';
//                           }
//                           return null;
//                         },
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Container(
//                               width: 100,
//                               height: 100,
//                               margin: const EdgeInsets.only(top: 8, right: 10),
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(width: 1, color: Colors.grey)),
//                               child: _imageUrlController.text.isEmpty
//                                   ? const Text('Enter a URL')
//                                   : FittedBox(
//                                       child: Image.network(
//                                       _imageUrlController.text,
//                                       fit: BoxFit.cover,
//                                     ))),
//                           Expanded(
//                             child: TextFormField(
//                               decoration:
//                                   const InputDecoration(labelText: 'Image URL'),
//                               keyboardType: TextInputType.url,
//                               textInputAction: TextInputAction.done,
//                               controller: _imageUrlController,
//                               focusNode: _imageUrlFocusNode,
//                               onEditingComplete: () {
//                                 setState(() {});
//                               },
//                               onFieldSubmitted: (_) {
//                                 _saveForm();
//                               },
//                               onSaved: (value) {
//                                 _editedProduct = Product(
//                                     id: _editedProduct.id,
//                                     title: _editedProduct.title,
//                                     description: _editedProduct.description,
//                                     price: _editedProduct.price,
//                                     imageUrl: value!,
//                                     category: _editedProduct.category,
//                                     isFavorite: _editedProduct.isFavorite);
//                               },
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Empty field!';
//                                 }
//                                 if (!value.startsWith('http') &&
//                                     !value.startsWith('https')) {
//                                   return 'Invalid URL!';
//                                 }
//                                 if (!value.endsWith('.png') &&
//                                     !value.endsWith('.jpg') &&
//                                     !value.endsWith('.jpeg') &&
//                                     !value.endsWith('.gif')
//                                     ) {
//                                   return 'Invalid URL';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }
