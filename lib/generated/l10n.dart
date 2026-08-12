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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `What's your vibe?`
  String get onboarding_1_title {
    return Intl.message(
      'What\'s your vibe?',
      name: 'onboarding_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Select the styles that resonate with you most.\nWe'll curate outfits just for you.`
  String get onboarding_1_description {
    return Intl.message(
      'Select the styles that resonate with you most.\nWe\'ll curate outfits just for you.',
      name: 'onboarding_1_description',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Experience`
  String get onboarding_2_title {
    return Intl.message(
      'Seamless Experience',
      name: 'onboarding_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Your exclusive journey begins now\nStep into a world of curated\nelegance designed perfectly for you..`
  String get onboarding_2_description {
    return Intl.message(
      'Your exclusive journey begins now\nStep into a world of curated\nelegance designed perfectly for you..',
      name: 'onboarding_2_description',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive Collections`
  String get onboarding_3_title {
    return Intl.message(
      'Exclusive Collections',
      name: 'onboarding_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Gain early access to limited edition pieces\ncrafted with uncompromising quality..`
  String get onboarding_3_description {
    return Intl.message(
      'Gain early access to limited edition pieces\ncrafted with uncompromising quality..',
      name: 'onboarding_3_description',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create your exclusive account`
  String get create_exclusive_account {
    return Intl.message(
      'Create your exclusive account',
      name: 'create_exclusive_account',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `OR REGISTER WITH EMAIL`
  String get or_register_with_email {
    return Intl.message(
      'OR REGISTER WITH EMAIL',
      name: 'or_register_with_email',
      desc: '',
      args: [],
    );
  }

  /// `FULL NAME`
  String get full_name {
    return Intl.message('FULL NAME', name: 'full_name', desc: '', args: []);
  }

  /// `Jane Doe`
  String get full_name_hint {
    return Intl.message('Jane Doe', name: 'full_name_hint', desc: '', args: []);
  }

  /// `FIRST NAME`
  String get first_name {
    return Intl.message('FIRST NAME', name: 'first_name', desc: '', args: []);
  }

  /// `Jane`
  String get first_name_hint {
    return Intl.message('Jane', name: 'first_name_hint', desc: '', args: []);
  }

  /// `LAST NAME`
  String get last_name {
    return Intl.message('LAST NAME', name: 'last_name', desc: '', args: []);
  }

  /// `Doe`
  String get last_name_hint {
    return Intl.message('Doe', name: 'last_name_hint', desc: '', args: []);
  }

  /// `EMAIL`
  String get email {
    return Intl.message('EMAIL', name: 'email', desc: '', args: []);
  }

  /// `jane@example.com`
  String get email_hint {
    return Intl.message(
      'jane@example.com',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get password {
    return Intl.message('PASSWORD', name: 'password', desc: '', args: []);
  }

  /// `........`
  String get password_hint {
    return Intl.message('........', name: 'password_hint', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Verify Identity`
  String get verify_identity {
    return Intl.message(
      'Verify Identity',
      name: 'verify_identity',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to your email`
  String get verify_identity_desc {
    return Intl.message(
      'Enter the 6-digit code sent to your email',
      name: 'verify_identity_desc',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Didn't receive the code?`
  String get didnt_receive_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didnt_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Back to login`
  String get back_to_login {
    return Intl.message(
      'Back to login',
      name: 'back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive a recovery code. We'll help you get back into your account.`
  String get forgot_password_desc {
    return Intl.message(
      'Enter your email to receive a recovery code. We\'ll help you get back into your account.',
      name: 'forgot_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL ADDRESS`
  String get email_address {
    return Intl.message(
      'EMAIL ADDRESS',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message('Send Code', name: 'send_code', desc: '', args: []);
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password to secure your account.`
  String get new_password_desc {
    return Intl.message(
      'Please enter a new password to secure your account.',
      name: 'new_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters long and include a number or symbol.`
  String get must_be_at_least_8_chars {
    return Intl.message(
      'Must be at least 8 characters long and include a number or symbol.',
      name: 'must_be_at_least_8_chars',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successful`
  String get password_reset_successful {
    return Intl.message(
      'Password Reset Successful',
      name: 'password_reset_successful',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been securely updated. You can now access your account with your new credentials.`
  String get password_reset_successful_desc {
    return Intl.message(
      'Your password has been securely updated. You can now access your account with your new credentials.',
      name: 'password_reset_successful_desc',
      desc: '',
      args: [],
    );
  }

  /// `Need further assistance?`
  String get need_further_assistance {
    return Intl.message(
      'Need further assistance?',
      name: 'need_further_assistance',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support {
    return Intl.message(
      'Contact Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_to_your_account {
    return Intl.message(
      'Login to your account',
      name: 'login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `OR LOGIN WITH EMAIL`
  String get or_login_with_email {
    return Intl.message(
      'OR LOGIN WITH EMAIL',
      name: 'or_login_with_email',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get name_required {
    return Intl.message(
      'Name is required',
      name: 'name_required',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_required {
    return Intl.message(
      'Email is required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_required {
    return Intl.message(
      'Password is required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get password_too_short {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Account created, now verify your email`
  String get account_created_successfully {
    return Intl.message(
      'Account created, now verify your email',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Your email has been verified successfully`
  String get your_email_verified_successfully {
    return Intl.message(
      'Your email has been verified successfully',
      name: 'your_email_verified_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP code`
  String get please_enter_otp {
    return Intl.message(
      'Please enter the OTP code',
      name: 'please_enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `An OTP has been sent to your email address`
  String get an_otp_has_been_sent_to_your_email_address {
    return Intl.message(
      'An OTP has been sent to your email address',
      name: 'an_otp_has_been_sent_to_your_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phone_required {
    return Intl.message(
      'Phone number is required',
      name: 'phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirm_password_required {
    return Intl.message(
      'Confirm password is required',
      name: 'confirm_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_dont_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one uppercase letter`
  String get password_complexity_uppercase {
    return Intl.message(
      'Must contain at least one uppercase letter',
      name: 'password_complexity_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one lowercase letter`
  String get password_complexity_lowercase {
    return Intl.message(
      'Must contain at least one lowercase letter',
      name: 'password_complexity_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one number`
  String get password_complexity_number {
    return Intl.message(
      'Must contain at least one number',
      name: 'password_complexity_number',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one special character`
  String get password_complexity_special {
    return Intl.message(
      'Must contain at least one special character',
      name: 'password_complexity_special',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `If the email is registered, you will receive an OTP to reset your password.`
  String get forget_password_otp_notice {
    return Intl.message(
      'If the email is registered, you will receive an OTP to reset your password.',
      name: 'forget_password_otp_notice',
      desc: '',
      args: [],
    );
  }

  /// `OTP verified successfully`
  String get otp_verified_successfully {
    return Intl.message(
      'OTP verified successfully',
      name: 'otp_verified_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Password has been reset successfully`
  String get password_has_been_reset_successfully {
    return Intl.message(
      'Password has been reset successfully',
      name: 'password_has_been_reset_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Discover`
  String get discover {
    return Intl.message('Discover', name: 'discover', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Hello User 👋`
  String get hello_user {
    return Intl.message(
      'Hello User 👋',
      name: 'hello_user',
      desc: '',
      args: [],
    );
  }

  /// `Search for items...`
  String get search_for_items {
    return Intl.message(
      'Search for items...',
      name: 'search_for_items',
      desc: '',
      args: [],
    );
  }

  /// `Summer Sale!`
  String get special_offer {
    return Intl.message(
      'Summer Sale!',
      name: 'special_offer',
      desc: '',
      args: [],
    );
  }

  /// `Get up to 50% off\non all items.`
  String get special_offer_desc {
    return Intl.message(
      'Get up to 50% off\non all items.',
      name: 'special_offer_desc',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message('Item', name: 'item', desc: '', args: []);
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message('Theme Mode', name: 'theme_mode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Product Details`
  String get product_details {
    return Intl.message(
      'Product Details',
      name: 'product_details',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Stock`
  String get stock {
    return Intl.message('Stock', name: 'stock', desc: '', args: []);
  }

  /// `In Stock`
  String get in_stock {
    return Intl.message('In Stock', name: 'in_stock', desc: '', args: []);
  }

  /// `Out of Stock`
  String get out_of_stock {
    return Intl.message(
      'Out of Stock',
      name: 'out_of_stock',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Product Code`
  String get product_code {
    return Intl.message(
      'Product Code',
      name: 'product_code',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message('Add to Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `{count} items available`
  String items_available(Object count) {
    return Intl.message(
      '$count items available',
      name: 'items_available',
      desc: '',
      args: [count],
    );
  }

  /// `OFF`
  String get off {
    return Intl.message('OFF', name: 'off', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Dark`
  String get dark_mode {
    return Intl.message('Dark', name: 'dark_mode', desc: '', args: []);
  }

  /// `Light`
  String get light_mode {
    return Intl.message('Light', name: 'light_mode', desc: '', args: []);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Invalid name`
  String get invalid_name {
    return Intl.message(
      'Invalid name',
      name: 'invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Shipping & Returns`
  String get shippingAndReturns {
    return Intl.message(
      'Shipping & Returns',
      name: 'shippingAndReturns',
      desc: '',
      args: [],
    );
  }

  /// `Free standard shipping and free 60-day returns`
  String get shippingPolicy {
    return Intl.message(
      'Free standard shipping and free 60-day returns',
      name: 'shippingPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Ratings`
  String get ratings {
    return Intl.message('Ratings', name: 'ratings', desc: '', args: []);
  }

  /// `No products found`
  String get no_products_found {
    return Intl.message(
      'No products found',
      name: 'no_products_found',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get search_results {
    return Intl.message(
      'Search Results',
      name: 'search_results',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
