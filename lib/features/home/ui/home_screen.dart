import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/home/logic/posts_cubit.dart';
import 'package:test_app/features/home/logic/posts_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      buildWhen: (previous, current) => current is Loading || current is Success || current is Error,
      builder: (context, state){
       return state.maybeWhen(
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          success: (responePosts) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: responePosts.length,
              itemBuilder: (context, index) {
                final post = responePosts[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title??'',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.body??'',
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error) {
            return Center(
              child: Text(
                'Error: $error',
                style: const TextStyle(color: Colors.red),
              ),
            );          },
           orElse: () {
            return const SizedBox(); // safe fallback
          },
        );
      },
    );
  }
}
