import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/post-details/data/repo/post_details_repo.dart';
import 'package:test_app/features/post-details/logic/post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  final PostDetailsRepo _postDetailsRepo;
  PostDetailsCubit(this._postDetailsRepo) : super(const PostDetailsState.initial());

  Future<void> getPost(int id) async {
    emit(const PostDetailsState.loading());

    final response = await _postDetailsRepo.getPosts(id);
    response.when(success: (postResponseModel) {
      emit(PostDetailsState.success(postResponseModel));
    }, failure: (e) {
      emit(PostDetailsState.error(e));
    });
  }
}
