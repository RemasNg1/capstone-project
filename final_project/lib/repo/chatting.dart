// import 'package:final_project/models/test_chat/chat_mode.dart';
// import 'package:final_project/repo/supabase.dart';

// class Chatting {
//   Future<List<ChatModel>> fetchMessages({
//     required String userId,
//     required String providerId,
//   }) async {
//     final supabase = SupabaseConnect.supabase!.client;

//     final data = await supabase
//         .from('chats')
//         .select()
//         .or(
//           'and(user_id.eq.$userId,provider_id.eq.$providerId),and(user_id.eq.$providerId,provider_id.eq.$userId)',
//         )
//         .order('timestamp', ascending: true);

//     return data.map((e) => ChatModelMapper.fromMap(e)).toList();
//   }
// }
