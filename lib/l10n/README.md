# Localization

## Creating mew localization

1. Add the title and string to `lib/l10n/intl_en.arb` for example:


```dart
"hello": "Hello",
```

2. Add translated map to `lib/l10n/intl_fr.arb` like this:

```dart
"hello": "Bonjour",
```

3. By running app, flutter generate all Localization see *Generating
   Localizations*, but if you want to generate before running see
   *Generating Localizations in the command line*

4. To use localization first import `flutter_gen` like this:

```dart
import 'package:instreal/l10n/index.dart';
```
and then use the localization:
```dart
InstrealLocalizations.of(context)!.hello
```

### Note: if you have any untranslated message, flutter generates them in `untranslated-messages.json` and will be determined when you create a pull request to merge.

## Creating new locale messages with variable

When adding new strings to be localized, update `intl_en_.arb`, which is
used by this project as the template. When creating new entries with variable, they
have to be in the following format:

```arb
  "helloName": "Hello {name}",
  "@helloName": {
        "placeholders": {
            "name": {}
        }
  },
```

In this example, `dartGetterVariableName` should be the Dart method/property
name that you will be using in your localizations delegate.

After adding the new message in `intl_en.arb`, it can be used in the app by
regenerating the Localizations delegate.
This allows use of the English message through your localizations delegate in
the application code immediately without having to wait for the translations
to be completed.

## Generating localizations

Running the application for the first time should generate a synthetic package
containing the app's localizations through importing
`package:flutter_gen/gen_l10n/`. The code is generated will be generated in
`.dart_tool/flutter_gen/gen_l10n/`.

The generated localizations code is updated every time `flutter run`
is called, and during hot reload and restart. This means that updates to
existing arb files can be made and seen in real time during app development.

### Generating localizations in the command line

First temporary remove `l10n.yaml` file and then from the root directory, run:

```bash
flutter gen-l10n \
    --template-arb-file=intl_en.arb \
    --output-localization-file=instreal_localizations.dart \
    --output-class=InstrealLocalizations
```
Don't forget to restore `l10n.yaml` file!
