import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../data/data.dart';
import '../cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  // double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        // setState(() {
        //   _scrollOffset = _scrollController.offset;
        // });
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey('myList'),
                title: 'my list',
                contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'originals',
              contentList: originals,
              isOriginal: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('trending'),
                title: 'trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
