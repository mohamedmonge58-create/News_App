import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/artical.dart';

import '../../models/source_model.dart';
import 'end_points.dart';
import 'network_constant.dart';

class NetworkRequestServices {
  NetworkRequestServices._();

 static Future<List<Source>> getAllSources( String categoryID) async{
    final response = await http.get(Uri.https(
    NetworkConstant.baseUrl,
    EndPoints.allSources,
    {'apiKey': NetworkConstant.apiKey , 'category' : categoryID},
  ));
  final decodedResponse =jsonDecode(response.body);
    final  data = SourceModel.fromJson(decodedResponse);
    return data.sources;

  }


   static Future<List<Artical>> getAllArticles( String sourceID) async{

    final response = await http.get(Uri.https(
      NetworkConstant.baseUrl,
      EndPoints.allArticles,
      {'apiKey': NetworkConstant.apiKey ,
        'sources' : sourceID,},
    ));
    final decodedResponse =jsonDecode(response.body);
    List<Artical> articales = [];

    for (var articale in decodedResponse['articles']) {

      final Artical data = Artical.fromJson(articale);
      articales.add(data);
    }
    return articales;

  }



}

