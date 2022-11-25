import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_dengan_riverpod/todo_page.dart';

void main() {
  final addTodoInput = find.byKey(addTodoKey);
  final activeFilterButton = find.byKey(activeFilterKey);
  final firstItem = find.byKey(const Key('todo-0'));
  final firstCheckbox = find.descendant(
    of: firstItem,
    matching: find.byType(Checkbox),
  );
  final secondItem = find.byKey(const Key('todo-1'));
  final secondCheckbox = find.descendant(
    of: secondItem,
    matching: find.byType(Checkbox),
  );
  final thirdItem = find.byKey(const Key('todo-2'));
  final thirdCheckbox = find.descendant(
    of: thirdItem,
    matching: find.byType(Checkbox),
  );

  group(
    'Testing Ui todo',
    () {
      group(
        'Item todo pertama',
        () {
          testWidgets(
            'Testing item default pertama todo',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );

              expect(
                find.descendant(
                  of: firstItem,
                  matching: find.text('hi'),
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'Testing item checkbox value default nya false',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );
              expect(
                tester.widget(firstCheckbox),
                isA<Checkbox>().having(
                  (s) => s.value,
                  'value',
                  false,
                ),
              );
            },
          );
        },
      );

      group(
        'Item Todo Kedua',
        () {
          testWidgets(
            'Testign item default kedua todo',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );

              expect(
                find.descendant(
                  of: secondItem,
                  matching: find.text('hello'),
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'Testing item checkbox value defautlnya false',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );
              expect(
                tester.widget(secondCheckbox),
                isA<Checkbox>().having((s) => s.value, 'value', false),
              );
            },
          );
        },
      );

      group(
        'Item Todo Kedua',
        () {
          testWidgets(
            'Testing item default ketiga todo',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );

              expect(
                find.descendant(
                  of: thirdItem,
                  matching: find.text('bonjour'),
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'Testing item checkbox value defaultnya false',
            (tester) async {
              await tester.pumpWidget(
                ProviderScope(
                  child: MaterialApp(
                    home: TodoPage(),
                  ),
                ),
              );

              expect(
                tester.widget(thirdCheckbox),
                isA<Checkbox>().having(
                  (s) => s.value,
                  'value',
                  false,
                ),
              );
            },
          );
        },
      );
    },
  );
}
