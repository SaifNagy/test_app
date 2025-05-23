import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/post-details/logic/post_details_cubit.dart';
import 'package:test_app/features/post-details/logic/post_details_state.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Post Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            backgroundColor: Colors.lightBlue.shade50,
            centerTitle: true,
            elevation: 2,
          ),
          body: state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (post) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    post.body ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            error: (message) => Center(
              child: Text(
                'Error: $message',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }
}
