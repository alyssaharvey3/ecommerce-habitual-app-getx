import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core_export.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          fit: BoxFit.cover,
          placeholder: (_, url) => Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(
                AppColors.neutral800,
              ),
            ),
          ),
        ),
      ),
    );
    // return const Center(
    //   child: SizedBox(
    //     width: 73,
    //     height: 73,
    //     child: CircleAvatar(
    //       radius: 100,
    //       backgroundImage: CachedNetworkImageProvider(
    //         'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //       ),
    //     ),
    //   ),
    // );
  }
}
