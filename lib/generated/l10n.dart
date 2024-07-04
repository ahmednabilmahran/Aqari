// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Login to access your account`
  String get loginToAccessYourAccount {
    return Intl.message(
      'Login to access your account',
      name: 'loginToAccessYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Join Now`
  String get joinNow {
    return Intl.message(
      'Join Now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your First Name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter Your First Name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Last Name`
  String get enterYourLastName {
    return Intl.message(
      'Enter Your Last Name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm Your Password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search by Address or City`
  String get searchByAddressCity {
    return Intl.message(
      'Search by Address or City',
      name: 'searchByAddressCity',
      desc: '',
      args: [],
    );
  }

  /// `Sell my property`
  String get sellMyProperty {
    return Intl.message(
      'Sell my property',
      name: 'sellMyProperty',
      desc: '',
      args: [],
    );
  }

  /// `List my property for sale`
  String get listMyPropertyForSale {
    return Intl.message(
      'List my property for sale',
      name: 'listMyPropertyForSale',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Featured Properties`
  String get featuredProperties {
    return Intl.message(
      'Featured Properties',
      name: 'featuredProperties',
      desc: '',
      args: [],
    );
  }

  /// `Check out some of our top listings`
  String get checkOutSomeOfOurTopListings {
    return Intl.message(
      'Check out some of our top listings',
      name: 'checkOutSomeOfOurTopListings',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Near You`
  String get nearYou {
    return Intl.message(
      'Near You',
      name: 'nearYou',
      desc: '',
      args: [],
    );
  }

  /// `View more`
  String get viewMore {
    return Intl.message(
      'View more',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `First Name can't be empty`
  String get firstNameCantBeEmpty {
    return Intl.message(
      'First Name can\'t be empty',
      name: 'firstNameCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid name`
  String get pleaseEnterValidName {
    return Intl.message(
      'Please enter valid name',
      name: 'pleaseEnterValidName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name can't be empty`
  String get lastNameCantBeEmpty {
    return Intl.message(
      'Last Name can\'t be empty',
      name: 'lastNameCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Phone number can't be empty`
  String get phoneNumberCantBeEmpty {
    return Intl.message(
      'Phone number can\'t be empty',
      name: 'phoneNumberCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get passwordCantBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid password`
  String get pleaseEnterValidPassword {
    return Intl.message(
      'Please enter valid password',
      name: 'pleaseEnterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password contains at least 8 characters`
  String get passwordContainsAtLeast8Characters {
    return Intl.message(
      'Password contains at least 8 characters',
      name: 'passwordContainsAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Password contains at least 1 number`
  String get passwordContainsAtLeast1Number {
    return Intl.message(
      'Password contains at least 1 number',
      name: 'passwordContainsAtLeast1Number',
      desc: '',
      args: [],
    );
  }

  /// `Password contains at least 1 special character (!#@\$%*)`
  String get passwordContainsAtLeast1SpecialCharacter {
    return Intl.message(
      'Password contains at least 1 special character (!#@\\\$%*)',
      name: 'passwordContainsAtLeast1SpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Passwords are matched`
  String get passwordsAreMatched {
    return Intl.message(
      'Passwords are matched',
      name: 'passwordsAreMatched',
      desc: '',
      args: [],
    );
  }

  /// `You're almost in! Final step...`
  String get youreAlmostInFinalStep {
    return Intl.message(
      'You\'re almost in! Final step...',
      name: 'youreAlmostInFinalStep',
      desc: '',
      args: [],
    );
  }

  /// `We need to confirm your account.`
  String get weNeedToConfirmYourAccount {
    return Intl.message(
      'We need to confirm your account.',
      name: 'weNeedToConfirmYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `you will receive an email once accepted.`
  String get youWillReceiveAnEmailOnceAccepted {
    return Intl.message(
      'you will receive an email once accepted.',
      name: 'youWillReceiveAnEmailOnceAccepted',
      desc: '',
      args: [],
    );
  }

  /// `You're all set!`
  String get youreAllSet {
    return Intl.message(
      'You\'re all set!',
      name: 'youreAllSet',
      desc: '',
      args: [],
    );
  }

  /// `You can start using the app right away.`
  String get youCanStartUsingTheAppRightAway {
    return Intl.message(
      'You can start using the app right away.',
      name: 'youCanStartUsingTheAppRightAway',
      desc: '',
      args: [],
    );
  }

  /// `AI Center`
  String get aiCenter {
    return Intl.message(
      'AI Center',
      name: 'aiCenter',
      desc: '',
      args: [],
    );
  }

  /// `AI Chats`
  String get aiChats {
    return Intl.message(
      'AI Chats',
      name: 'aiChats',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Search again...`
  String get searchAgain {
    return Intl.message(
      'Search again...',
      name: 'searchAgain',
      desc: '',
      args: [],
    );
  }

  /// `Start typing...`
  String get startTyping {
    return Intl.message(
      'Start typing...',
      name: 'startTyping',
      desc: '',
      args: [],
    );
  }

  /// `New Chat`
  String get newChat {
    return Intl.message(
      'New Chat',
      name: 'newChat',
      desc: '',
      args: [],
    );
  }

  /// `Explore More`
  String get exploreMore {
    return Intl.message(
      'Explore More',
      name: 'exploreMore',
      desc: '',
      args: [],
    );
  }

  /// `Check out all our listings`
  String get checkOutAllOurListings {
    return Intl.message(
      'Check out all our listings',
      name: 'checkOutAllOurListings',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Property type`
  String get propertyType {
    return Intl.message(
      'Property type',
      name: 'propertyType',
      desc: '',
      args: [],
    );
  }

  /// `Select Floor`
  String get selectFloor {
    return Intl.message(
      'Select Floor',
      name: 'selectFloor',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Minimum`
  String get minimum {
    return Intl.message(
      'Minimum',
      name: 'minimum',
      desc: '',
      args: [],
    );
  }

  /// `Maximum`
  String get maximum {
    return Intl.message(
      'Maximum',
      name: 'maximum',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Initiate property search`
  String get initiatePropertySearch {
    return Intl.message(
      'Initiate property search',
      name: 'initiatePropertySearch',
      desc: '',
      args: [],
    );
  }

  /// `ID Verification`
  String get idVerification {
    return Intl.message(
      'ID Verification',
      name: 'idVerification',
      desc: '',
      args: [],
    );
  }

  /// `Seller details`
  String get sellerDetails {
    return Intl.message(
      'Seller details',
      name: 'sellerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Identity Verification`
  String get identityVerification {
    return Intl.message(
      'Identity Verification',
      name: 'identityVerification',
      desc: '',
      args: [],
    );
  }

  /// `Review & Verification`
  String get reviewVerification {
    return Intl.message(
      'Review & Verification',
      name: 'reviewVerification',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `ex. Apartment - ZED East`
  String get exApartmentZedEast {
    return Intl.message(
      'ex. Apartment - ZED East',
      name: 'exApartmentZedEast',
      desc: '',
      args: [],
    );
  }

  /// `Fill details of your unit`
  String get fillDetailsOfYourUnit {
    return Intl.message(
      'Fill details of your unit',
      name: 'fillDetailsOfYourUnit',
      desc: '',
      args: [],
    );
  }

  /// `It’s easy to list your unit on Aqari!`
  String get itsEasyToListYourUnitOnAqari {
    return Intl.message(
      'It’s easy to list your unit on Aqari!',
      name: 'itsEasyToListYourUnitOnAqari',
      desc: '',
      args: [],
    );
  }

  /// `Add your property details`
  String get addYourPropertyDetails {
    return Intl.message(
      'Add your property details',
      name: 'addYourPropertyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Share some basic info, like where it is and its area and floor ...etc`
  String get shareSomeBasicInfoLikeWhereItIsAndIts {
    return Intl.message(
      'Share some basic info, like where it is and its area and floor ...etc',
      name: 'shareSomeBasicInfoLikeWhereItIsAndIts',
      desc: '',
      args: [],
    );
  }

  /// `Make it stand out`
  String get makeItStandOut {
    return Intl.message(
      'Make it stand out',
      name: 'makeItStandOut',
      desc: '',
      args: [],
    );
  }

  /// `Add 5 or more high-quality photos to show the facilities of the unit`
  String get add5OrMoreHighqualityPhotosToShowTheFacilities {
    return Intl.message(
      'Add 5 or more high-quality photos to show the facilities of the unit',
      name: 'add5OrMoreHighqualityPhotosToShowTheFacilities',
      desc: '',
      args: [],
    );
  }

  /// `Finish up and publish`
  String get finishUpAndPublish {
    return Intl.message(
      'Finish up and publish',
      name: 'finishUpAndPublish',
      desc: '',
      args: [],
    );
  }

  /// `We review your request to list the unit for sale on our platform. Upon completion, you will receive an approval notification.`
  String get weReviewYourRequestToListTheUnitForSale {
    return Intl.message(
      'We review your request to list the unit for sale on our platform. Upon completion, you will receive an approval notification.',
      name: 'weReviewYourRequestToListTheUnitForSale',
      desc: '',
      args: [],
    );
  }

  /// `All set`
  String get allSet {
    return Intl.message(
      'All set',
      name: 'allSet',
      desc: '',
      args: [],
    );
  }

  /// `Your unit is now listed on Aqari, awaiting a buyer.`
  String get yourUnitIsNowListedOnAqariAwaitingABuyer {
    return Intl.message(
      'Your unit is now listed on Aqari, awaiting a buyer.',
      name: 'yourUnitIsNowListedOnAqariAwaitingABuyer',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Property Category`
  String get propertyCategory {
    return Intl.message(
      'Property Category',
      name: 'propertyCategory',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Property Features`
  String get propertyFeatures {
    return Intl.message(
      'Property Features',
      name: 'propertyFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Environment / Facilities`
  String get environmentFacilities {
    return Intl.message(
      'Environment / Facilities',
      name: 'environmentFacilities',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields`
  String get pleaseFillAllTheFields {
    return Intl.message(
      'Please fill all the fields',
      name: 'pleaseFillAllTheFields',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Balcony`
  String get balcony {
    return Intl.message(
      'Balcony',
      name: 'balcony',
      desc: '',
      args: [],
    );
  }

  /// `Bathroom`
  String get bathroom {
    return Intl.message(
      'Bathroom',
      name: 'bathroom',
      desc: '',
      args: [],
    );
  }

  /// `Bedroom`
  String get bedroom {
    return Intl.message(
      'Bedroom',
      name: 'bedroom',
      desc: '',
      args: [],
    );
  }

  /// `House`
  String get house {
    return Intl.message(
      'House',
      name: 'house',
      desc: '',
      args: [],
    );
  }

  /// `Commercial`
  String get commercial {
    return Intl.message(
      'Commercial',
      name: 'commercial',
      desc: '',
      args: [],
    );
  }

  /// `Flat`
  String get flat {
    return Intl.message(
      'Flat',
      name: 'flat',
      desc: '',
      args: [],
    );
  }

  /// `Villa`
  String get villa {
    return Intl.message(
      'Villa',
      name: 'villa',
      desc: '',
      args: [],
    );
  }

  /// `Parking Lot`
  String get parkingLot {
    return Intl.message(
      'Parking Lot',
      name: 'parkingLot',
      desc: '',
      args: [],
    );
  }

  /// `Pet Allowed`
  String get petAllowed {
    return Intl.message(
      'Pet Allowed',
      name: 'petAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Garden`
  String get garden {
    return Intl.message(
      'Garden',
      name: 'garden',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get gym {
    return Intl.message(
      'Gym',
      name: 'gym',
      desc: '',
      args: [],
    );
  }

  /// `Park`
  String get park {
    return Intl.message(
      'Park',
      name: 'park',
      desc: '',
      args: [],
    );
  }

  /// `Home theatre`
  String get homeTheatre {
    return Intl.message(
      'Home theatre',
      name: 'homeTheatre',
      desc: '',
      args: [],
    );
  }

  /// `Kid’s Friendly`
  String get kidsFriendly {
    return Intl.message(
      'Kid’s Friendly',
      name: 'kidsFriendly',
      desc: '',
      args: [],
    );
  }

  /// `Pool`
  String get pool {
    return Intl.message(
      'Pool',
      name: 'pool',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Ground`
  String get ground {
    return Intl.message(
      'Ground',
      name: 'ground',
      desc: '',
      args: [],
    );
  }

  /// `Where is the location?`
  String get whereIsTheLocation {
    return Intl.message(
      'Where is the location?',
      name: 'whereIsTheLocation',
      desc: '',
      args: [],
    );
  }

  /// `Address line 1`
  String get addressLine1 {
    return Intl.message(
      'Address line 1',
      name: 'addressLine1',
      desc: '',
      args: [],
    );
  }

  /// `ex. 28 Ahmed Kasem Goda St.`
  String get ex28AhmedKasemGodaSt {
    return Intl.message(
      'ex. 28 Ahmed Kasem Goda St.',
      name: 'ex28AhmedKasemGodaSt',
      desc: '',
      args: [],
    );
  }

  /// `Address line 2`
  String get addressLine2 {
    return Intl.message(
      'Address line 2',
      name: 'addressLine2',
      desc: '',
      args: [],
    );
  }

  /// `ex. From Abbas El Akad St.`
  String get exFromAbbasElAkadSt {
    return Intl.message(
      'ex. From Abbas El Akad St.',
      name: 'exFromAbbasElAkadSt',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `ex. Cairo`
  String get exCairo {
    return Intl.message(
      'ex. Cairo',
      name: 'exCairo',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
