import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frontend glossary',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> testData = [
    {
      'topic': 'HTML',
      'icon': Icons.html,
      'questions': [
        {
          'question': 'Что такое HTML?',
          'answer':
              'HTML (HyperText Markup Language) - это язык разметки для создания веб-страниц.'
        },
        {
          'question': 'Что такое тег в HTML?',
          'answer':
              'Тег - это элемент языка HTML, который определяет структуру и содержание элемента веб-страницы.'
        },
        {
          'question': 'Как создать заголовок в HTML?',
          'answer':
              'Заголовок создается с помощью тега <h1> (для наибольшего заголовка) и закрывается с помощью </h1>.'
        },
        // Другие вопросы и ответы...
      ]
    },
    {
      'topic': 'CSS',
      'icon': Icons.style,
      'questions': [
        {
          'question': 'Что такое CSS?',
          'answer':
              'CSS (Cascading Style Sheets) - это язык стилей, используемый для стилизации веб-страниц.'
        },
        {
          'question': 'Как применить CSS к HTML?',
          'answer':
              'CSS можно применить к HTML с помощью внешних таблиц стилей, внутренних стилей или встроенных стилей.'
        },
        {
          'question': 'Как изменить цвет текста с помощью CSS?',
          'answer':
              'Цвет текста можно изменить с помощью свойства color, например: color: red; изменит цвет текста на красный.'
        },
        // Другие вопросы и ответы...
      ]
    },
    {
      'topic': 'JavaScript',
      'icon': Icons.code,
      'questions': [
        {
          'question': 'Что такое JavaScript?',
          'answer':
              'JavaScript - это высокоуровневый язык программирования, который применяется для создания интерактивных веб-страниц.'
        },
        {
          'question': 'Как объявить переменную в JavaScript?',
          'answer':
              'Переменная объявляется с помощью ключевого слова var, let или const, например: var x = 5;.'
        },
        {
          'question': 'Что такое оператор if в JavaScript?',
          'answer':
              'Оператор if используется для выполнения блока кода, если заданное условие истинно.'
        },
        // Другие вопросы и ответы...
      ]
    },
    // Другие темы...
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Поиск...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    // Напишите функционал для обработки сброса поиска
                  });
                },
                icon: Icon(Icons.clear),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Справочник'),
              Tab(text: 'Избранное'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: testData.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: Icon(testData[index]['icon']),
                  title: Text(testData[index]['topic']),
                  children: (testData[index]['questions'] as List<dynamic>)
                      .map<Widget>((qna) {
                    return ListTile(
                      title: Text(qna['question']),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(qna['question'], qna['answer']),
                        ));
                      },
                    );
                  }).toList(),
                );
              },
            ),
            // Добавьте вашу страницу избранного сюда
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String question;
  final String answer;

  DetailsScreen(this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(question),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(answer),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                );
              },
              child: Text('Добавить в избранное'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, String>> favorites = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favorites[index]['question']!),
          subtitle: Text(favorites[index]['answer']!),
        );
      },
    );
  }

  void addFavorite(String question, String answer) {
    setState(() {
      favorites.add({'question': question, 'answer': answer});
    });
  }
}
