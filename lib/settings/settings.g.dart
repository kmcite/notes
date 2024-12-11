// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      addToBottom: json['addToBottom'] as bool? ?? false,
      enableSharing: json['enableSharing'] as bool? ?? false,
      moveCheckedToBottom: json['moveCheckedToBottom'] as bool? ?? false,
      showLinkPreviews: json['showLinkPreviews'] as bool? ?? false,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      viewMode: $enumDecodeNullable(_$ViewModeEnumMap, json['viewMode']) ??
          ViewMode.list,
      userName: json['userName'] as String? ?? 'Adn',
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'addToBottom': instance.addToBottom,
      'enableSharing': instance.enableSharing,
      'moveCheckedToBottom': instance.moveCheckedToBottom,
      'showLinkPreviews': instance.showLinkPreviews,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'viewMode': _$ViewModeEnumMap[instance.viewMode]!,
      'userName': instance.userName,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$ViewModeEnumMap = {
  ViewMode.list: 'list',
  ViewMode.grid: 'grid',
};
