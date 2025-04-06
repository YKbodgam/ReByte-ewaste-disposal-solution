import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'product_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _showFilters = false;
  RangeValues _priceRange = const RangeValues(0, 1000);
  double _maxDistance = 50;
  DateTime? _selectedDate;
  String _selectedCategory = '';
  String _selectedCondition = '';
  int _currentFeaturedIndex = 0;

  // Animation controllers
  late AnimationController _filterAnimationController;
  late AnimationController _scrollAnimationController;

  // Scroll controller for animations
  final ScrollController _scrollController = ScrollController();

  // Category chips data
  final List<Map<String, dynamic>> _categories = [
    {'name': 'All', 'icon': Icons.apps, 'color': Colors.purple},
    {'name': 'Phones', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'name': 'Laptops', 'icon': Icons.laptop, 'color': Colors.teal},
    {'name': 'Tablets', 'icon': Icons.tablet_android, 'color': Colors.orange},
    {'name': 'Monitors', 'icon': Icons.desktop_windows, 'color': Colors.green},
    {'name': 'Cameras', 'icon': Icons.camera_alt, 'color': Colors.red},
    {'name': 'Audio', 'icon': Icons.headphones, 'color': Colors.amber},
    {'name': 'Accessories', 'icon': Icons.cable, 'color': Colors.indigo},
    {'name': 'Components', 'icon': Icons.memory, 'color': Colors.cyan},
  ];

  // Condition chips data
  final List<Map<String, dynamic>> _conditions = [
    {'name': 'New', 'color': Colors.green},
    {'name': 'Like New', 'color': Colors.teal},
    {'name': 'Good', 'color': Colors.blue},
    {'name': 'Fair', 'color': Colors.orange},
    {'name': 'Poor', 'color': Colors.red},
  ];

  // Featured products data
  final List<Map<String, dynamic>> _featuredProducts = [
    {
      'id': 'f1',
      'name': 'iPhone 12 Pro Max',
      'category': 'Phones',
      'condition': 'Good',
      'originalPrice': 899.99,
      'discountedPrice': 599.99,
      'distance': 1.2,
      'seller': {'name': 'TechRecycle Inc.', 'isVerified': true, 'rating': 4.8},
      'views': 342,
      'bids': 8,
      'images': [
        'https://images.unsplash.com/photo-1603891128711-11b4b03bb138?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1611472173362-3f53dbd65d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Slightly used iPhone 12 Pro Max with 256GB storage. Minor scratches on the back, but screen is in perfect condition. Comes with original charger and box.',
      'specs': {
        'Storage': '256GB',
        'Color': 'Pacific Blue',
        'Battery Health': '89%',
        'Included': 'Original box, charger, cable',
      },
      'auction': {
        'endDate': '2023-05-15',
        'startingPrice': 499.99,
        'currentBid': 599.99,
        'bidders': [
          {'name': 'Alex M.', 'bid': 599.99, 'date': '2023-05-10'},
          {'name': 'Sarah K.', 'bid': 580.00, 'date': '2023-05-09'},
          {'name': 'Mike T.', 'bid': 550.00, 'date': '2023-05-08'},
          {'name': 'Jessica L.', 'bid': 520.00, 'date': '2023-05-07'},
          {'name': 'David R.', 'bid': 499.99, 'date': '2023-05-06'},
        ],
      },
    },
    {
      'id': 'f2',
      'name': 'MacBook Pro 2019',
      'category': 'Laptops',
      'condition': 'Fair',
      'originalPrice': 1299.99,
      'discountedPrice': 799.99,
      'distance': 2.5,
      'seller': {
        'name': 'GreenTech Recyclers',
        'isVerified': true,
        'rating': 4.6,
      },
      'views': 215,
      'bids': 5,
      'images': [
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9vayUyMHByb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMHByb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          '2019 MacBook Pro 13-inch with Touch Bar. Intel Core i5, 8GB RAM, 256GB SSD. Some wear on the keyboard and minor dents on the bottom case.',
      'specs': {
        'Processor': 'Intel Core i5',
        'RAM': '8GB',
        'Storage': '256GB SSD',
        'Display': '13-inch Retina',
        'Battery Cycles': '310',
      },
      'auction': {
        'endDate': '2023-05-18',
        'startingPrice': 699.99,
        'currentBid': 799.99,
        'bidders': [
          {'name': 'Thomas W.', 'bid': 799.99, 'date': '2023-05-12'},
          {'name': 'Emma S.', 'bid': 750.00, 'date': '2023-05-11'},
          {'name': 'Robert J.', 'bid': 720.00, 'date': '2023-05-10'},
          {'name': 'Lisa M.', 'bid': 699.99, 'date': '2023-05-09'},
        ],
      },
    },
    {
      'id': 'f3',
      'name': 'Samsung Galaxy Tab S7',
      'category': 'Tablets',
      'condition': 'Like New',
      'originalPrice': 649.99,
      'discountedPrice': 449.99,
      'distance': 3.7,
      'seller': {'name': 'ElectroRenew', 'isVerified': false, 'rating': 4.3},
      'views': 178,
      'bids': 3,
      'images': [
        'https://images.unsplash.com/photo-1589739900243-4b52cd9dd8df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGFibGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1623126908029-58cb08a2b272?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dGFibGV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Samsung Galaxy Tab S7 in excellent condition. 128GB storage, Wi-Fi model. Includes S Pen and protective case. Only used for a few months.',
      'specs': {
        'Display': '11-inch LTPS TFT',
        'Storage': '128GB',
        'RAM': '6GB',
        'Battery': '8,000 mAh',
        'Included': 'S Pen, protective case, charger',
      },
      'auction': {
        'endDate': '2023-05-20',
        'startingPrice': 399.99,
        'currentBid': 449.99,
        'bidders': [
          {'name': 'Jennifer P.', 'bid': 449.99, 'date': '2023-05-13'},
          {'name': 'Brian K.', 'bid': 425.00, 'date': '2023-05-12'},
          {'name': 'Amanda S.', 'bid': 399.99, 'date': '2023-05-11'},
        ],
      },
    },
  ];

  // For You products data
  final List<Map<String, dynamic>> _forYouProducts = [
    {
      'id': 'p1',
      'name': 'Dell XPS 15',
      'category': 'Laptops',
      'condition': 'Good',
      'originalPrice': 1499.99,
      'discountedPrice': 899.99,
      'distance': 1.8,
      'seller': {
        'name': 'TechRenew Solutions',
        'isVerified': true,
        'rating': 4.7,
      },
      'views': 203,
      'bids': 6,
      'images': [
        'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZGVsbCUyMGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Dell XPS 15 (2019) with 4K display, Intel Core i7, 16GB RAM, and 512GB SSD. Some wear on the keyboard but otherwise in good condition.',
      'specs': {
        'Processor': 'Intel Core i7-9750H',
        'RAM': '16GB',
        'Storage': '512GB SSD',
        'Display': '15.6-inch 4K UHD',
        'Graphics': 'NVIDIA GTX 1650',
      },
      'auction': {
        'endDate': '2023-05-17',
        'startingPrice': 799.99,
        'currentBid': 899.99,
        'bidders': [
          {'name': 'Chris M.', 'bid': 899.99, 'date': '2023-05-12'},
          {'name': 'Laura B.', 'bid': 850.00, 'date': '2023-05-11'},
          {'name': 'Kevin P.', 'bid': 825.00, 'date': '2023-05-10'},
          {'name': 'Sophia R.', 'bid': 799.99, 'date': '2023-05-09'},
        ],
      },
    },
    {
      'id': 'p2',
      'name': 'Sony WH-1000XM4',
      'category': 'Audio',
      'condition': 'Like New',
      'originalPrice': 349.99,
      'discountedPrice': 229.99,
      'distance': 2.3,
      'seller': {'name': 'AudioRecycle', 'isVerified': false, 'rating': 4.5},
      'views': 156,
      'bids': 4,
      'images': [
        'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Sony WH-1000XM4 wireless noise-cancelling headphones. Barely used, in excellent condition with all original accessories and packaging.',
      'specs': {
        'Type': 'Over-ear, wireless',
        'Battery Life': 'Up to 30 hours',
        'Connectivity': 'Bluetooth 5.0, 3.5mm',
        'Features': 'Active noise cancellation, touch controls',
        'Included': 'Carrying case, charging cable, audio cable',
      },
      'auction': {
        'endDate': '2023-05-16',
        'startingPrice': 199.99,
        'currentBid': 229.99,
        'bidders': [
          {'name': 'Daniel K.', 'bid': 229.99, 'date': '2023-05-11'},
          {'name': 'Rachel W.', 'bid': 215.00, 'date': '2023-05-10'},
          {'name': 'Jason L.', 'bid': 199.99, 'date': '2023-05-09'},
        ],
      },
    },
    {
      'id': 'p3',
      'name': 'Canon EOS 80D',
      'category': 'Cameras',
      'condition': 'Good',
      'originalPrice': 899.99,
      'discountedPrice': 599.99,
      'distance': 4.1,
      'seller': {'name': 'PhotoRecycle', 'isVerified': true, 'rating': 4.9},
      'views': 189,
      'bids': 7,
      'images': [
        'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fub24lMjBjYW1lcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Canon EOS 80D DSLR camera with 18-135mm lens. Some signs of use but in good working condition. Includes battery, charger, and camera bag.',
      'specs': {
        'Sensor': '24.2MP APS-C CMOS',
        'Processor': 'DIGIC 6',
        'Autofocus': '45-point all cross-type AF',
        'Video': '1080p at 60fps',
        'Shutter Count': 'Approx. 15,000',
      },
      'auction': {
        'endDate': '2023-05-19',
        'startingPrice': 499.99,
        'currentBid': 599.99,
        'bidders': [
          {'name': 'Michael B.', 'bid': 599.99, 'date': '2023-05-13'},
          {'name': 'Emily C.', 'bid': 550.00, 'date': '2023-05-12'},
          {'name': 'Andrew T.', 'bid': 525.00, 'date': '2023-05-11'},
          {'name': 'Nicole S.', 'bid': 499.99, 'date': '2023-05-10'},
        ],
      },
    },
    {
      'id': 'p4',
      'name': 'iPad Pro 11" (2020)',
      'category': 'Tablets',
      'condition': 'Good',
      'originalPrice': 799.99,
      'discountedPrice': 599.99,
      'distance': 3.2,
      'seller': {'name': 'AppleRecyclers', 'isVerified': true, 'rating': 4.8},
      'views': 221,
      'bids': 5,
      'images': [
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aXBhZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'iPad Pro 11-inch (2020) with 256GB storage, Wi-Fi + Cellular. Minor scratches on the back but screen is flawless. Includes Apple Pencil 2nd gen.',
      'specs': {
        'Chip': 'A12Z Bionic',
        'Storage': '256GB',
        'Display': '11-inch Liquid Retina',
        'Connectivity': 'Wi-Fi + Cellular',
        'Included': 'Apple Pencil 2nd gen, charger',
      },
      'auction': {
        'endDate': '2023-05-18',
        'startingPrice': 549.99,
        'currentBid': 599.99,
        'bidders': [
          {'name': 'Jessica T.', 'bid': 599.99, 'date': '2023-05-12'},
          {'name': 'Ryan M.', 'bid': 575.00, 'date': '2023-05-11'},
          {'name': 'Olivia P.', 'bid': 549.99, 'date': '2023-05-10'},
        ],
      },
    },
  ];

  // Value for Money products data
  final List<Map<String, dynamic>> _valueProducts = [
    {
      'id': 'v1',
      'name': 'Samsung Galaxy S20',
      'category': 'Phones',
      'condition': 'Good',
      'originalPrice': 699.99,
      'discountedPrice': 349.99,
      'distance': 2.7,
      'seller': {'name': 'MobileRecycle', 'isVerified': true, 'rating': 4.6},
      'views': 178,
      'bids': 6,
      'images': [
        'https://images.unsplash.com/photo-1583573636246-18cb2246697a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2FsYXh5JTIwczIwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Samsung Galaxy S20 with 128GB storage. Some minor scratches on the screen but fully functional. Includes original charger and box.',
      'specs': {
        'Display': '6.2-inch Dynamic AMOLED',
        'Processor': 'Exynos 990',
        'RAM': '8GB',
        'Storage': '128GB',
        'Battery': '4,000 mAh',
      },
      'auction': {
        'endDate': '2023-05-16',
        'startingPrice': 299.99,
        'currentBid': 349.99,
        'bidders': [
          {'name': 'Mark L.', 'bid': 349.99, 'date': '2023-05-11'},
          {'name': 'Sophia K.', 'bid': 325.00, 'date': '2023-05-10'},
          {'name': 'James R.', 'bid': 299.99, 'date': '2023-05-09'},
        ],
      },
    },
    {
      'id': 'v2',
      'name': 'Logitech MX Master 3',
      'category': 'Accessories',
      'condition': 'Like New',
      'originalPrice': 99.99,
      'discountedPrice': 59.99,
      'distance': 1.5,
      'seller': {'name': 'TechAccessories', 'isVerified': false, 'rating': 4.4},
      'views': 112,
      'bids': 3,
      'images': [
        'https://images.unsplash.com/photo-1629429407759-01cd3d7cfb38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9naXRlY2glMjBtb3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Logitech MX Master 3 wireless mouse in excellent condition. Barely used, comes with original packaging and USB receiver.',
      'specs': {
        'Connectivity': 'Bluetooth, USB receiver',
        'Battery Life': 'Up to 70 days',
        'Buttons': '7 programmable buttons',
        'Compatibility': 'Windows, macOS, Linux',
        'Features': 'MagSpeed scroll wheel, app-specific profiles',
      },
      'auction': {
        'endDate': '2023-05-15',
        'startingPrice': 49.99,
        'currentBid': 59.99,
        'bidders': [
          {'name': 'David C.', 'bid': 59.99, 'date': '2023-05-10'},
          {'name': 'Anna M.', 'bid': 54.99, 'date': '2023-05-09'},
          {'name': 'Paul S.', 'bid': 49.99, 'date': '2023-05-08'},
        ],
      },
    },
    {
      'id': 'v3',
      'name': 'Acer Predator XB271HU',
      'category': 'Monitors',
      'condition': 'Fair',
      'originalPrice': 499.99,
      'discountedPrice': 249.99,
      'distance': 3.9,
      'seller': {'name': 'DisplayRecyclers', 'isVerified': true, 'rating': 4.5},
      'views': 145,
      'bids': 4,
      'images': [
        'https://images.unsplash.com/photo-1527219525722-f9767a7f2884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2FtaW5nJTIwbW9uaXRvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          '27-inch Acer Predator gaming monitor with 1440p resolution and 144Hz refresh rate. Some scratches on the stand and a small dead pixel in the corner.',
      'specs': {
        'Display': '27-inch IPS',
        'Resolution': '2560 x 1440 (WQHD)',
        'Refresh Rate': '144Hz',
        'Response Time': '4ms',
        'Ports': 'HDMI, DisplayPort, USB 3.0 hub',
      },
      'auction': {
        'endDate': '2023-05-17',
        'startingPrice': 199.99,
        'currentBid': 249.99,
        'bidders': [
          {'name': 'Eric T.', 'bid': 249.99, 'date': '2023-05-12'},
          {'name': 'Michelle L.', 'bid': 225.00, 'date': '2023-05-11'},
          {'name': 'Brandon K.', 'bid': 210.00, 'date': '2023-05-10'},
          {'name': 'Samantha P.', 'bid': 199.99, 'date': '2023-05-09'},
        ],
      },
    },
  ];

  // Trending products data
  final List<Map<String, dynamic>> _trendingProducts = [
    {
      'id': 't1',
      'name': 'Nintendo Switch',
      'category': 'Gaming',
      'condition': 'Good',
      'originalPrice': 299.99,
      'discountedPrice': 219.99,
      'distance': 2.1,
      'seller': {'name': 'GameRecycle', 'isVerified': true, 'rating': 4.7},
      'views': 256,
      'bids': 9,
      'images': [
        'https://images.unsplash.com/photo-1578303512597-81e6cc155b3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmludGVuZG8lMjBzd2l0Y2h8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Nintendo Switch console (V2) with improved battery life. Includes dock, Joy-Cons, and all original accessories. Some light scratches on the screen.',
      'specs': {
        'Model': 'HAC-001(-01)',
        'Storage': '32GB (expandable)',
        'Battery Life': '4.5-9 hours',
        'Included': 'Dock, Joy-Cons, Joy-Con grip, HDMI cable, AC adapter',
        'Games': 'None included',
      },
      'auction': {
        'endDate': '2023-05-15',
        'startingPrice': 189.99,
        'currentBid': 219.99,
        'bidders': [
          {'name': 'Tyler J.', 'bid': 219.99, 'date': '2023-05-10'},
          {'name': 'Megan R.', 'bid': 205.00, 'date': '2023-05-09'},
          {'name': 'Justin K.', 'bid': 195.00, 'date': '2023-05-08'},
          {'name': 'Amber L.', 'bid': 189.99, 'date': '2023-05-07'},
        ],
      },
    },
    {
      'id': 't2',
      'name': 'Bose QuietComfort 35 II',
      'category': 'Audio',
      'condition': 'Good',
      'originalPrice': 299.99,
      'discountedPrice': 179.99,
      'distance': 3.4,
      'seller': {'name': 'AudioTech', 'isVerified': false, 'rating': 4.3},
      'views': 187,
      'bids': 5,
      'images': [
        'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Ym9zZSUyMGhlYWRwaG9uZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Bose QuietComfort 35 II noise-cancelling headphones. Some wear on the ear cushions but excellent sound quality and noise cancellation.',
      'specs': {
        'Type': 'Over-ear, wireless',
        'Battery Life': 'Up to 20 hours',
        'Connectivity': 'Bluetooth, 3.5mm',
        'Features': 'Active noise cancellation, built-in Google Assistant',
        'Included': 'Carrying case, charging cable, audio cable',
      },
      'auction': {
        'endDate': '2023-05-16',
        'startingPrice': 149.99,
        'currentBid': 179.99,
        'bidders': [
          {'name': 'Lauren B.', 'bid': 179.99, 'date': '2023-05-11'},
          {'name': 'Nathan C.', 'bid': 165.00, 'date': '2023-05-10'},
          {'name': 'Heather M.', 'bid': 149.99, 'date': '2023-05-09'},
        ],
      },
    },
    {
      'id': 't3',
      'name': 'GoPro HERO9 Black',
      'category': 'Cameras',
      'condition': 'Like New',
      'originalPrice': 399.99,
      'discountedPrice': 279.99,
      'distance': 4.2,
      'seller': {
        'name': 'ActionCamRecyclers',
        'isVerified': true,
        'rating': 4.8,
      },
      'views': 203,
      'bids': 7,
      'images': [
        'https://images.unsplash.com/photo-1565130838609-c3a86655db61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z29wcm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'GoPro HERO9 Black action camera in excellent condition. Includes original accessories and additional battery. Only used a few times.',
      'specs': {
        'Video': '5K30, 4K60, 1080p240',
        'Photo': '20MP',
        'Features': 'HyperSmooth 3.0, TimeWarp 3.0, Hindsight',
        'Waterproof': 'Up to 33ft (10m)',
        'Included': 'Protective case, 2 batteries, mounting accessories',
      },
      'auction': {
        'endDate': '2023-05-18',
        'startingPrice': 249.99,
        'currentBid': 279.99,
        'bidders': [
          {'name': 'Chris P.', 'bid': 279.99, 'date': '2023-05-13'},
          {'name': 'Melissa T.', 'bid': 265.00, 'date': '2023-05-12'},
          {'name': 'Jordan B.', 'bid': 249.99, 'date': '2023-05-11'},
        ],
      },
    },
  ];

  // Premium products data
  final List<Map<String, dynamic>> _premiumProducts = [
    {
      'id': 'pr1',
      'name': 'iMac 27" (2020)',
      'category': 'Computers',
      'condition': 'Good',
      'originalPrice': 1799.99,
      'discountedPrice': 1299.99,
      'distance': 5.3,
      'seller': {
        'name': 'ApplePro Recyclers',
        'isVerified': true,
        'rating': 4.9,
      },
      'views': 167,
      'bids': 4,
      'images': [
        'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          '27-inch iMac (2020) with 5K Retina display, 3.3GHz 6-core Intel Core i5, 8GB RAM, 512GB SSD. Minor scratches on the base but screen is perfect.',
      'specs': {
        'Processor': '3.3GHz 6-core Intel Core i5',
        'RAM': '8GB DDR4',
        'Storage': '512GB SSD',
        'Display': '27-inch 5K Retina',
        'Graphics': 'AMD Radeon Pro 5300 4GB',
      },
      'auction': {
        'endDate': '2023-05-20',
        'startingPrice': 1199.99,
        'currentBid': 1299.99,
        'bidders': [
          {'name': 'Robert S.', 'bid': 1299.99, 'date': '2023-05-15'},
          {'name': 'Jennifer L.', 'bid': 1250.00, 'date': '2023-05-14'},
          {'name': 'William T.', 'bid': 1225.00, 'date': '2023-05-13'},
          {'name': 'Elizabeth K.', 'bid': 1199.99, 'date': '2023-05-12'},
        ],
      },
    },
    {
      'id': 'pr2',
      'name': 'Sony A7 III',
      'category': 'Cameras',
      'condition': 'Like New',
      'originalPrice': 1999.99,
      'discountedPrice': 1499.99,
      'distance': 6.7,
      'seller': {
        'name': 'ProCamera Recyclers',
        'isVerified': true,
        'rating': 4.8,
      },
      'views': 189,
      'bids': 5,
      'images': [
        'https://images.unsplash.com/photo-1516724562728-afc824a36e84?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29ueSUyMGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ],
      'description':
          'Sony A7 III mirrorless camera with 28-70mm lens. Excellent condition, low shutter count. Includes extra battery, charger, and camera bag.',
      'specs': {
        'Sensor': '24.2MP full-frame Exmor R CMOS',
        'ISO Range': '100-51,200 (expandable)',
        'Autofocus': '693-point phase-detection AF',
        'Video': '4K HDR',
        'Shutter Count': 'Approx. 5,200',
      },
      'auction': {
        'endDate': '2023-05-19',
        'startingPrice': 1399.99,
        'currentBid': 1499.99,
        'bidders': [
          {'name': 'Michael R.', 'bid': 1499.99, 'date': '2023-05-14'},
          {'name': 'Sarah J.', 'bid': 1450.00, 'date': '2023-05-13'},
          {'name': 'Daniel M.', 'bid': 1425.00, 'date': '2023-05-12'},
          {'name': 'Rebecca T.', 'bid': 1399.99, 'date': '2023-05-11'},
        ],
      },
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _filterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scrollAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // Add scroll listener for animations
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 &&
          !_scrollAnimationController.isCompleted) {
        _scrollAnimationController.forward();
      } else if (_scrollController.offset <= 50 &&
          _scrollAnimationController.isCompleted) {
        _scrollAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _filterAnimationController.dispose();
    _scrollAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Filter products based on selected filters
  List<Map<String, dynamic>> _filterProducts(
    List<Map<String, dynamic>> products,
  ) {
    return products.where((product) {
      // Filter by price range
      if (product['discountedPrice'] < _priceRange.start ||
          product['discountedPrice'] > _priceRange.end) {
        return false;
      }

      // Filter by distance
      if (product['distance'] > _maxDistance) {
        return false;
      }

      // Filter by category
      if (_selectedCategory.isNotEmpty &&
          _selectedCategory != 'All' &&
          product['category'] != _selectedCategory) {
        return false;
      }

      // Filter by condition
      if (_selectedCondition.isNotEmpty &&
          product['condition'] != _selectedCondition) {
        return false;
      }

      // Filter by date if selected
      if (_selectedDate != null) {
        final productDate = DateTime.parse(product['auction']['endDate']);
        if (productDate.isBefore(_selectedDate!)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildCategoryChips(),
            Expanded(
              child: Stack(
                children: [_buildProductList(), _buildFilterPanel()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return AnimatedBuilder(
      animation: _scrollAnimationController,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical:
                Tween<double>(
                  begin: 16.0,
                  end: 8.0,
                ).animate(_scrollAnimationController).value,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius:
                    Tween<double>(
                      begin: 0.0,
                      end: 10.0,
                    ).animate(_scrollAnimationController).value,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search e-waste products...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    _showFilters = !_showFilters;
                  });
                  if (_showFilters) {
                    _filterAnimationController.forward();
                  } else {
                    _filterAnimationController.reverse();
                  }
                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: _showFilters ? Colors.green : Colors.grey[100],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: _showFilters ? Colors.white : Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryChips() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category['name'];

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = isSelected ? '' : category['name'];
              });
              // Add a small haptic feedback
              HapticFeedback.lightImpact();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? category['color'] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: category['color'].withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      category['icon'],
                      size: 18,
                      color: isSelected ? Colors.white : Colors.grey[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category['name'],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterPanel() {
    return AnimatedBuilder(
      animation: _filterAnimationController,
      builder: (context, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _filterAnimationController,
            curve: Curves.easeOut,
          ),
        );

        return SlideTransition(
          position: slideAnimation,
          child: Visibility(
            visible: _showFilters,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _priceRange = const RangeValues(0, 1000);
                            _maxDistance = 50;
                            _selectedDate = null;
                            _selectedCategory = '';
                            _selectedCondition = '';
                          });
                        },
                        child: const Text('Reset All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Price Range',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${_priceRange.start.toInt()}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Expanded(
                        child: RangeSlider(
                          values: _priceRange,
                          min: 0,
                          max: 2000,
                          divisions: 20,
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey[300],
                          labels: RangeLabels(
                            '\$${_priceRange.start.toInt()}',
                            '\$${_priceRange.end.toInt()}',
                          ),
                          onChanged: (values) {
                            setState(() {
                              _priceRange = values;
                            });
                          },
                        ),
                      ),
                      Text(
                        '\$${_priceRange.end.toInt()}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate ?? DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 90),
                                  ),
                                );
                                if (date != null) {
                                  setState(() {
                                    _selectedDate = date;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _selectedDate == null
                                          ? 'Select Date'
                                          : DateFormat(
                                            'MMM dd, yyyy',
                                          ).format(_selectedDate!),
                                      style: TextStyle(
                                        color:
                                            _selectedDate == null
                                                ? Colors.grey[600]
                                                : Colors.black,
                                      ),
                                    ),
                                    if (_selectedDate != null) ...[
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedDate = null;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Distance',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: _maxDistance,
                                    min: 1,
                                    max: 100,
                                    divisions: 20,
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey[300],
                                    label: '${_maxDistance.toInt()} mi',
                                    onChanged: (value) {
                                      setState(() {
                                        _maxDistance = value;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${_maxDistance.toInt()} mi',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Condition',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        _conditions.map((condition) {
                          final isSelected =
                              _selectedCondition == condition['name'];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCondition =
                                    isSelected ? '' : condition['name'];
                              });
                              HapticFeedback.lightImpact();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? condition['color']
                                        : Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow:
                                    isSelected
                                        ? [
                                          BoxShadow(
                                            color: condition['color']
                                                .withOpacity(0.4),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ]
                                        : null,
                              ),
                              child: Text(
                                condition['name'],
                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.grey[700],
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showFilters = false;
                        });
                        _filterAnimationController.reverse();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Apply Filters',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductList() {
    // Apply filters to all product lists
    final filteredFeatured = _filterProducts(_featuredProducts);
    final filteredForYou = _filterProducts(_forYouProducts);
    final filteredValue = _filterProducts(_valueProducts);
    final filteredTrending = _filterProducts(_trendingProducts);
    final filteredPremium = _filterProducts(_premiumProducts);

    // Check if any products match the filters
    final hasProducts =
        filteredFeatured.isNotEmpty ||
        filteredForYou.isNotEmpty ||
        filteredValue.isNotEmpty ||
        filteredTrending.isNotEmpty ||
        filteredPremium.isNotEmpty;

    if (!hasProducts) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              'No products match your filters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your filter criteria',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _priceRange = const RangeValues(0, 1000);
                  _maxDistance = 50;
                  _selectedDate = null;
                  _selectedCategory = '';
                  _selectedCondition = '';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Reset Filters'),
            ),
          ],
        ),
      );
    }

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        if (filteredFeatured.isNotEmpty)
          _buildFeaturedProducts(filteredFeatured),
        if (filteredForYou.isNotEmpty)
          _buildProductSection('For You', filteredForYou),
        if (filteredValue.isNotEmpty)
          _buildProductSection('Value for Money', filteredValue),
        if (filteredTrending.isNotEmpty)
          _buildProductSection('Trending Now', filteredTrending),
        if (filteredPremium.isNotEmpty)
          _buildProductSection('Premium Selection', filteredPremium),
      ],
    );
  }

  Widget _buildFeaturedProducts(List<Map<String, dynamic>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children:
                    products.asMap().entries.map((entry) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentFeaturedIndex == entry.key
                                  ? Colors.green
                                  : Colors.grey[300],
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                _currentFeaturedIndex = index;
              });
            },
          ),
          items:
              products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    product['images'][0],
                                    height: 220,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getConditionColor(
                                        product['condition'],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      product['condition'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.7),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${product['views']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Icon(
                                        Icons.gavel,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${product['bids']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          product['category'],
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${product['distance']} miles away',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${product['discountedPrice']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '\$${product['originalPrice']}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red[50],
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          '-${((1 - (product['discountedPrice'] / product['originalPrice'])) * 100).toInt()}%',
                                          style: TextStyle(
                                            color: Colors.red[700],
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage(
                                          'https://i.pravatar.cc/150?img=${product['id'].hashCode % 70}',
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                product['seller']['name'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              if (product['seller']['isVerified']) ...[
                                                const SizedBox(width: 4),
                                                Icon(
                                                  Icons.verified,
                                                  size: 14,
                                                  color: Colors.blue[700],
                                                ),
                                              ],
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.amber[700],
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${product['seller']['rating']}',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      ProductDetailScreen(
                                                        product: product,
                                                      ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                        ),
                                        child: const Text('View'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildProductSection(
    String title,
    List<Map<String, dynamic>> products,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('See All')),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _buildProductCard(product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    product['images'][0],
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getConditionColor(product['condition']),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      product['condition'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['category'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${product['discountedPrice']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${product['originalPrice']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product['distance']} miles',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.remove_red_eye,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product['views']}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=${product['id'].hashCode % 70}',
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          product['seller']['name'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (product['seller']['isVerified'])
                        Icon(Icons.verified, size: 14, color: Colors.blue[700]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getConditionColor(String condition) {
    switch (condition) {
      case 'New':
        return Colors.green;
      case 'Like New':
        return Colors.teal;
      case 'Good':
        return Colors.blue;
      case 'Fair':
        return Colors.orange;
      case 'Poor':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
