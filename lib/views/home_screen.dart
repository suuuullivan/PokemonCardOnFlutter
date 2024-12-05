import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/models/sets/set_info.dart';
import '../themes/app_color.dart';
import '../themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Collection',
          style: AppTheme.titleAppPokemon,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.cyan10,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search collection',
                        hintStyle: TextStyle(color: AppColor.darkCyan),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: AppColor.darkCyan),
                    onPressed: () {
                      print("Search icon pressed");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: FutureBuilder<List<SetInfo>>(
                future: apiService.fetchSetImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erreur : ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Aucun set trouvé.'));
                  } else {
                    final sets = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                      ),
                      itemCount: sets.length,
                      itemBuilder: (context, index) {
                        final set = sets[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (set.images?.logo != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.network(
                                    set.images!.logo,
                                    width: double.infinity,
                                    height: 70,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            else
                              Container(
                                height: 80,
                                child: Icon(Icons.image_not_supported),
                              ),
                            Container(
                              width: 200,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColor.mediumBlue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '0/${set.total ?? 0}',
                                    style: AppTheme.TextBottomBarOnCardAppPokemon
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
