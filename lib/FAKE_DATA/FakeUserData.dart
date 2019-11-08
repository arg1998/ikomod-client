import 'package:ikomod/models/User.model.dart';
import 'package:ikomod/utils/Helpers.dart';

String randProfileImage() => "https://picsum.photos/200?random=${rand(1000)}";

final UserModel melina = UserModel(
  name: "ملینا محمدی",
  bio:
      "عاشق برنامه نویسی هستم و دوست دارم ایده هایی که توی ذهنم هست رو بسازم. مسافرت و کمپ توی طبیعت یکی از تفریحات مورد علاقه من هست",
  email: "arg7971@gmail.com",
  coins: 1658,
  id: "a15d6fa8we3s21f8e",
  imageUrl: randProfileImage(),
  level: 5,
  rank: 1,
);

final UserModel sara = UserModel(
  name: "سارا ح",
  bio: "بازی های ویدیویی تمام زندگی من هست. عاشق فیلم دیدن هستم.",
  email: "zse@gmail.com",
  coins: 1035,
  id: "a15d6fa8we1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 2,
);

final UserModel mahdieh = UserModel(
  name: "مهدیه باصفا",
  bio: "بازی های ویدیویی تمام زندگی من هست. عاشق فیلم دیدن هستم.",
  email: "wolfofnight@gmail.com",
  coins: 754,
  id: "a1fa8we3s21fs38e",
  imageUrl: randProfileImage(),
  level: 2,
  rank: 3,
);

final UserModel jaleh = UserModel(
  name: "ژاله عیوضیان",
  bio: "کانتر بازی مورد علاقه من هست. عاشق موسیقی هستم",
  email: "zse@gmail.com",
  coins: 698,
  id: "a89vn44fg3s21f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 4,
);

final UserModel nahal = UserModel(
  name: "نهال زیبا صفت",
  bio: "",
  email: "zse@gmail.com",
  coins: 546,
  id: "a1fwe44fg3s200a1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 5,
);

final UserModel fahimeh = UserModel(
  name: "فهیمه",
  bio: "سیگار فقط سیگار بهمن",
  email: "zse@gmail.com",
  coins: 125,
  id: "a1fa8w57hhe44f1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 6,
);

final UserModel sahel = UserModel(
  name: "بانو ساحل",
  bio: "...",
  email: "zse@gmail.com",
  coins: 98,
  id: "a1japshdfa8we44f1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 7,
);

final UserModel samira = UserModel(
  name: "سمیرا آقایی",
  bio: "عکاسی تنها علاقه زندگیمه",
  email: "zse@gmail.com",
  coins: 85,
  id: "a1jshdfa8we44f08af1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 8,
);

final UserModel parisa = UserModel(
  name: "پریسا صامت",
  bio: "زندگی بدون پارکور = آشغالدونی",
  email: "zse@gmail.com",
  coins: 32,
  id: "a1jaosfa8we44f1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 9,
);

final UserModel maryam = UserModel(
  name: "مریم میرزاخانی",
  bio: "فقط اسکایریم و دوتا ",
  email: "zse@gmail.com",
  coins: 12,
  id: "a1jshdfa8we431sd54f1f8e",
  imageUrl: randProfileImage(),
  level: 1,
  rank: 9,
);

final all_users = [
  melina,
  sara,
  mahdieh,
  jaleh,
  nahal,
  fahimeh,
  sahel,
  samira,
  parisa,
  maryam
];

final SELF_USER = melina;
