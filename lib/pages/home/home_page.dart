import 'package:flutter/material.dart';
import 'package:flutter_api_rest2/data/http/http_client.dart';
import 'package:flutter_api_rest2/data/models/repositories/produto_repository.dart';
import 'package:flutter_api_rest2/pages/home/stores/produto_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProdutoStore store =
      ProdutoStore(repository: ProdutoRepository(cliente: DioClient()));

  @override
  void initState() {
    super.initState();
    store.getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumindo API'),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.error,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.error.value.isNotEmpty) {
            return Center(
              child: Text(store.error.value),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text('Nenhum item na lista'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 23,
                  )),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final item = store.state.value[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        item.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(item.title),
                      subtitle: Column(children: [
                        Text('R\$ ${item.price}'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(item.description),
                      ]),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
