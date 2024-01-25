part of 'image_widgets_library.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  const CachedNetworkImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            color: Theme.of(context).colorScheme.primary,
            value: progress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
          color: Theme.of(context).colorScheme.surface,
          child: const Icon(Icons.error)),
      fadeInDuration: const Duration(seconds: 1),
    );
  }
}
