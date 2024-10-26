# Apply Localization and Internationalization DEMO

A Flutter application that shows localization (L10n) and internationalization (i18n) according to the locale that is chosen. Three languages are supported by the app: English, Vietnamese, and Japanese. Depending on the language selected, the default currency is automatically changed to the relevant one.

## Features

- **Localization:** Provides localized strings, dates, and currency forms for English, Vietnamese, and Japanese.
- **Currency Conversion:** Depending on the language selected, this feature automatically changes a preset amount to the relevant currency.
- **Dynamic Language Switching:** The application dynamically modifies text and currency formats, and users can choose from a dropdown menu of supported languages.


## Project Structure
- _lib/l10n:_ Contains .arb files with localized strings for English, Vietnamese, and Japanese.
- _lib/screens/home_screen.dart_: The main screen displaying localized text, currency formatting, and a dropdown for language selection.
- _lib/services/currency_service.dart:_ Handles fetching real-time currency exchange rates via an external API.

