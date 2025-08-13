import 'package:flutter/material.dart';
import 'package:laza/features/home/ui/widgets/screen_appbar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ScreenAppbar(title: 'Your Wishlist', backButton: false),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            // Implement wishlist using WishlistCubit
            // BlocBuilder<WishlistCubit, WishlistState>(
            //   builder: (context, state) {
            //     if (state is WishlistLoaded) {
            //       return ProductsSliverGridView(products: state.wishlistItems);
            //     } else if (state is WishlistError) {
            //       return SliverToBoxAdapter(
            //         child: Text(state.message),
            //       );
            //     } else {
            //       return const SliverToBoxAdapter(
            //         child: Center(child: CircularProgressIndicator()),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
