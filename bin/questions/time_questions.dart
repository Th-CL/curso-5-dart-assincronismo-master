import 'dart:math';
import 'dart:io';

class SensorTemperatura {
  final Random _random = Random();

  double lerTemperatura() {
    return 20 + _random.nextDouble() * 15; // Temperatura entre 20°C e 35°C
  }
}

class TimeQuestions {
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  String question;
  DateTime date = DateTime.now();
  String autoBOT = 'AutoBOT:\n';
  bool isThisATimeQuestion = false;
  SensorTemperatura sensor = SensorTemperatura();

  TimeQuestions(this.question);

  bool isThisTime() {
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('Temperatura') ||
        question.contains('temperatura') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }

  timeQuestion() {
    if (question == hour) {
      String botAnswer = '$autoBOT Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(botAnswer);
    } else if (question == day) {
      String botAnswer = '$autoBOT Opa! hoje é dia : ${date.day}';
      print(botAnswer);
    } else if (question == year) {
      String botAnswer = '$autoBOT Opa! estamos em : ${date.year}';
      print(botAnswer);
    } else if (question.contains('temperatura') || question.contains('Temperatura')) {
      double temp = sensor.lerTemperatura();
      String botAnswer = '$autoBOT A temperatura agora está em: ${temp.toStringAsFixed(1)}°C';
      print(botAnswer);
    } else {
      unsure();
    }
  }

  unsure() {
    if (question.contains('horas') || question.contains('Horas')) {
      String botQuestion = '$autoBOT Não entendi, você quer saber das horas?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer = '$autoBOT Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(botAnswer);
      } else {
        String botAnswer = '$autoBOT Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {
      String botQuestion = '$autoBOT Não entendi, você quer saber que dia é hoje?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer = '$autoBOT Beleza, hoje é dia: ${date.day}';
        print(botAnswer);
      } else {
        String botAnswer = '$autoBOT Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {
      String botQuestion = '$autoBOT Não entendi, você quer saber em que ano estamos?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer = '$autoBOT Beleza, estamos no ano de 2077, a pandemia já está terminando... \n Brincadeirinha! estamos em : ${date.year}';
        print(botAnswer);
      } else {
        String botAnswer = '$autoBOT Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('temperatura') || question.contains('Temperatura')) {
      String botQuestion = '$autoBOT Não entendi, você quer saber a temperatura agora?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        double temp = sensor.lerTemperatura();
        String botAnswer = '$autoBOT Beleza, a temperatura agora é: ${temp.toStringAsFixed(1)}°C';
        print(botAnswer);
      } else {
        String botAnswer = '$autoBOT Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    }
  }
}

void main() {
  print('🤖 AutoBOT ligado! Pergunte algo sobre hora, dia, ano ou temperatura. Digite "sair" para encerrar.');
  while (true) {
    stdout.write('\nVocê: ');
    String? entrada = stdin.readLineSync();
    if (entrada == null || entrada.toLowerCase() == 'sair') {
      print('🤖 AutoBOT desligando. Até mais!');
      break;
    }
    TimeQuestions pergunta = TimeQuestions(entrada);
    if (pergunta.isThisTime()) {
      pergunta.timeQuestion();
    } else {
      print('AutoBOT: Ainda não sei responder isso 🤖');
    }
  }
}
