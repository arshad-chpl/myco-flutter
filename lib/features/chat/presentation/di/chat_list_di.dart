
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/chat/data/datasources/chat_datasources.dart';
import 'package:myco_flutter/features/chat/data/datasources/chat_datasources_impl.dart';
import 'package:myco_flutter/features/chat/data/models/chat_list_model.dart';
import 'package:myco_flutter/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:myco_flutter/features/chat/domain/repositories/chat_repository.dart';
import 'package:myco_flutter/features/chat/domain/usecases/get_chat_list.dart';
import 'package:myco_flutter/features/chat/domain/usecases/get_group_chat_list.dart';
import 'package:myco_flutter/features/chat/domain/usecases/grt_member_chat_list.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_list_bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/group_chat_bloc/bloc/group_chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/member_chat_bloc.dart/bloc/member_chat_bloc.dart';

// final sl = GetIt.instance;

Future<void> initChatFeatureDI(GetIt sl) async {
  // Bloc
  sl.registerFactory(() => ChatListBloc(sl()));
  sl.registerFactory(() => GroupChatBloc(sl()));
  sl.registerFactory(() => MemberChatBloc(sl()));
  // UseCase
  sl.registerLazySingleton(() => GetChatList(sl()));
  sl.registerLazySingleton(() => GetGroupChatList(sl()));
  sl.registerLazySingleton(() => GetMemberChatList(sl()));

  // Repository
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<GroupChatRepository>(
    () => GroupChatRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<MemberChatRepository>(
    () => MemberChatRepositoryImpl(sl(), sl()),
  );
  // DataSource
  sl.registerLazySingleton<ChatDatasources>(
    () => ChatDatasourcesImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.residentApiNew),
    ),
  );
}
