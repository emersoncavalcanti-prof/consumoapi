import 'dart:convert';

import 'package:flutter_api_rest2/data/http/exceptions.dart';
import 'package:flutter_api_rest2/data/http/http_client.dart';
import 'package:flutter_api_rest2/data/models/produto_model.dart';

abstract interface class IProdutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository {
  final IHttpClient cliente;

  ProdutoRepository({required this.cliente});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await cliente.get(
      url: 'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];
      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtos.add(produto);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw NotFoundException('Não foi possível carregar os produtos');
    }
  }
}
