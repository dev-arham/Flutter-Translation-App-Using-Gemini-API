import 'package:google_generative_ai/google_generative_ai.dart';

String? responseOutput;

String getRespone() {
  return responseOutput!;
}

Future<void> run(
    {required message,
    required languageToTranslate,
    required translateToLanguage}) async {
  final prompt =
      'Translate the following message from $languageToTranslate to $translateToLanguage, do not describe, just give me the translation in one language, my message is: $message';
  await generateContent(prompt: prompt);
}

Future<void> generateContent({required prompt}) async {
  const apiKey = 'YOUR_API_HERE';

  final model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  responseOutput = response.text;
}
