import 'package:flutter/material.dart';

main() => runApp(ToDoPi());

class ToDoPi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTarefa(),
      ),
    );
  }
}

class FormularioTarefa extends StatelessWidget {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Tarefa'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorTitulo,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration:
                  InputDecoration(labelText: 'Tarefa', hintText: 'Título'),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorDescricao,
              style: TextStyle(
                fontSize: 16.0,
              ),
              decoration:
                  InputDecoration(icon: Icon(Icons.description), labelText: 'Detalhes', hintText: 'Descrição'),
              keyboardType: TextInputType.text,
            ),
          ),
          RaisedButton(
            onPressed: () {
              String tituloTarefa = _controladorTitulo.text;
              String conteudoDescricao = _controladorDescricao.text;
              if (conteudoDescricao == null) {
                conteudoDescricao = '';
              }
              if (tituloTarefa != null) {
                //adicioanr a tarefa na lista de tarefas
              }
              debugPrint('$tituloTarefa');
              debugPrint('$conteudoDescricao');
            },
            child: Text('Adicionar'),
          )
        ],
      ),
    );
  }
}

class ListaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
      ),
      body: Column(
        children: <Widget>[
          ItemTarefa(Tarefa('Fazer MVP de Flutter',
              'O MVP de Flutter deve ser feito seguindo os padrões arara premium...')),
          ItemTarefa(Tarefa('Fazer exercícios físicos',
              'Às 22:00 deve-se começar com 1 hora de exercícios de calistenia, po...')),
          ItemTarefa(Tarefa('Fazer site Chevals',
              'O site da Chevals deve ser feito utilizando a tecnologia WordPress, para is...')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ItemTarefa extends StatelessWidget {
  Tarefa _tarefa;

  ItemTarefa(this._tarefa);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank),
        title: Text(_tarefa.titulo),
        subtitle: Text(_tarefa.descricao),
      ),
    );
  }
}

class Tarefa {
  final String titulo, descricao;

  Tarefa(this.titulo, this.descricao);
}
