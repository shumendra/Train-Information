class TrainInfoModel {
  final bool? status;
  final String? message;
  final int? timestamp;
  final Data? data;

  TrainInfoModel({
    this.status,
    this.message,
    this.timestamp,
    this.data,
  });

  TrainInfoModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        timestamp = json['timestamp'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'timestamp': timestamp,
        'data': data?.toJson()
      };
}

class Data {
  final List<Class>? trainClass;
  final List<Quota>? quota;
  final List<Route>? route;

  Data({
    this.trainClass,
    this.quota,
    this.route,
  });

  Data.fromJson(Map<String, dynamic> json)
      : trainClass = (json['class'] as List?)
            ?.map((dynamic e) => Class.fromJson(e as Map<String, dynamic>))
            .toList(),
        quota = (json['quota'] as List?)
            ?.map((dynamic e) => Quota.fromJson(e as Map<String, dynamic>))
            .toList(),
        route = (json['route'] as List?)
            ?.map((dynamic e) => Route.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'class': trainClass?.map((e) => e.toJson()).toList(),
        'quota': quota?.map((e) => e.toJson()).toList(),
        'route': route?.map((e) => e.toJson()).toList()
      };
}

class Class {
  final String? value;
  final String? name;

  Class({
    this.value,
    this.name,
  });

  Class.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'value': value, 'name': name};
}

class Quota {
  final String? value;
  final String? name;

  Quota({
    this.value,
    this.name,
  });

  Quota.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'value': value, 'name': name};
}

class Route {
  final int? dDay;
  final int? day;
  final String? distanceFromSource;
  final String? lat;
  final String? lng;
  final int? platformNumber;
  final int? staMin;
  final String? stateCode;
  final String? stateName;
  final String? stationCode;
  final String? stationName;
  final int? stdMin;
  final bool? stop;
  final String? trainSrc;
  final int? sta;
  final int? todaySta;

  Route({
    this.dDay,
    this.day,
    this.distanceFromSource,
    this.lat,
    this.lng,
    this.platformNumber,
    this.staMin,
    this.stateCode,
    this.stateName,
    this.stationCode,
    this.stationName,
    this.stdMin,
    this.stop,
    this.trainSrc,
    this.sta,
    this.todaySta,
  });

  Route.fromJson(Map<String, dynamic> json)
      : dDay = json['d_day'] as int?,
        day = json['day'] as int?,
        distanceFromSource = json['distance_from_source'] as String?,
        lat = json['lat'] as String?,
        lng = json['lng'] as String?,
        platformNumber = json['platform_number'] as int?,
        staMin = json['sta_min'] as int?,
        stateCode = json['state_code'] as String?,
        stateName = json['state_name'] as String?,
        stationCode = json['station_code'] as String?,
        stationName = json['station_name'] as String?,
        stdMin = json['std_min'] as int?,
        stop = json['stop'] as bool?,
        trainSrc = json['train_src'] as String?,
        sta = json['sta'] as int?,
        todaySta = json['today_sta'] as int?;

  Map<String, dynamic> toJson() => {
        'd_day': dDay,
        'day': day,
        'distance_from_source': distanceFromSource,
        'lat': lat,
        'lng': lng,
        'platform_number': platformNumber,
        'sta_min': staMin,
        'state_code': stateCode,
        'state_name': stateName,
        'station_code': stationCode,
        'station_name': stationName,
        'std_min': stdMin,
        'stop': stop,
        'train_src': trainSrc,
        'sta': sta,
        'today_sta': todaySta
      };
}
