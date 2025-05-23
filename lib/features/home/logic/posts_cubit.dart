
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/home/data/repo/posts_repo.dart';
import 'package:test_app/features/home/logic/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  PostsCubit(this._postsRepo) : super(const PostsState.initial());

  void emitGetPosts() async {
    emit(const PostsState.loading());
    final response = await _postsRepo.getPosts();
    response.when(success: (postsResponse) {
      emit(PostsState.success(postsResponse));
    }, failure: (error) {
      emit(PostsState.error(error));
    });
  }
}
