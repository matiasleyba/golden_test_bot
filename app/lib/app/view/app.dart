import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const GmailInboxPage(),
    );
  }
}

class GmailInboxPage extends StatelessWidget {
  const GmailInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gmail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15,
              child: Text('A'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(
              child: Text('G'),
            ),
            title: Text('Gmail Team'),
            subtitle: Text(
                'Welcome to Gmail - Here are some tips to get you started'),
            trailing: Text('Dec 31'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
