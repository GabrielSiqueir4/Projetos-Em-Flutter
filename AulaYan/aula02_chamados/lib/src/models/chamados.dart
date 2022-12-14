import 'package:flutter/material.dart';

class Chamados{

  String? _nome;
  String? _descricao;
  DateTime? _dia;
  TimeOfDay? _hora;
  double? _duracao;
  String? _tipo;
  bool _importante = false;
  List<String> _materiais = <String>[];

  void set nome(String? nome){
    nome = _nome;
  }
  
  void set descricao(String? descricao){
    _descricao = descricao;
  } 

  void set dia (DateTime? dia){
    _dia = dia;
  }

  void set hora(TimeOfDay? hora){
    _hora = hora;
  }

  void set duracao (double? duracao){
    _duracao = duracao;
  }

  void set tipo (String? tipo){
    _tipo = tipo;
  }
  void set importante(bool importante){
    _importante = importante; 
  }

  void set materiais(List<String> materiais){
    _materiais = materiais;
  }

  String?  get nome => _nome;
  String?  get descricao => _descricao;
  DateTime?  get dia => _dia;
  TimeOfDay?  get hora => _hora;
  double?  get duracao => _duracao;
  String?  get tipo => _tipo;
  bool get importante => _importante;
  List<String> get materiais => _materiais; 

}