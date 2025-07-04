import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/features/home/data/models/category_model.dart';
import 'package:laza/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit(this.homeRepo) : super(CategoriesState.initial());

  Future<void> getCategories() async {
    emit(CategoriesState.loading());
    final result = await homeRepo.getCategories();
    switch (result) {
      case Success(data: final categories):
        emit(CategoriesState.success(categories));
        break;
      case Failure():
        emit(
          CategoriesState.error(
            error: result.errorHandler.apiErrorModel.message!,
          ),
        );
        break;
    }
  }
}
