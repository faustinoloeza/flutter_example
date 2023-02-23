import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:maxiapp/models/user.dart';

class ApiServices {
  //ApiServices(String user);
  String user = 'faustinoloeza';
  String endpoint = 'https://api.github.com/users/faustinoloeza';

  Future<User> getUserInfo() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return res.map(((e) => User(
          login: res.login,
          id: res.id,
          nodeId: res.nodeId,
          avatarUrl: res.avatarUrl,
          gravatarId: res.gravatarId,
          url: res.url,
          htmlUrl: res.htmlUrl,
          followersUrl: res.followersUrl,
          followingUrl: res.followingUrl,
          gistsUrl: res.gistsUrl,
          starredUrl: res.starredUrl,
          subscriptionsUrl: res.subscriptionsUrl,
          organizationsUrl: res.organizationsUrl,
          reposUrl: res.reposUrl,
          eventsUrl: res.eventsUrl,
          receivedEventsUrl: res.receivedEventsUrl,
          type: res.type,
          siteAdmin: res.siteAdmin,
          name: res.name,
          blog: res.blog,
          location: res.location,
          publicRepos: res.publicRepos,
          publicGists: res.publicGists,
          followers: res.followers,
          following: res.following,
          createdAt: res.createdAt,
          updatedAt: res.updatedAt)));
    } else {
      throw Exception(response
          .reasonPhrase); //print('Request failed with status: ${response.statusCode}.');
    }
  }
}
