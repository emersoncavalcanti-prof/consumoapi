import 'package:flutter/material.dart';
import 'package:flutter_api_rest2/data/http/exceptions.dart';
import 'package:flutter_api_rest2/data/models/produto_model.dart';
import 'package:flutter_api_rest2/data/models/repositories/produto_repository.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);
  final ValueNotifier<String> error = ValueNotifier('');

  ProdutoStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
    return null;
  }
}
