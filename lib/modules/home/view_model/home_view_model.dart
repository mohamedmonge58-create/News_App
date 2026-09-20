
import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';

import '../../../core/network/network_request_services.dart';
import '../../../core/theme/app_assets.dart';
import '../../../models/artical.dart';
import '../../../models/category_model.dart';

class HomeViewModel  extends ChangeNotifier{
   int _selectedIndex = 0;
  CategoryModel? _selectedCategory;
  List<Source> _sourcesList = [];
  final List<CategoryModel> _categories = [
    CategoryModel(id: "general", name: "General", imagePath: AppAssets.general),
    CategoryModel(id: "business", name: "Business", imagePath: AppAssets.business),
    CategoryModel(id: "sports", name: "Sports", imagePath: AppAssets.sports),
    CategoryModel(id: "health", name: "Health", imagePath: AppAssets.health),
    CategoryModel(id: "entertainment", name: "Entertainment", imagePath: AppAssets.entertainment),
    CategoryModel(id: "technology", name: "Technology", imagePath: AppAssets.technology),
    CategoryModel(id: "science", name: "Science", imagePath: AppAssets.science),
  ];
  List<Artical> _articles = [];


  CategoryModel? get selectedCategory => _selectedCategory;
  List<CategoryModel> get categories => _categories;
  int get selectedIndex => _selectedIndex;
  List<Source> get sourcesList => _sourcesList;
  List<Artical> get articles => _articles;



void changeTab(int index){
  _selectedIndex = index;
  notifyListeners();
   getAllArticles();
}
void changeCategory(CategoryModel category) {
  _selectedCategory = category;
  notifyListeners();
}


  Future<void> getAllSources() async {

 final data = await NetworkRequestServices.getAllSources(
    _selectedCategory!.id,

  );
  _sourcesList = data;
  notifyListeners();
}

Future<void> getAllArticles() async {
  final data = await NetworkRequestServices.getAllArticles(
    _sourcesList[_selectedIndex].id
  );
  _articles = data;
  notifyListeners();
}
}




