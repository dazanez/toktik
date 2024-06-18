import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infrasctructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrasctructure/repositories/video_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository = VideoPostsRepositoryImpl(
      videosDataSource: LocalVideoPostsDataSourceImpl());
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: ((_) => DiscoverProvider(videosRepository: videoPostsRepository)..loadNextPage()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}
