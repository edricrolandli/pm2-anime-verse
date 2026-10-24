import 'package:flutter/material.dart';

import '../models/anime.dart';

class AppStateProvider extends ChangeNotifier {

  // 1. STATE (Data Privat)
  // Ini adalah "Source of Truth" kita.
  // Data ini privat (diawali '_') agar tidak bisa diubah dari luar class.
  List<Anime> _favorites = [];

  // 2. GETTER (Akses Publik)
  // Widget lain hanya bisa 'mendapatkan' datanya, tidak bisa mengubah.
  List<Anime> get favorites => _favorites;

  // Helper function untuk mengecek apakah anime sudah ada di favorit
  bool isFavorite(String animeId) {
    return _favorites.any((anime) => anime.id == animeId);
  }

  // Method utama untuk menambah atau menghapus dari favorit
  void toggleFavorite(Anime anime) {
    if (isFavorite(anime.id)) {
      removeFavorite(anime.id);
    } else {
      addFavorite(anime);
    }
  }

  void addFavorite(Anime anime) {
    if (!isFavorite(anime.id)) {
      _favorites.add(anime);
      notifyListeners();
    }
  }

  void removeFavorite(String animeId) {
    _favorites.removeWhere((anime) => anime.id == animeId);
    notifyListeners();
  }
}
