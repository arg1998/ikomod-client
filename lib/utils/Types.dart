enum ImageType { CAMERA, GALLERY }
enum PostType { SPECIAL, INTERMEDIARY, AUCTION, NORMAL }
enum ProductTradeType { FREE, REQUEST, EXCHANGE, AGREEMENT, FORSALE }
enum ProductSize { FREESIZE, XXXS, XXS, XS, S, M, L, XL, XXL, XXXL, IVL, VL }

typedef void SelectionCallback(int index, ImageType imageType);
