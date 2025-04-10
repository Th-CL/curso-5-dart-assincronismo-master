void main (){

  Future myFuture = Future((){
    print('Nos estamos indo de volta para o futuro');
    return 21;
  });

  print('A main foi terminada');
}