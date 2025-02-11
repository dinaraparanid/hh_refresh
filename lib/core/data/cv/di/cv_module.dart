import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/data/cv/data_source/cv_store_impl.dart';
import 'package:hh_refresh/core/data/cv/repository/cv_repository_impl.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/core/domain/cv/data_store/cv_store.dart';
import 'package:hh_refresh/core/domain/cv/repository/cv_repository.dart';

extension CVModule on GetIt {
  List<Type> registerCVModule() => [
    provideSingleton<CVStore>(() => CVStoreImpl()),
    provideSingleton<CVRepository>(() => CVRepositoryImpl(store: this())),
  ];
}
