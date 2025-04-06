// Dummy product data

// Featured products
final List<Map<String, dynamic>> featuredProducts = [
  {
    "id": "p1",
    "name": "Samsung Galaxy S21 Ultra",
    "category": "Phones",
    "condition": "Excellent",
    "originalPrice": 105999,
    "discountedPrice": 61999,

    "distance": 3.5,
    'postedDate': DateTime.now().subtract(const Duration(days: 2)),
    "seller": {
      "name": "MobileMart Delhi",
      "isVerified": true,
      "rating": 4.7,
      "image": "https://randomuser.me/api/portraits/men/11.jpg",
    },
    "views": 431,
    "bids": 12,
    "description":
        "Barely used Galaxy S21 Ultra with 12GB RAM and 256GB storage. Excellent battery life, minor frame wear. Comes with original box and charger.",
    "images": [
      "https://images.unsplash.com/photo-1611605698335-6e85f52b5e2c",
      "https://images.unsplash.com/photo-1611078489935-1d6be62a23ae",
      "https://images.unsplash.com/photo-1611062794323-d2f418b9c6d7",
    ],
    "specs": {
      "Storage": "256GB",
      "Color": "Phantom Black",
      "Battery Health": "93%",
      "Included": "Original box, fast charger, USB-C cable",
    },
    "auction": {
      "endDate": "2025-04-10",
      "startingPrice": 49999,
      "currentBid": 60200,
      "bidders": [
        {"name": "Rohan Mehta", "bid": 60200, "date": "2025-04-05"},
        {"name": "Sneha Patil", "bid": 59500, "date": "2025-04-04"},
        {"name": "Harshit Verma", "bid": 57000, "date": "2025-04-03"},
        {"name": "Kiran Shah", "bid": 54000, "date": "2025-04-02"},
        {"name": "Ravi S.", "bid": 49999, "date": "2025-04-01"},
      ],
    },
  },
  {
    "id": "f2",
    "name": "Apple MacBook Air M1 (2020)",
    "category": "Laptops",
    "condition": "Very Good",
    "originalPrice": 99900,
    "discountedPrice": 62999,
    "distance": 2.1,
    "seller": {
      "name": "TechBazar Mumbai",
      "isVerified": true,
      "rating": 4.9,
      "image": "https://randomuser.me/api/portraits/women/45.jpg",
    },
    "views": 589,
    "bids": 10,
    "description":
        "MacBook Air M1, 8GB RAM and 256GB SSD. Battery cycle count: 108. Used for online classes only. No dents or scratches.",
    "images": [
      "https://images.unsplash.com/photo-1611078489935-1d6be62a23ae",
      "https://images.unsplash.com/photo-1606813908183-8676cc19252c",
      "https://images.unsplash.com/photo-1611605698335-6e85f52b5e2c",
    ],
    "specs": {
      "RAM": "8GB",
      "Storage": "256GB SSD",
      "Processor": "Apple M1",
      "Battery Health": "91%",
      "Included": "Original box, charger",
    },
    "auction": {
      "endDate": "2025-04-11",
      "startingPrice": 55999,
      "currentBid": 61000,
      "bidders": [
        {"name": "Ayesha Qureshi", "bid": 61000, "date": "2025-04-05"},
        {"name": "Varun Joshi", "bid": 59500, "date": "2025-04-04"},
        {"name": "Mehul D.", "bid": 57500, "date": "2025-04-03"},
        {"name": "Shraddha G.", "bid": 56000, "date": "2025-04-02"},
        {"name": "Siddharth T.", "bid": 55999, "date": "2025-04-01"},
      ],
    },
  },
  {
    "id": "f3",
    "name": "OnePlus 9 Pro",
    "category": "Phones",
    "condition": "Good",
    "originalPrice": 64999,
    "discountedPrice": 33999,
    "distance": 5.8,
    "seller": {
      "name": "QuickSell Bengaluru",
      "isVerified": false,
      "rating": 4.3,
      "image": "https://randomuser.me/api/portraits/men/25.jpg",
    },
    "views": 289,
    "bids": 6,
    "description":
        "Used OnePlus 9 Pro in Morning Mist color. Screen in great condition, slight wear on back. OxygenOS updated. 12GB RAM, 256GB storage.",
    "images": [
      "https://images.unsplash.com/photo-1620121692029-d088224ddc8b",
      "https://images.unsplash.com/photo-1620845726613-2c4f82b7c6f1",
      "https://images.unsplash.com/photo-1619479307523-7214ba1a39d4",
    ],
    "specs": {
      "Storage": "256GB",
      "RAM": "12GB",
      "Battery Health": "87%",
      "Included": "Charger, silicone case",
    },
    "auction": {
      "endDate": "2025-04-09",
      "startingPrice": 28000,
      "currentBid": 32500,
      "bidders": [
        {"name": "Arun M.", "bid": 32500, "date": "2025-04-04"},
        {"name": "Preeti B.", "bid": 31000, "date": "2025-04-03"},
        {"name": "Rahul C.", "bid": 30000, "date": "2025-04-02"},
        {"name": "Sana K.", "bid": 29000, "date": "2025-04-01"},
        {"name": "Kunal V.", "bid": 28000, "date": "2025-03-31"},
      ],
    },
  },
  {
    "id": "f4",
    "name": "Dell Inspiron 5515 Ryzen 7",
    "category": "Laptops",
    "condition": "Very Good",
    "originalPrice": 77999,
    "discountedPrice": 48999,
    "distance": 1.9,
    "seller": {
      "name": "LappyZone Pune",
      "isVerified": true,
      "rating": 4.5,
      "image": "https://randomuser.me/api/portraits/men/36.jpg",
    },
    "views": 344,
    "bids": 7,
    "description":
        "Ryzen 7 5700U, 16GB RAM, 512GB SSD. 15.6-inch FHD. Great for programming or office use. Barely used, under warranty till Nov 2025.",
    "images": [
      "https://images.unsplash.com/photo-1611688437768-5c7b4ff3fcd5",
      "https://images.unsplash.com/photo-1618417942675-22bcd3b2874c",
      "https://images.unsplash.com/photo-1616529530273-bf9aa4f10a9c",
    ],
    "specs": {
      "Processor": "Ryzen 7 5700U",
      "RAM": "16GB",
      "Storage": "512GB SSD",
      "Warranty": "Valid till Nov 2025",
    },
    "auction": {
      "endDate": "2025-04-12",
      "startingPrice": 43000,
      "currentBid": 47000,
      "bidders": [
        {"name": "Ishaan R.", "bid": 47000, "date": "2025-04-05"},
        {"name": "Mitali J.", "bid": 46000, "date": "2025-04-04"},
        {"name": "Zaid A.", "bid": 45000, "date": "2025-04-03"},
        {"name": "Neeraj L.", "bid": 44000, "date": "2025-04-02"},
        {"name": "Tanvi B.", "bid": 43000, "date": "2025-04-01"},
      ],
    },
  },
  {
    "id": "f5",
    "name": "Sony WH-1000XM4 Headphones",
    "category": "Accessories",
    "condition": "Like New",
    "originalPrice": 29990,
    "discountedPrice": 16999,
    "distance": 4.3,
    "seller": {
      "name": "SoundGuys India",
      "isVerified": true,
      "rating": 4.6,
      "image": "https://randomuser.me/api/portraits/women/39.jpg",
    },
    "views": 258,
    "bids": 5,
    "description":
        "Top-rated noise cancelling headphones. Barely used. 30+ hour battery life. Bluetooth 5.0, fast charging supported.",
    "images": [
      "https://images.unsplash.com/photo-1617308783271-4267e12bb0b5",
      "https://images.unsplash.com/photo-1617151810218-4d1f76d1cfb1",
      "https://images.unsplash.com/photo-1622054063430-c0a8e2a31c4b",
    ],
    "specs": {
      "Battery Life": "30 hours",
      "Color": "Black",
      "Bluetooth": "5.0",
      "Included": "Carrying case, cable, airplane adapter",
    },
    "auction": {
      "endDate": "2025-04-13",
      "startingPrice": 14999,
      "currentBid": 16500,
      "bidders": [
        {"name": "Deepak S.", "bid": 16500, "date": "2025-04-05"},
        {"name": "Kavita R.", "bid": 16000, "date": "2025-04-04"},
        {"name": "Mayank V.", "bid": 15500, "date": "2025-04-03"},
        {"name": "Anjali T.", "bid": 15000, "date": "2025-04-02"},
        {"name": "Ujjwal G.", "bid": 14999, "date": "2025-04-01"},
      ],
    },
  },
];

