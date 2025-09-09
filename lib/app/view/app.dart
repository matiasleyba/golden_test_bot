import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key, @visibleForTesting this.home});

  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: home ?? const GmailInboxPage(),
    );
  }
}

class GmailInboxPage extends StatelessWidget {
  const GmailInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      MailItem(
        isRead: false,
        isImportant: true,
        conversationCount: 2,
      ),
      MailItem(isRead: false, isFavorite: true, conversationCount: 1),
      MailItem(isFavorite: true),
      MailItem(conversationCount: 1),
      MailItem(),
      MailItem(),
      MailItem(isImportant: true),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(height: 12),
              Text(
                'All inboxes',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inbox_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_rounded),
            label: '',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey.shade200,
        icon: const Icon(
          Icons.edit,
        ),
        label: const Text(
          'Compose',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        // coverage:ignore-start
        onPressed: () {},
        // coverage:ignore-end
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Text('Search in mail'),
          const Spacer(),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.redAccent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://media.licdn.com/dms/image/v2/D4D03AQFmrHwIsXlxOQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1732905928286?e=1758153600&v=beta&t=yQwMRSY-koziyCpstoyQ85z5Kvo-sCfV6mUFqZZUNYI',
                fit: BoxFit.cover,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MailItem extends StatelessWidget {
  const MailItem({
    super.key,
    this.isRead = true,
    this.isImportant = false,
    this.conversationCount = 0,
    this.isFavorite = false,
  });

  final bool isRead;
  final bool isImportant;
  final int conversationCount;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      titleAlignment: ListTileTitleAlignment.top,
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gmail_icon_%282020%29.svg/2560px-Gmail_icon_%282020%29.svg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isImportant)
            Icon(
              Icons.bookmark,
              color: Colors.yellow.shade700,
            ),
          Text(
            'Gmail Team',
            style: TextStyle(
              fontWeight: !isRead ? FontWeight.w700 : FontWeight.w400,
              color: !isRead ? Colors.black : Colors.grey,
            ),
          ),
          if (conversationCount > 0) ...[
            const SizedBox(width: 8),
            Text(
              '$conversationCount',
              style: TextStyle(
                fontSize: 12,
                fontWeight: !isRead ? FontWeight.w700 : FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        'Welcome to Gmail - Here are some tips to get you started',
        style: TextStyle(
          fontWeight: !isRead ? FontWeight.w700 : FontWeight.w400,
          color: !isRead ? Colors.black : Colors.grey,
        ),
      ),
      trailing: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sep 10',
              style: TextStyle(
                fontWeight: !isRead ? FontWeight.w700 : FontWeight.w400,
                color: !isRead ? Colors.black : Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.yellow.shade700 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
