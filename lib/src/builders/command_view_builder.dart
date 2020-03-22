//import 'package:bookshop/src/models/book.dart';
//import 'package:flutter/material.dart';
//
//import '../command_module.dart';
//
//class CommandViewBuilder extends StatefulWidget{
//  final String text;
//  CommandViewBuilder(this.text);
//  @override
//  State<StatefulWidget> createState() => _CommandViewBuilderState(text);
//
//}
//
//class _CommandViewBuilderState extends State<CommandViewBuilder> {
//  final String text;
//  _CommandViewBuilderState(this.text);
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(builder: _builder, future: CommandModule(context).sendCommandResponse(text));
//  }
//
//  Widget _builder(BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
//    if (snapshot.connectionState == ConnectionState.done && snapshot.data.length > 1){
//      return Container();
//    }else{
//      return LinearProgressIndicator();
//    }
//  }
//}
//

