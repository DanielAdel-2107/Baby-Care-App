import 'package:baby_care/features/parent/chat_with_ai/models/chat_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatGeminiCubit extends Cubit<List<ChatMessageGemini>> {
  ChatGeminiCubit()
      : super([
          ChatMessageGemini(
              sender: 'bot',
              text:
                  "Welcome to the Baby Care app! We will help you with everything related to baby care and babysitting.")
        ]);
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: 'AIzaSyBk9v7YKbeynIMc08cF7-nQo9uIbzMWagc',
    generationConfig: GenerationConfig(responseMimeType: 'text/plain'),
  );

  void sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;
    emit([...state, ChatMessageGemini(sender: 'user', text: userMessage)]);
    String promptAr =
        "أنت مساعد متخصص في رعاية الأطفال والمربية. أجب فقط على الأسئلة المتعلقة بذلك.";
    String promptEn =
        "You are an assistant specialized in baby care and babysitting. Answer only questions related to that.";
    bool isArabic = RegExp(r'[؀-ۿ]').hasMatch(userMessage);
    String prompt = isArabic ? promptAr : promptEn;
    if (RegExp(r'^(مرحبا|اهلا|السلام عليكم|hi|hello|hey)', caseSensitive: false)
        .hasMatch(userMessage)) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "مرحبًا! كيف يمكنني مساعدتك في رعاية الأطفال؟"
                : "Hello! How can I assist you with baby care?")
      ]);
      return;
    }

    if (!userMessage.toLowerCase().contains("baby") &&
        !userMessage.toLowerCase().contains("sitter") &&
        !userMessage.toLowerCase().contains("care")) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "عذرًا، لا يمكنني الإجابة على هذا السؤال. تخصصي فقط في رعاية الأطفال."
                : "Sorry, I can't answer this question. My expertise is only in baby care.")
      ]);
      return;
    }

    try {
      final response = await _model
          .generateContent([Content.text("$prompt\n\nUser: $userMessage")]);
      String botReply = response.text ??
          (isArabic
              ? "عذرًا، لا يمكنني الإجابة على هذا السؤال."
              : "Sorry, I can't answer this question.");
      emit([...state, ChatMessageGemini(sender: 'bot', text: botReply)]);
    } catch (e) {
      emit([...state, ChatMessageGemini(sender: 'bot', text: "Error: $e")]);
    }
  }
}

class ChatCubit extends Cubit<List<ChatMessageGemini>> {
  ChatCubit()
      : super([
          ChatMessageGemini(
              sender: 'bot',
              text:
                  "أهلاً بك في تطبيق Baby Care! سنساعدك في كل ما يختص برعاية الأطفال والمربية.")
        ]);
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: 'AIzaSyBk9v7YKbeynIMc08cF7-nQo9uIbzMWagc',
    generationConfig: GenerationConfig(responseMimeType: 'text/plain'),
  );

  void sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;

    emit([...state, ChatMessageGemini(sender: 'user', text: userMessage)]);

    String promptAr =
        "أنت مساعد متخصص في رعاية الأطفال والمربية. أجب فقط على الأسئلة المتعلقة بذلك.";
    String promptEn =
        "You are an assistant specialized in baby care and babysitting. Answer only questions related to that.";
    bool isArabic = RegExp(r'[؀-ۿ]').hasMatch(userMessage);
    String prompt = isArabic ? promptAr : promptEn;

    if (RegExp(
            r'^(مرحبا|اهلا|السلام عليكم|hi|hello|hey|welcome|باي|سلام|goodbye|bye)',
            caseSensitive: false)
        .hasMatch(userMessage)) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "مرحبًا! كيف يمكنني مساعدتك في رعاية الأطفال؟"
                : "Hello! How can I assist you with baby care?")
      ]);
      return;
    }

    if (!userMessage.toLowerCase().contains("baby") &&
        !userMessage.toLowerCase().contains("sitter") &&
        !userMessage.toLowerCase().contains("care")) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "عذرًا، لا يمكنني الإجابة على هذا السؤال. تخصصي فقط في رعاية الأطفال."
                : "Sorry, I can't answer this question. My expertise is only in baby care.")
      ]);
      return;
    }

    try {
      final response = await _model
          .generateContent([Content.text("$prompt\n\nUser: $userMessage")]);
      String botReply = response.text ??
          (isArabic
              ? "عذرًا، لا يمكنني الإجابة على هذا السؤال."
              : "Sorry, I can't answer this question.");
      emit([...state, ChatMessageGemini(sender: 'bot', text: botReply)]);
    } catch (e) {
      emit([...state, ChatMessageGemini(sender: 'bot', text: "Error: $e")]);
    }
  }
}