// For You products
final List<Map<String, dynamic>> forYouProducts = [
  {
    "id": "u1",
    "name": "Realme Narzo 60 5G",
    "category": "Phones",
    "condition": "Like New",
    "originalPrice": 17999,
    "discountedPrice": 13499,
    "distance": 2.8,
    "seller": {
      "name": "MobileHub Hyderabad",
      "isVerified": true,
      "rating": 4.4,
      "image": "https://randomuser.me/api/portraits/men/44.jpg",
    },
    "views": 148,
    "bids": 3,
    "description":
        "Realme Narzo 60, 8GB RAM, 128GB storage. Used for under 3 months, still under warranty. 64MP camera, smooth AMOLED display.",
    "images": [
      "https://images.unsplash.com/photo-1681370420451-2848ef7d407b",
      "https://images.unsplash.com/photo-1681370393721-70cb19c55884",
      "https://images.unsplash.com/photo-1681370362874-f4d231ac602f",
    ],
    "specs": {
      "Storage": "128GB",
      "RAM": "8GB",
      "Camera": "64MP",
      "Warranty": "Until Dec 2025",
    },
    "auction": {
      "endDate": "2025-04-11",
      "startingPrice": 12000,
      "currentBid": 13499,
      "bidders": [
        {"name": "Nidhi A.", "bid": 13499, "date": "2025-04-05"},
        {"name": "Ajay N.", "bid": 12999, "date": "2025-04-04"},
        {"name": "Samar J.", "bid": 12000, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "u2",
    "name": "boAt Airdopes 141",
    "category": "Accessories",
    "condition": "Good",
    "originalPrice": 1499,
    "discountedPrice": 799,
    "distance": 1.1,
    "seller": {
      "name": "BargainDeals Surat",
      "isVerified": false,
      "rating": 4.0,
      "image": "https://randomuser.me/api/portraits/women/20.jpg",
    },
    "views": 201,
    "bids": 4,
    "description":
        "Working well. Airdopes 141, 42-hour battery backup. Comes with case, minor scratches. Great for budget-conscious users.",
    "images": [
      "https://images.unsplash.com/photo-1631628324173-3d17b924cdd0",
      "https://images.unsplash.com/photo-1631630324173-d17a5b3cd7a4",
      "https://images.unsplash.com/photo-1631629821347-44fc66f5bdf2",
    ],
    "specs": {
      "Battery Backup": "42 hours",
      "Type": "TWS",
      "Bluetooth": "5.1",
      "Included": "Charging case, cable",
    },
    "auction": {
      "endDate": "2025-04-10",
      "startingPrice": 600,
      "currentBid": 799,
      "bidders": [
        {"name": "Puneet M.", "bid": 799, "date": "2025-04-05"},
        {"name": "Anu S.", "bid": 750, "date": "2025-04-04"},
        {"name": "Ritu B.", "bid": 700, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "u3",
    "name": "HP LaserJet Pro MFP M126nw",
    "category": "Printers",
    "condition": "Very Good",
    "originalPrice": 18999,
    "discountedPrice": 10499,
    "distance": 3.9,
    "seller": {
      "name": "OfficeMart Jaipur",
      "isVerified": true,
      "rating": 4.6,
      "image": "https://randomuser.me/api/portraits/men/31.jpg",
    },
    "views": 93,
    "bids": 2,
    "description":
        "Multi-function monochrome laser printer. Great for home/office. Wireless and network printing. 1-year extended warranty.",
    "images": [
      "https://images.unsplash.com/photo-1611353523930-15a59f1b204b",
      "https://images.unsplash.com/photo-1621371107339-4b5b2e7f7a8d",
      "https://images.unsplash.com/photo-1632870241270-78006b8cfd90",
    ],
    "specs": {
      "Type": "Laser Monochrome",
      "Function": "Print, Scan, Copy",
      "Connectivity": "Wi-Fi, USB",
      "Warranty": "Until Jan 2026",
    },
    "auction": {
      "endDate": "2025-04-12",
      "startingPrice": 8999,
      "currentBid": 10499,
      "bidders": [
        {"name": "Gaurav N.", "bid": 10499, "date": "2025-04-05"},
        {"name": "Shweta R.", "bid": 9500, "date": "2025-04-04"},
      ],
    },
  },
  {
    "id": "u4",
    "name": "Mi TV Stick (Full HD)",
    "category": "Streaming Devices",
    "condition": "Like New",
    "originalPrice": 4499,
    "discountedPrice": 2699,
    "distance": 0.9,
    "seller": {
      "name": "SmartTech Lucknow",
      "isVerified": true,
      "rating": 4.2,
      "image": "https://randomuser.me/api/portraits/women/50.jpg",
    },
    "views": 122,
    "bids": 3,
    "description":
        "Full HD streaming device with Android TV 11. Comes with remote. Used for less than a month. Supports Netflix, Prime, Hotstar.",
    "images": [
      "https://images.unsplash.com/photo-1608036551340-386c4a4ec13a",
      "https://images.unsplash.com/photo-1608036579383-684b6d11ccff",
      "https://images.unsplash.com/photo-1608036562339-0981ec6849b7",
    ],
    "specs": {
      "Resolution": "1080p",
      "OS": "Android TV 11",
      "Included": "Remote, HDMI extender, charger",
    },
    "auction": {
      "endDate": "2025-04-09",
      "startingPrice": 2300,
      "currentBid": 2699,
      "bidders": [
        {"name": "Tushar D.", "bid": 2699, "date": "2025-04-05"},
        {"name": "Sana M.", "bid": 2500, "date": "2025-04-04"},
        {"name": "Manoj R.", "bid": 2300, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "u5",
    "name": "Canon EOS 1500D DSLR",
    "category": "Cameras",
    "condition": "Good",
    "originalPrice": 33999,
    "discountedPrice": 20999,
    "distance": 4.0,
    "seller": {
      "name": "LensTrade Kochi",
      "isVerified": false,
      "rating": 4.1,
      "image": "https://randomuser.me/api/portraits/men/29.jpg",
    },
    "views": 177,
    "bids": 5,
    "description":
        "18-55mm lens kit included. Ideal for beginner photography. Few scratches on lens hood. Comes with carry bag and battery charger.",
    "images": [
      "https://images.unsplash.com/photo-1581291519195-ef11498d1cf5",
      "https://images.unsplash.com/photo-1576015770281-466ecfca66e0",
      "https://images.unsplash.com/photo-1519183071298-a2962eade1d3",
    ],
    "specs": {
      "Lens": "18-55mm",
      "MP": "24.1MP",
      "Video": "Full HD",
      "Included": "Camera bag, charger, lens cap",
    },
    "auction": {
      "endDate": "2025-04-13",
      "startingPrice": 18000,
      "currentBid": 20999,
      "bidders": [
        {"name": "Bhavya T.", "bid": 20999, "date": "2025-04-05"},
        {"name": "Ankit S.", "bid": 20000, "date": "2025-04-04"},
        {"name": "Namrata L.", "bid": 19000, "date": "2025-04-03"},
        {"name": "Kishore M.", "bid": 18500, "date": "2025-04-02"},
        {"name": "Pallavi N.", "bid": 18000, "date": "2025-04-01"},
      ],
    },
  },
];

// Value for Money products
final List<Map<String, dynamic>> valueProducts = [
  {
    "id": "v1",
    "name": "Redmi Note 11",
    "category": "Phones",
    "condition": "Good",
    "originalPrice": 13999,
    "discountedPrice": 8499,
    "distance": 3.5,
    "seller": {
      "name": "BudgetMobiles Kolkata",
      "isVerified": true,
      "rating": 4.6,
      "image": "https://randomuser.me/api/portraits/men/21.jpg",
    },
    "views": 193,
    "bids": 3,
    "description":
        "Redmi Note 11, 6GB RAM, 128GB storage. AMOLED display with Snapdragon 680. Minor back scuffs, otherwise well maintained.",
    "images": [
      "https://images.unsplash.com/photo-1678457038210-0d0f82b9f30a",
      "https://images.unsplash.com/photo-1678457000504-31c6145c9ff3",
      "https://images.unsplash.com/photo-1678457082342-f23a4e0f8377",
    ],
    "specs": {
      "Display": "6.43\" AMOLED",
      "Storage": "128GB",
      "RAM": "6GB",
      "Battery": "5000mAh",
    },
    "auction": {
      "endDate": "2025-04-09",
      "startingPrice": 6999,
      "currentBid": 8499,
      "bidders": [
        {"name": "Farhan K.", "bid": 8499, "date": "2025-04-05"},
        {"name": "Priya J.", "bid": 8000, "date": "2025-04-04"},
        {"name": "Ankit M.", "bid": 6999, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "v2",
    "name": "HP Chromebook 14a",
    "category": "Laptops",
    "condition": "Very Good",
    "originalPrice": 29999,
    "discountedPrice": 16499,
    "distance": 4.1,
    "seller": {
      "name": "CampusTech Noida",
      "isVerified": true,
      "rating": 4.4,
      "image": "https://randomuser.me/api/portraits/women/19.jpg",
    },
    "views": 132,
    "bids": 2,
    "description":
        "HP Chromebook with Intel Celeron N4020, 4GB RAM, 64GB eMMC. Lightweight and perfect for students or browsing.",
    "images": [
      "https://images.unsplash.com/photo-1657722882094-04e6c2b90cd7",
      "https://images.unsplash.com/photo-1657722904410-0dfb303bb4b4",
      "https://images.unsplash.com/photo-1657722950137-dc97aa6f9072",
    ],
    "specs": {
      "Processor": "Intel Celeron N4020",
      "RAM": "4GB",
      "Storage": "64GB eMMC",
      "Battery": "10 hrs",
    },
    "auction": {
      "endDate": "2025-04-08",
      "startingPrice": 13999,
      "currentBid": 16499,
      "bidders": [
        {"name": "Manisha D.", "bid": 16499, "date": "2025-04-05"},
        {"name": "Ritik G.", "bid": 13999, "date": "2025-04-04"},
      ],
    },
  },
  {
    "id": "v3",
    "name": "boAt Airdopes 141",
    "category": "Audio",
    "condition": "Like New",
    "originalPrice": 1299,
    "discountedPrice": 749,
    "distance": 1.1,
    "seller": {
      "name": "QuickSell Jaipur",
      "isVerified": false,
      "rating": 4.2,
      "image": "https://randomuser.me/api/portraits/men/43.jpg",
    },
    "views": 88,
    "bids": 4,
    "description":
        "boAt Airdopes with up to 42 hrs playback. Almost new, only used twice. Type-C fast charging case included.",
    "images": [
      "https://images.unsplash.com/photo-1656813921734-b39297c9815b",
      "https://images.unsplash.com/photo-1656813922432-720e10cfdbeb",
      "https://images.unsplash.com/photo-1656813923111-275a04d92cf3",
    ],
    "specs": {
      "Battery Life": "42 hrs",
      "Charging": "Type-C",
      "Color": "Black",
      "Included": "Earbuds + Case",
    },
    "auction": {
      "endDate": "2025-04-10",
      "startingPrice": 499,
      "currentBid": 749,
      "bidders": [
        {"name": "Nikita A.", "bid": 749, "date": "2025-04-05"},
        {"name": "Deepak V.", "bid": 700, "date": "2025-04-04"},
        {"name": "Karan S.", "bid": 650, "date": "2025-04-03"},
        {"name": "Shalini Z.", "bid": 499, "date": "2025-04-02"},
      ],
    },
  },
  {
    "id": "v4",
    "name": "Lenovo Tab M10 HD 2nd Gen",
    "category": "Tablets",
    "condition": "Good",
    "originalPrice": 13999,
    "discountedPrice": 8999,
    "distance": 5.2,
    "seller": {
      "name": "eDeals Indore",
      "isVerified": true,
      "rating": 4.3,
      "image": "https://randomuser.me/api/portraits/women/50.jpg",
    },
    "views": 101,
    "bids": 2,
    "description":
        "10.1-inch HD display, 3GB RAM, 32GB storage. Great for media & basic browsing. Light scratches on the back.",
    "images": [
      "https://images.unsplash.com/photo-1619625591265-5b52bb7812a9",
      "https://images.unsplash.com/photo-1619625591352-9bc3e28727e3",
      "https://images.unsplash.com/photo-1619625591493-f23a5344aef6",
    ],
    "specs": {
      "Display": "10.1\" HD",
      "RAM": "3GB",
      "Storage": "32GB",
      "Battery": "5000mAh",
    },
    "auction": {
      "endDate": "2025-04-07",
      "startingPrice": 7499,
      "currentBid": 8999,
      "bidders": [
        {"name": "Raghav M.", "bid": 8999, "date": "2025-04-05"},
        {"name": "Asmita D.", "bid": 7499, "date": "2025-04-04"},
      ],
    },
  },
  {
    "id": "v5",
    "name": "Mi LED Smart TV 4A (32 inch)",
    "category": "Televisions",
    "condition": "Fair",
    "originalPrice": 15999,
    "discountedPrice": 10499,
    "distance": 3.0,
    "seller": {
      "name": "HomeDeals Hyderabad",
      "isVerified": true,
      "rating": 4.1,
      "image": "https://randomuser.me/api/portraits/men/28.jpg",
    },
    "views": 122,
    "bids": 3,
    "description":
        "Mi 4A Smart TV with PatchWall OS. Slight panel yellowing but functional. Good for kitchen or spare room setup.",
    "images": [
      "https://images.unsplash.com/photo-1665399229314-14dc97f253ed",
      "https://images.unsplash.com/photo-1665399271463-70e5734f7cf7",
      "https://images.unsplash.com/photo-1665399308321-6a79a4c4fd45",
    ],
    "specs": {
      "Resolution": "HD Ready",
      "OS": "PatchWall",
      "Size": "32 inch",
      "Ports": "2 HDMI, 2 USB",
    },
    "auction": {
      "endDate": "2025-04-09",
      "startingPrice": 8999,
      "currentBid": 10499,
      "bidders": [
        {"name": "Tarika B.", "bid": 10499, "date": "2025-04-05"},
        {"name": "Shubham P.", "bid": 9500, "date": "2025-04-04"},
        {"name": "Rahul S.", "bid": 8999, "date": "2025-04-03"},
      ],
    },
  },
];

// Trending products
final List<Map<String, dynamic>> trendingProducts = [
  {
    'id': 't1',
    'name': 'Nintendo Switch',
    'category': 'Gaming',
    'condition': 'Good',
    'originalPrice': 299.99,
    'discountedPrice': 219.99,
    'distance': 2.1,
    'seller': {
      'name': 'Game Exchange',
      'isVerified': true,
      'rating': 4.7,
      'image': 'https://randomuser.me/api/portraits/men/22.jpg',
    },
    'views': 312,
    'bids': 15,
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
    'name': 'DJI Mavic Air 2',
    'category': 'Cameras',
    'condition': 'Like New',
    'originalPrice': 799.99,
    'discountedPrice': 599.99,
    'distance': 4.2,
    'seller': {
      'name': 'Drone Depot',
      'isVerified': true,
      'rating': 4.3,
      'image': 'https://randomuser.me/api/portraits/women/42.jpg',
    },
    'views': 287,
    'bids': 9,
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
        {'name': 'Heather M.', 'bid': 165.00, 'date': '2023-05-11'},
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
      'image': 'https://randomuser.me/api/portraits/women/52.jpg',
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

// Premium products
final List<Map<String, dynamic>> premiumProducts = [
  {
    "id": "p1",
    "name": "MacBook Pro M1 (13-inch, 2021)",
    "category": "Laptops",
    "condition": "Excellent",
    "originalPrice": 122900,
    "discountedPrice": 84999,
    "distance": 2.2,
    "seller": {
      "name": "UrbanTech Mumbai",
      "isVerified": true,
      "rating": 4.9,
      "image": "https://randomuser.me/api/portraits/men/12.jpg",
    },
    "views": 285,
    "bids": 6,
    "description":
        "Hardly used MacBook Pro with Apple M1 chip, 8GB RAM, and 512GB SSD. Battery cycle count under 80. Ideal for creators and developers.",
    "images": [
      "https://images.unsplash.com/photo-1609921212029-57b1d8eae5fc",
      "https://images.unsplash.com/photo-1617920234126-8e5c91c3a6c4",
      "https://images.unsplash.com/photo-1630590947082-caa74699a4f4",
    ],
    "specs": {
      "Processor": "Apple M1",
      "RAM": "8GB",
      "Storage": "512GB SSD",
      "Battery": "Cycle Count: 78",
    },
    "auction": {
      "endDate": "2025-04-12",
      "startingPrice": 77999,
      "currentBid": 84999,
      "bidders": [
        {"name": "Riya S.", "bid": 84999, "date": "2025-04-05"},
        {"name": "Neeraj T.", "bid": 82000, "date": "2025-04-04"},
        {"name": "Mehul G.", "bid": 79999, "date": "2025-04-03"},
        {"name": "Tarun V.", "bid": 78500, "date": "2025-04-02"},
        {"name": "Vani R.", "bid": 77999, "date": "2025-04-01"},
      ],
    },
  },
  {
    "id": "p2",
    "name": "Samsung Galaxy Z Fold4",
    "category": "Phones",
    "condition": "Very Good",
    "originalPrice": 154999,
    "discountedPrice": 98999,
    "distance": 5.0,
    "seller": {
      "name": "GalaxyResale Bangalore",
      "isVerified": true,
      "rating": 4.7,
      "image": "https://randomuser.me/api/portraits/men/16.jpg",
    },
    "views": 233,
    "bids": 4,
    "description":
        "Fold4, Phantom Black, 256GB. Slight bend crease but no functional issues. Used for 9 months, includes box & charger.",
    "images": [
      "https://images.unsplash.com/photo-1676881414721-febd9c2a9d5b",
      "https://images.unsplash.com/photo-1676939237130-6dbbb91b42e7",
      "https://images.unsplash.com/photo-1676941203156-87d06b6abf25",
    ],
    "specs": {
      "Storage": "256GB",
      "Color": "Phantom Black",
      "Condition": "Light usage",
      "Included": "Box, charger",
    },
    "auction": {
      "endDate": "2025-04-11",
      "startingPrice": 89999,
      "currentBid": 98999,
      "bidders": [
        {"name": "Siddharth J.", "bid": 98999, "date": "2025-04-05"},
        {"name": "Lavanya D.", "bid": 95000, "date": "2025-04-04"},
        {"name": "Hitesh K.", "bid": 92500, "date": "2025-04-03"},
        {"name": "Parag R.", "bid": 89999, "date": "2025-04-02"},
      ],
    },
  },
  {
    "id": "p3",
    "name": "iPad Pro 11 (M2, WiFi + Cellular)",
    "category": "Tablets",
    "condition": "Like New",
    "originalPrice": 106900,
    "discountedPrice": 79999,
    "distance": 3.1,
    "seller": {
      "name": "AppleDeals Delhi",
      "isVerified": true,
      "rating": 4.8,
      "image": "https://randomuser.me/api/portraits/women/41.jpg",
    },
    "views": 177,
    "bids": 3,
    "description":
        "iPad Pro 11-inch (M2, 128GB), Silver. Barely used. No dents or scratches. Great for productivity and entertainment. Includes Smart Folio cover.",
    "images": [
      "https://images.unsplash.com/photo-1637481092503-e28b4e4f3c4c",
      "https://images.unsplash.com/photo-1646383180384-7a098dbff2dc",
      "https://images.unsplash.com/photo-1640306742645-79cc15b9bd88",
    ],
    "specs": {
      "Processor": "Apple M2",
      "Storage": "128GB",
      "Connectivity": "WiFi + Cellular",
      "Included": "Smart Folio",
    },
    "auction": {
      "endDate": "2025-04-10",
      "startingPrice": 74999,
      "currentBid": 79999,
      "bidders": [
        {"name": "Vaibhav S.", "bid": 79999, "date": "2025-04-05"},
        {"name": "Meera T.", "bid": 77000, "date": "2025-04-04"},
        {"name": "Yash P.", "bid": 74999, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "p4",
    "name": "Sony WH-1000XM5",
    "category": "Audio",
    "condition": "Excellent",
    "originalPrice": 29990,
    "discountedPrice": 21999,
    "distance": 2.5,
    "seller": {
      "name": "SoundLab Pune",
      "isVerified": false,
      "rating": 4.5,
      "image": "https://randomuser.me/api/portraits/men/39.jpg",
    },
    "views": 141,
    "bids": 4,
    "description":
        "Industry-leading noise cancelling headphones. Excellent sound quality. Comes with carry case and Type-C cable.",
    "images": [
      "https://images.unsplash.com/photo-1651142745155-ccdf6c6a3c4f",
      "https://images.unsplash.com/photo-1651152093487-61d236c5ab8c",
      "https://images.unsplash.com/photo-1651162236494-c8456c898c3d",
    ],
    "specs": {
      "Battery Life": "30 hrs",
      "Connectivity": "Bluetooth 5.2",
      "Included": "Case, cable",
    },
    "auction": {
      "endDate": "2025-04-10",
      "startingPrice": 18999,
      "currentBid": 21999,
      "bidders": [
        {"name": "Ayesha R.", "bid": 21999, "date": "2025-04-05"},
        {"name": "Dev N.", "bid": 20999, "date": "2025-04-04"},
        {"name": "Rehan M.", "bid": 18999, "date": "2025-04-03"},
      ],
    },
  },
  {
    "id": "p5",
    "name": "Dell XPS 13 Plus (12th Gen i7)",
    "category": "Laptops",
    "condition": "Very Good",
    "originalPrice": 151990,
    "discountedPrice": 99999,
    "distance": 4.6,
    "seller": {
      "name": "TechBazaar Ahmedabad",
      "isVerified": true,
      "rating": 4.9,
      "image": "https://randomuser.me/api/portraits/women/37.jpg",
    },
    "views": 263,
    "bids": 5,
    "description":
        "Sleek premium laptop with edge-to-edge keyboard, 16GB RAM, 1TB SSD. Light usage, ideal for design and productivity.",
    "images": [
      "https://images.unsplash.com/photo-1605554244621-4f9bbdb94ba2",
      "https://images.unsplash.com/photo-1605554521567-3b10a94f964c",
      "https://images.unsplash.com/photo-1605554778652-5b60b37f5b14",
    ],
    "specs": {
      "Processor": "Intel Core i7-1260P",
      "RAM": "16GB",
      "Storage": "1TB SSD",
      "Battery": "10+ hrs",
    },
    "auction": {
      "endDate": "2025-04-13",
      "startingPrice": 89999,
      "currentBid": 99999,
      "bidders": [
        {"name": "Imran F.", "bid": 99999, "date": "2025-04-05"},
        {"name": "Payal G.", "bid": 96000, "date": "2025-04-04"},
        {"name": "Ashwin K.", "bid": 93000, "date": "2025-04-03"},
        {"name": "Nilesh T.", "bid": 91000, "date": "2025-04-02"},
        {"name": "Ragini B.", "bid": 89999, "date": "2025-04-01"},
      ],
    },
  },
];
