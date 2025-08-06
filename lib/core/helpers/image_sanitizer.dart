String sanitizeImageUrl(String? url) {
  // Default fallback image (PNG)
  const fallbackImage = 'https://placehold.co/600x400.png';

  // Null or empty check
  if (url == null || url.trim().isEmpty) {
    return fallbackImage;
  }

  final lowerUrl = url.toLowerCase();

  // Replace SVG from Placehold or similar with PNG
  if (lowerUrl.endsWith('.svg') || lowerUrl.contains('placehold.co')) {
    return lowerUrl.replaceAll('.svg', '.png') +
        (lowerUrl.contains('.png') ? '' : '.png');
  }

  // Return as-is if it looks valid
  return url;
}
