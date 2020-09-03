import 'package:flutter_study/generated/json/bank_entity_helper.dart';
import 'package:flutter_study/generated/json/city_entity_helper.dart';
import 'package:flutter_study/generated/json/search_entity_helper.dart';
import 'package:flutter_study/generated/json/user_entity_helper.dart';
import 'package:flutter_study/pages/account/models/bank_entity.dart';
import 'package:flutter_study/pages/account/models/city_entity.dart';
import 'package:flutter_study/pages/order/models/search_entity.dart';
import 'package:flutter_study/pages/shop/models/user_entity.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case BankEntity:
        return bankEntityFromJson(data as BankEntity, json) as T;
      case CityEntity:
        return cityEntityFromJson(data as CityEntity, json) as T;
      case UserEntity:
        return userEntityFromJson(data as UserEntity, json) as T;
      case SearchEntity:
        return searchEntityFromJson(data as SearchEntity, json) as T;
      case SearchItem:
        return searchItemFromJson(data as SearchItem, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case BankEntity:
        return bankEntityToJson(data as BankEntity);
      case CityEntity:
        return cityEntityToJson(data as CityEntity);
      case UserEntity:
        return userEntityToJson(data as UserEntity);
      case SearchEntity:
        return searchEntityToJson(data as SearchEntity);
      case SearchItem:
        return searchItemToJson(data as SearchItem);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'BankEntity':
        return BankEntity().fromJson(json);
      case 'CityEntity':
        return CityEntity().fromJson(json);
      case 'UserEntity':
        return UserEntity().fromJson(json);
      case 'SearchEntity':
        return SearchEntity().fromJson(json);
      case 'SearchItem':
        return SearchItem().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'BankEntity':
        return List<BankEntity>();
      case 'CityEntity':
        return List<CityEntity>();
      case 'UserEntity':
        return List<UserEntity>();
      case 'SearchEntity':
        return List<SearchEntity>();
      case 'SearchItem':
        return List<SearchItem>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
