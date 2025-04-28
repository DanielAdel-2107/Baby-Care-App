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
        ],);

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

    if (RegExp(r'^(مرحبا|اهلا|السلام عليكم|hi|hello|hey|welcome|باي|سلام|goodbye|bye)', caseSensitive: false)
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

    if (RegExp(r'(كيف احصل على مربية|البحث عن مربية|ايجاد مربية|خطوات حجز مربية)', caseSensitive: false).hasMatch(userMessage)) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "يمكنك العثور على المربيات من خلال التطبيق. في صفحة \"الرئيسية\" ستجد قائمة بالمربيات مرتبة من الأقرب إلى الأبعد. يُفضَّل اختيار المربية ذات التقييم الأعلى، ثم يمكنك عرض بياناتها من خلال صفحة \"التفاصيل\"، وبعد ذلك إدخال بياناتك وإتمام الحجز."
                : "You can find babysitters through the app. On the \"Home\" page, you'll see a list of babysitters sorted from nearest to farthest. It is recommended to choose the highest-rated babysitter, view their details, and then enter your information to book."
        )
      ]);
      return;
    }

    if (RegExp(r'(التطبيق لا يعمل|المشكلة في التطبيق|عطل في التطبيق|هناك خطأ في التطبيق)', caseSensitive: false).hasMatch(userMessage)) {
      emit([
        ...state,
        ChatMessageGemini(
            sender: 'bot',
            text: isArabic
                ? "إذا كنت تواجه مشكلة في التطبيق، سيتم التواصل مع المختصين في تطبيق Baby Care لحل المشكلة في أسرع وقت."
                : "If you are facing an issue with the app, the Baby Care specialists will be contacted to resolve it as soon as possible."
        )
      ]);
      return;
    }

    if (!RegExp(
            r'(baby|sitter|care|child|infant|parenting|nanny|babysitting|kids|toddler|newborn|feeding|diaper|crying|sleep|lullaby|nursery|growth|health|الأطفال|رعاية|العناية|المربية|الطفل|الحضانة|حديثي الولادة|التربية|الرضاعة|الحفاضات|البكاء|النوم|تهدئة|الحضانة|النمو|الصحة) ',
            caseSensitive: false)
        .hasMatch(userMessage)) {
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
