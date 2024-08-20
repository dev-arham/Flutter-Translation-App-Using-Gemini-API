# Translator App

## Overview

This is a Flutter-based translation app that utilizes the power of the Google Gemini API to translate text between various languages. The app provides an intuitive user interface where users can select languages and input text to get real-time translations.

## Features

- **Multi-Language Support:** Translate text between multiple languages, including English, Dutch, French, German, Italian, Portuguese, Russian, Spanish, Turkish, and Urdu.
- **User-Friendly Interface:** Simple and easy-to-use interface with dropdown menus for language selection and text fields for input and output.
- **Real-Time Translation:** Get translations instantly using the Google Gemini API.
- **Error Handling:** Alerts users when the input field is empty, ensuring a smooth user experience.


## Installation

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Google Cloud account with access to the Google Gemini API

### Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/dev-arham/Flutter-Translation-App-Using-Gemini-API.git
   cd translator-app
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set Up Google Gemini API:**
   - Obtain an API key from the [Google AI Gemini API](https://ai.google.dev/gemini-api).
   - Replace `YOUR_API_HERE` in the `gemini.dart` file with your actual API key.

4. **Run the App:**
   ```bash
   flutter run
   ```

## Usage

1. Select the language you want to translate from and to using the dropdown menus.
2. Enter the text you wish to translate in the input field.
3. Press the "Translate" button to get the translated text in the output field.

## File Structure

- **main.dart:** Entry point of the application.
- **home_screen.dart:** Contains the UI and logic for the home screen.
- **gemini.dart:** Handles API calls to the Google Gemini service for text translation.

## Dependencies

- [Flutter](https://flutter.dev)
- [google_generative_ai](https://pub.dev/packages/google_generative_ai)

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to customize this template to better fit your project!