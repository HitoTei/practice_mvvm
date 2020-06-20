abstract class EditorViewModel {
  Future<void> save();
  String getContents();
  void setContents(String contents);
}
