class DynamicSize {
  static double getDynamicSize<T>(double standard, List<T> items, double maxListHeight) {
    final itemHeight = standard;
    return items.length * itemHeight > maxListHeight ? maxListHeight : items.length * itemHeight.toDouble();
  }
}
