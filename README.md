# hull_identification_number

Boat Hull Identification Number (HIN) Decoder 

## Key Tech Used
- BLoC for state management
- RegEx and String Parsing used for user input pattern matching to avoid input errors.
- Compressed JSON file for the entire 16K+ Coast Guard MIC Database
- In app data allows for usage when there is poor or no cell coverage
- Using BLoC repository to data management. This allows for future refactoring to third party API.
- Adaptive UI using dart.io for platform, orientation, width and height 
- theme.dart to allow for universal UI modifications via ThemeData
-   Packages used:
  - equatable: ^2.0.5 
  - bloc: ^8.1.2 
  - flutter_bloc: ^8.1.3 
  - google_fonts: ^6.1.0 
  - go_router: ^12.1.1 
  - url_launcher: ^6.2.1


