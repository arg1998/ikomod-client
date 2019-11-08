import 'package:ikomod/utils/Helpers.dart';
import 'package:ikomod/utils/Types.dart';

import './FakeUserData.dart';
import '../models/Post.model.dart';

String _randImage([int r = 1]) {
  return "https://picsum.photos/200/400?random=${rand(1000)}";
}

ProductTradeType _randTradeType() {
  int _i = rand(ProductTradeType.values.length);
  return ProductTradeType.values[_i];
}

final _USERS_COUNT = all_users.length;
const _TITLES = const [
  "این یک عنوان کوتاه است",
  "این یک عنوان نسبتا بلند میباشد",
  "این عنوان بلند تر از دیگر عناوین میباشد",
  "این عنوان بلند ترین عنوان در میان عناوین قبلی است",
];
const _DESCRIPTIONS = const [
  "این توضیح کوتاهی در مورد این اگهی میباشد",
  "این توضیح نسبتا بلندی در مورد این اگهی خاص میباشد که در حال نمایش است",
  "این توضیح تعداد کلمات بیشتری نسبت به توضیحات قبلی دارد و طبعا بلند از توضیحات قبلی می باشد.",
  "این بلند ترین توضیح موجود در بین اگهی ها است. هدف این است که نحوه نمایش توضیح های بلند را  در صفحات مختلف ازمایش کنیم.",
];

List<PostModel> _generateHomePosts() {
  return List<PostModel>.generate(200, (index) {
    var _type = (index + 1) % 5 == 0 ? PostType.INTERMEDIARY : PostType.NORMAL;
    return PostModel(
      user: all_users[rand(_USERS_COUNT)],
      title: _TITLES[rand(_TITLES.length)],
      description: _DESCRIPTIONS[rand(_DESCRIPTIONS.length)],
      id: "${index}_${rand(1000)}",
      imageUrls: List<String>.generate(rand(4) + 1, _randImage),
      likes: rand(100),
      type: _type,
      tradeType: _randTradeType(),
      price: rand(999) * 1000,
    );
  });
}

final specialPosts = List<PostModel>.generate(20, (index) {
  return PostModel(
    user: all_users[rand(_USERS_COUNT)],
    title: _TITLES[rand(_TITLES.length)],
    description: _DESCRIPTIONS[rand(_DESCRIPTIONS.length)],
    id: "${index}_${rand(1000)}",
    imageUrls: List<String>.generate(rand(4) + 1, _randImage),
    likes: rand(200),
    type: PostType.SPECIAL,
  );
});

List<PostModel> homePosts = _generateHomePosts();

void refreshHomeLists() {
  homePosts = _generateHomePosts();
}
