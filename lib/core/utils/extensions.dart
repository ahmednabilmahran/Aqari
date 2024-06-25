// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:aqari/generated/l10n.dart';
import 'package:intl/intl.dart';

/// Extensions for [String] class.
extension CapExtension on String {
  /// Capitalizes the first letter of the string.
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  /// Capitalizes the whole string.
  String get allInCaps => toUpperCase();

  /// Capitalizes the first letter of each word in the string.
  String get capitalizeFirstofEach => split(' ')
      .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
      .join(' ');

  /// Checks if string is URL.
  bool get isURL {
    final regExp = RegExp(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    );
    return regExp.hasMatch(this);
  }

  /// Checks if string is name.
  bool get isValidName {
    final regExp = RegExp(r"^[A-Za-z]+([\'\-\s][A-Za-z]+)*$");
    return regExp.hasMatch(this);
  }

  /// Checks if string is referral code.
  bool get isValidReferralCode {
    final regExp = RegExp(r'^[a-zA-Z0-9_-]{3,15}$');
    return regExp.hasMatch(this);
  }

  /// Checks if string is email.
  bool get isValidEmail {
    final regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return regExp.hasMatch(this);
  }

  /// Checks if string is phone number.
  bool get isValidPhoneNumber {
    if (length > 13) {
      return false;
    }

    final regExp = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return regExp.hasMatch(this);
  }

  /// Checks if string is password.
  bool get isValidPassword {
    final regExp = RegExp(
      r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.,:;^%(){}[\]<>?/\\|\-_=+]).{8,}$',
    );
    return regExp.hasMatch(this);
  }

  ///get the index of a character of n occurrence.
  int getIndexOfOccurrence(String stringToFind, int n) {
    if (indexOf(stringToFind) == -1) return -1;
    var number = n;
    if (number == 1) return indexOf(stringToFind);
    var subIndex = -1;
    while (number > 0) {
      subIndex = indexOf(stringToFind, subIndex + 1);
      number -= 1;
    }
    return subIndex;
  }

  bool get isValidJson {
    try {
      jsonDecode(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// Extensions for [DateTime] class.
extension FormatDate on DateTime {
  /// Formats the date to month day.
  /// Example: Jan 1
  String get toMonthDay => '$toMonth $day';

  /// Formats the date to month.
  /// Example: Jan
  String get toMonth => Months.values[month - 1].name.capitalize;

  /// Formate the date to day/month/year.
  /// Example: 1/1/2023
  String get toDayMonthYear => '$day/$month/$year';

  String get toCustomMainMessagesDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final lastWeek = now.subtract(const Duration(days: 7));

    if (isSameDay(this, today)) {
      return DateFormat('hh:mm a').format(this); // Only time for today
    } else if (isSameDay(this, yesterday)) {
      return S.current.yesterday; // Only 'Yesterday' for yesterday
    } else if (isAfter(lastWeek) && !isSameDay(this, today)) {
      return DateFormat('EEEE').format(this); // Day of the week for last week
    } else {
      return DateFormat('M/d/yyyy').format(this); // Date for older dates
    }
  }

  String get toCustomChatAndNotificationsDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final lastWeek = now.subtract(const Duration(days: 7));
    final timeString = DateFormat('hh:mm a').format(this);

    if (isSameDay(this, today)) {
      return DateFormat('hh:mm a').format(this); // Only time for today
    } else if (isSameDay(this, yesterday)) {
      return '${S.current.yesterday}, $timeString'; // Only 'Yesterday'
    } else if (isAfter(lastWeek) && !isSameDay(this, today)) {
      return '${DateFormat('EEEE').format(this)}, $timeString'; // for last week
    } else {
      // Date and time for older dates
      return DateFormat('d/M/yyyy hh:mm a').format(this);
    }
  }

  bool isSameDay(DateTime other, DateTime reference) {
    return year == reference.year &&
        month == reference.month &&
        day == reference.day;
  }
}

/// Months enum.
enum Months { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }
