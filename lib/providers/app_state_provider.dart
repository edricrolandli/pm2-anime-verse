import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/anime.dart';

class AppStateProvider extends ChangeNotifier {

  // 1. STATE (Data Privat)
  // Ini adalah "Source of Truth" kita.
  // Data ini privat (diawali '_') agar tidak bisa diubah dari luar class.
  List<Anime> _favorites = [];
  static const String _storageKey = 'favorite_anime_list'; // Kunci penyimpanan

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
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String animeId) {
    _favorites.removeWhere((anime) => anime.id == animeId);
    _saveFavorites();
    notifyListeners();
  }

  AppStateProvider() {
    _loadFavorites(); // Panggil _loadFavorites saat provider dibuat
  }

  // Simpan daftar favorit ke SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // 1. Konversi List<Anime> menjadi List<Map<String, dynamic>>
      final List<Map<String, dynamic>> favoritesJson = _favorites.map((anime) {
        return {
          'id': anime.id,
          'title': anime.title,
          'imagePath': anime.imagePath,
          'genre': anime.genre,
          'rating': anime.rating,
          'totalEpisodes': anime.totalEpisodes,
          'description': anime.description,
        }; // Sertakan semua properti yang ingin disimpan
      }).toList();
      // Encode List<Map> menjadi String JSON dan Simpan String JSON ke SharedPreferences
      await prefs.setString(_storageKey, json.encode(favoritesJson));
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  /// Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // 1. Baca String JSON dari SharedPreferences
      final String? favoritesJson = prefs.getString(_storageKey);

      if (favoritesJson != null) {
        // 2. Decode String JSON menjadi List<dynamic> (List of Maps)
        final List<dynamic> decoded = json.decode(favoritesJson);
        // 3. Konversi List<dynamic> menjadi List<Anime>
        _favorites = decoded.map((item) {
          // Pastikan semua properti di-handle
          return Anime(
            id: item['id'],
            title: item['title'],
            imagePath: item['imagePath'],
            genre: item['genre'],
            rating: item['rating'],
            totalEpisodes: item['totalEpisodes'],
            description: item['description'],
          );
        }).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }
}
