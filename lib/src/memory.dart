class Memory {
  static const List<String> operations = [];

  String? _operation;

  bool _usedOperation = false;

  final _buffer = [0.0, 0.0];

  int _bufferIndex = 0;

  String result = '0';

  Memory() {
    _clear();
  }

  /// Deve ser possível iniciar todas os parametos da memoria;
  void _clear() {
    //TODO: reinicializar as propriedades da classe Memória
  }

  /// Aplica o comando específico para a nossa calculadora
  void applyCommand(String command) {
    //TODO: Aplicar os comandos e chamas as funções necessárias para a execução
  }

  void deleteEndDigit() {
    //TODO: Deletar o ultimo dígito exibido ou exibir '0' quando não tiver mais dígitos a serem apagados
  }

  void _addDigit(String digit) {
    //TODO: Adicionar um digito e exibir no display
  }

  void _setOperation(String operation) {
    //TODO: Definir qual operador esta sendo selecionado e marcar _usedOperation = true, verificar se o operação é '=' e chamar o calculate
  }

  // double _calculate() {
  //   //TODO: Realizar as operações básicas de matemática e exibir o resultado no display
  // }
}
