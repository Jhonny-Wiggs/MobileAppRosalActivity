import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  final List<Map<String, dynamic>> _conversations = const [
    {
      'name': 'Alice Johnson',
      'message': 'Hey! Are you free this weekend?',
      'time': '2m ago',
      'unread': 3,
      'online': true,
    },
    {
      'name': 'Bob Smith',
      'message': 'The project looks great, good job!',
      'time': '15m ago',
      'unread': 1,
      'online': true,
    },
    {
      'name': 'Carol White',
      'message': 'Can you send me the report?',
      'time': '1h ago',
      'unread': 0,
      'online': false,
    },
    {
      'name': 'David Brown',
      'message': 'Meeting at 3pm confirmed.',
      'time': '2h ago',
      'unread': 0,
      'online': false,
    },
    {
      'name': 'Eva Martinez',
      'message': 'Thanks for your help yesterday!',
      'time': 'Yesterday',
      'unread': 0,
      'online': false,
    },
    {
      'name': 'Frank Lee',
      'message': 'Sounds good to me!',
      'time': 'Yesterday',
      'unread': 0,
      'online': true,
    },
    {
      'name': 'Grace Kim',
      'message': 'See you at the event!',
      'time': 'Mon',
      'unread': 0,
      'online': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: SearchBar(
            hintText: 'Search messages...',
            leading: const Icon(Icons.search),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),

        // Conversations list
        Expanded(
          child: ListView.separated(
            itemCount: _conversations.length,
            separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
            itemBuilder: (context, index) {
              final conv = _conversations[index];
              final hasUnread = (conv['unread'] as int) > 0;

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: colorScheme.primaryContainer,
                      child: Text(
                        (conv['name'] as String)[0],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    if (conv['online'] as bool)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                title: Text(
                  conv['name'] as String,
                  style: TextStyle(
                    fontWeight: hasUnread ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  conv['message'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: hasUnread
                        ? colorScheme.onSurface
                        : colorScheme.onSurface.withOpacity(0.6),
                    fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      conv['time'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: hasUnread ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    if (hasUnread) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${conv['unread']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
