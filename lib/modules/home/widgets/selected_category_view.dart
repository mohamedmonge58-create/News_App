import 'package:flutter/material.dart';
import 'package:news/models/artical.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/source_model.dart';

import '../../../core/network/network_request_services.dart';
import 'ArticaleItem.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryModel selectedCategory;
  const SelectedCategoryView({super.key , required this.selectedCategory});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequestServices.getAllSources(widget.selectedCategory.id);
  }
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return FutureBuilder<List<Source>>(future: NetworkRequestServices.getAllSources(widget.selectedCategory.id),


        builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child:  CircularProgressIndicator(),);
      }
      if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()));


      }
      final sources = snapshot.data ?? [];
      return SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            DefaultTabController(length: sources.length,
        
        
                child: TabBar(
                    isScrollable: true,
                    onTap: (index) {
        
                        _selectedIndex = index;
        
                    },
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
        
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    dividerHeight: 4,
                    labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
        
                    unselectedLabelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
        
        
        
                    tabs: sources.map((e) => Tab(text: e.name,),).toList())),
            FutureBuilder<List<Artical>>(future: NetworkRequestServices.getAllArticles(sources[_selectedIndex].id),
        
                builder:  (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final artical = snapshot.data![index];
                      return ArticaleItem(artical: artical);
                    },
                  );
                } )],
        ),
      );


        });
  }
}
