import 'base_url.dart' as BASE_URL;

class _Login {
  final auth = BASE_URL.auth;
}

class _MinhaLista {
  final list = BASE_URL.base + "/api/Gerenciador/intimacoes?pagina=PARAM_PAGINA_FILTRO&filtrando=true&jsonPaginacaoDetalhe=";
}

final login = _Login();
final intimacao = _MinhaLista();
