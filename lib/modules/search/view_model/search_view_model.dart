import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/models/artical.dart';
import '../../../core/network/network_request_services.dart';

enum SearchStatus { initial, loading, success, empty, error }

class SearchViewModel extends ChangeNotifier {
  Timer? _debounce;
  SearchStatus _status = SearchStatus.initial;
  List<Artical> _results = [];
  List<Artical> _defaultArticles = [];
  String? _errorMessage;

  SearchStatus get status => _status;
  List<Artical> get results => _results;
  String? get errorMessage => _errorMessage;

  void setDefaultArticles(List<Artical> articles) {
    _defaultArticles = articles;
    _results = articles;
    _status = articles.isEmpty ? SearchStatus.empty : SearchStatus.success;
    notifyListeners();
  }

  void queryChanged(String query) {
    _debounce?.cancel();

    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      _results = _defaultArticles;
      _status = _defaultArticles.isEmpty
          ? SearchStatus.empty
          : SearchStatus.success;
      notifyListeners();
      return;
    }

    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => _search(trimmed),
    );
  }

  Future<void> _search(String query) async {
    _status = SearchStatus.loading;
    notifyListeners();

    try {
      final data = await NetworkRequestServices.searchArticles(query);
      _results = data;
      _status = data.isEmpty ? SearchStatus.empty : SearchStatus.success;
    } catch (e) {
      _errorMessage = e.toString();
      _status = SearchStatus.error;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
