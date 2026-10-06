import 'package:flutter/foundation.dart';
import '../model/category_model.dart';
import '../service/service.dart';
import 'ui_state.dart';

class HomeViewModel extends ChangeNotifier {
  final Service _repository;

  HomeViewModel(this._repository) {
    loadCategories();
  }

  UIState<List<CategoryModel>> _categoriesState = UIState.initial();
  UIState<List<CategoryModel>> get categoriesState => _categoriesState;

  Future<void> loadCategories() async {
    _categoriesState = UIState.loading();
    notifyListeners();

    try {
      final result = await _repository.getCategories();
      if (result.isEmpty) {
        _categoriesState = UIState.empty();
      } else {
        _categoriesState = UIState.success(result);
      }
    } catch (e) {
      _categoriesState = UIState.error('Failed to load categories. Please try again.');
    }
    notifyListeners();
  }
}