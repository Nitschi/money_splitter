//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExpenseDto {
  /// Returns a new [ExpenseDto] instance.
  ExpenseDto({
    this.description,
    this.amount,
    this.time,
    this.paidBy,
    this.paidFor = const [],
  });

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? time;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PersonDto? paidBy;

  List<PersonDto>? paidFor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ExpenseDto &&
     other.description == description &&
     other.amount == amount &&
     other.time == time &&
     other.paidBy == paidBy &&
     other.paidFor == paidFor;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (time == null ? 0 : time!.hashCode) +
    (paidBy == null ? 0 : paidBy!.hashCode) +
    (paidFor == null ? 0 : paidFor!.hashCode);

  @override
  String toString() => 'ExpenseDto[description=$description, amount=$amount, time=$time, paidBy=$paidBy, paidFor=$paidFor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.time != null) {
      json[r'time'] = this.time!.toUtc().toIso8601String();
    } else {
      json[r'time'] = null;
    }
    if (this.paidBy != null) {
      json[r'paidBy'] = this.paidBy;
    } else {
      json[r'paidBy'] = null;
    }
    if (this.paidFor != null) {
      json[r'paidFor'] = this.paidFor;
    } else {
      json[r'paidFor'] = null;
    }
    return json;
  }

  /// Returns a new [ExpenseDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExpenseDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ExpenseDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ExpenseDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExpenseDto(
        description: mapValueOfType<String>(json, r'description'),
        amount: mapValueOfType<int>(json, r'amount'),
        time: mapDateTime(json, r'time', ''),
        paidBy: PersonDto.fromJson(json[r'paidBy']),
        paidFor: PersonDto.listFromJson(json[r'paidFor']),
      );
    }
    return null;
  }

  static List<ExpenseDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExpenseDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExpenseDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExpenseDto> mapFromJson(dynamic json) {
    final map = <String, ExpenseDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExpenseDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExpenseDto-objects as value to a dart map
  static Map<String, List<ExpenseDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ExpenseDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExpenseDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

