import 'package:final_project/core/enum/types.dart';

class UserTempModel {
  final int id;
  final String name;
  final String email;
  final String avatar;
  //   password varchar(255) [not null]
  final EnumUserStatus status;
  final String notificationId;

  UserTempModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.status,
    required this.notificationId,
  });
}

// demo of data
List<UserTempModel> users = [
  UserTempModel(
    id: 3,
    name: "Omar Alsulami",
    email: "omar@omar.com",
    avatar:
        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_1",
  ),
  UserTempModel(
    id: 4,
    name: "Sara Khalid",
    email: "sara@khalid.com",
    avatar:
        "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_2",
  ),
  UserTempModel(
    id: 5,
    name: "Ali Zain",
    email: "ali@zain.com",
    avatar:
        "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.offline,
    notificationId: "notificationId_3",
  ),
  UserTempModel(
    id: 6,
    name: "Lina Hussein",
    email: "lina@hussein.com",
    avatar:
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_4",
  ),
  UserTempModel(
    id: 7,
    name: "Yousef Faris",
    email: "yousef@faris.com",
    avatar:
        "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_5",
  ),

  UserTempModel(
    id: 9,
    name: "Mohammed Salah",
    email: "mo@salah.com",
    avatar:
        "https://images.unsplash.com/photo-1552058544-f2b08422138a?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_7",
  ),

  UserTempModel(
    id: 11,
    name: "Khalid Alotaibi",
    email: "khalid@alotaibi.com",
    avatar:
        "https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.online,
    notificationId: "notificationId_9",
  ),
  UserTempModel(
    id: 12,
    name: "Rana Fathi",
    email: "rana@fathi.com",
    avatar:
        "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?crop=faces&fit=crop&w=200&h=200",
    status: EnumUserStatus.offline,
    notificationId: "notificationId_10",
  ),
];
