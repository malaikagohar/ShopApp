const categoriesData = [mobile, laptop, camera, tv, home, music, book, game];

const mobile = [
  {
    'id': 'M01',
    'title': 'Infinix Hot 12',
    'Amount': 139,
    'image':
        'https://cdn.homeshopping.pk/product_images/y/157/Infinix-Hot-12-Play__02546_zoom.jpg',
  },
  {
    'id': 'M02',
    'title': 'Samsung Galaxy A32',
    'Amount': 184,
    'image':
        'https://cdn.homeshopping.pk/product_images/l/957/samsung_galaxy_a32_6gb_ram_128gb_-_awesome_violet_vlzawuxjcbwacm8r_1__83723_zoom.jpg',
  },
  {
    'id': 'M03',
    'title': 'Oppo A54',
    'Amount': 145,
    'image':
        'https://cdn.homeshopping.pk/product_images/k/481/Oppo-A54-Crystal-Black-2__98711_zoom.png'
  },
  {
    'id': 'M04',
    'title': 'Apple iPhone 13 Pro Max',
    'Amount': 140,
    'image':
        'https://cdn.homeshopping.pk/product_images/w/072/61D84NtVgVL._FM__84853_zoom.jpg'
  },
  {
    'id': 'M05',
    'title': 'Oppo A15',
    'Amount': 96,
    'image':
        'https://cdn.homeshopping.pk/product_images/d/451/aaaa-500x500__73877_zoom.jpg'
  },
  {
    'id': 'M06',
    'title': 'Samsung Galaxy S22 Ultra',
    'Amount': 1280,
    'image':
        'https://cdn.homeshopping.pk/product_images/b/112/1930546-01__06489_zoom.jpg'
  },
  {
    'id': 'M07',
    'title': 'Infinix Hot 12 Play',
    'Amount': 12,
    'image':
        'https://cdn.homeshopping.pk/product_images/o/618/c2VydmljZT1pbWFnZXMmc3JjPWh0dHBzJTNBJTJGJTJGaGlydW1vYmlsZS5sayUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAyMSUyRjAzJTJGQmx1ZS5wbmcmY2FjaGVNYXJrZXI9MTYyMjk2ODAxMi0zOTM0MTcmdG9rZW49OTgyMTI1OTVkMGFiMmJjNg.q__04732_zoom.png'
  },
  {
    'id': 'M08',
    'title': 'Nokia 3.4',
    'Amount': 139,
    'image':
        'https://cdn.homeshopping.pk/product_images/k/928/Nokia-3.4-Charcoal__18846_zoom.png'
  },
];

const laptop = [
  {
    'id': 'L01',
    'title': 'Acer Chromebook',
    'Amount': 80,
    'image':
        'https://cdn.homeshopping.pk/product_images/p/069/718NbWIJgFL._SL1159___74667_zoom.jpg'
  },
  {
    'id': 'L02',
    'title': 'Lenovo ThinkPad L410',
    'Amount': 265,
    'image':
        'https://cdn.homeshopping.pk/product_images/h/260/lenovo-thinkpad-e15-hero-1126__34453_zoom.png'
  },
  {
    'id': 'L03',
    'title': 'Dell Latitude',
    'Amount': 640,
    'image':
        'https://cdn.homeshopping.pk/product_images/r/568/la9520nt_cnb_00055lf110_gy_5000x5000_gettyimages-1088317948_revised__64888_zoom.png'
  },
  {
    'id': 'L04',
    'title': 'Apple MacBook Pro 13"',
    'Amount': 1120,
    'image':
        'https://cdn.homeshopping.pk/product_images/u/890/product_127404_2_thumb__56304_zoom.gif'
  },
  {
    'id': 'L05',
    'title': 'Razer Blade 17',
    'Amount': 2040,
    'image':
        'https://cdn.homeshopping.pk/product_images/t/831/711cfLB8gzL._AC_SL1500___09150_zoom.jpg'
  },
  {
    'id': 'L06',
    'title': 'Apple MacBook Air',
    'Amount': 1290,
    'image':
        'https://cdn.homeshopping.pk/product_images/r/095/macbook-air-spacegray2-600x461__52855_zoom.jpg'
  },
  {
    'id': 'L07',
    'title': 'Microsoft - Surface Pro 7+',
    'Amount': 970,
    'image':
        'https://cdn.homeshopping.pk/product_images/z/318/Microsoft-Surface-Laptop-Go-12.4inch__16620_zoom.jpg'
  },
  {
    'id': 'L08',
    'title': 'Razer Blade 15 Advance',
    'Amount': 2170,
    'image':
        'https://cdn.homeshopping.pk/product_images/l/394/lg_2hB0HocAcmzdkDKMKq2WMskTz6J7YzVG4JeimYNc__68894_zoom.gif'
  },
];

const camera = [
  {
    'id': 'M01',
    'title': 'Canon IXUS Digital Camera',
    'Amount': 450,
    'image':
        'https://cdn.homeshopping.pk/product_images/r/102/sdgdfgsddfgdf__86856_zoom.png'
  },
  {
    'id': 'M02',
    'title': 'Sony Mirrorless Digital Camera',
    'Amount': 250,
    'image':
        'https://cdn.homeshopping.pk/product_images/w/923/1519677934_1394217__17276_zoom.jpg'
  },
  {
    'id': 'M03',
    'title': 'Sony Mirror+ Digital Camera',
    'Amount': 375,
    'image':
        'https://cdn.homeshopping.pk/product_images/v/043/xA6400L-2.jpg.pagespeed.ic.aa8Z-7ll-c__74155_zoom.jpg'
  },
  {
    'id': 'M04',
    'title': 'Sony Digital Camera',
    'Amount': 175,
    'image':
        'https://cdn.homeshopping.pk/product_images/c/380/61fIEs7CAuL._SL1200___41173_zoom.jpg'
  },
  {
    'id': 'M05',
    'title': 'GoPro Sleeve + Lanyard',
    'Amount': 99,
    'image':
        'https://cdn.homeshopping.pk/product_images/k/254/1528903884_IMG_1006471__69455_zoom.jpg'
  },
  {
    'id': 'M06',
    'title': 'Yuneec Typhoon',
    'Amount': 1250,
    'image':
        'https://cdn.homeshopping.pk/product_images/p/597/4184lbBW6XL__07894_zoom.jpg'
  },
  {
    'id': 'M07',
    'title': 'Dji Mavic Air 2 Combo',
    'Amount': 165,
    'image':
        'https://cdn.homeshopping.pk/product_images/n/507/1588074657_1558185__32450_zoom.jpg'
  },
  {
    'id': 'M08',
    'title': 'DJI Air 2S Quadcopter Drone',
    'Amount': 3999,
    'image':
        'https://cdn.homeshopping.pk/product_images/w/128/61OQEmuM6hL._AC_SL1500___95419_zoom.jpg'
  },
];

const tv = [
  {
    'id': 'T01',
    'title': 'Haier 40" LED TV',
    'Amount': 236,
    'image':
        'https://cdn.homeshopping.pk/product_images/j/224/le40k6600g_-_blackbox__54733_zoom.jpg'
  },
  {
    'id': 'T02',
    'title': 'Samsung 40" Led TV',
    'Amount': 269,
    'image':
        'https://cdn.homeshopping.pk/product_images/x/127/ezgif.com-gif-maker_%288%29__13794_zoom.jpg'
  },
  {
    'id': 'T03',
    'title': 'Sony 40" Led Tv',
    'Amount': 295,
    'image':
        'https://cdn.homeshopping.pk/product_images/j/094/Untitled722__03367_zoom.jpg'
  },
  {
    'id': 'T04',
    'title': 'Haier 40" Smart LED/TV',
    'Amount': 230,
    'image':
        'https://cdn.homeshopping.pk/product_images/a/198/L5__34447_zoom.jpg'
  },
  {
    'id': 'T05',
    'title': 'EcoStar 75" Smart LED TV',
    'Amount': 965,
    'image':
        'https://cdn.homeshopping.pk/product_images/a/309/CX-75UD921__59490_zoom.png'
  },
  {
    'id': 'T06',
    'title': 'Haier Smart LED TV 32″',
    'Amount': 125,
    'image':
        'https://cdn.homeshopping.pk/product_images/i/835/haier-led__96678_zoom.jpg'
  },
  {
    'id': 'T07',
    'title': 'Itel 55" LED TV',
    'Amount': 2450,
    'image':
        'https://cdn.homeshopping.pk/product_images/o/681/G551-04-Right__35114_zoom.jpg'
  },
  {
    'id': 'T08',
    'title': 'Samsung 37" LED TV',
    'Amount': 315,
    'image':
        'https://cdn.homeshopping.pk/product_images/k/792/samsung-ua-37c5000-multisystem-led-for-110-240-volts-32__81256_zoom.gif'
  },
];

const home = [
  {
    'id': 'H01',
    'title': 'Pel Refrigerator',
    'Amount': 180,
    'image':
        'https://cdn.homeshopping.pk/product_images/p/540/GDPB-2__29692_zoom.jpg'
  },
  {
    'id': 'H02',
    'title': 'Dawlance Enercon Inverter',
    'Amount': 510,
    'image':
        'https://cdn.homeshopping.pk/product_images/c/953/Enercon-Inverter__24732_zoom.jpg'
  },
  {
    'id': 'H03',
    'title': 'Boss Spin Dryer Machine',
    'Amount': 90,
    'image':
        'https://cdn.homeshopping.pk/product_images/u/555/5500-min__40005_zoom.jpg'
  },
  {
    'id': 'H04',
    'title': 'Dawlance Inverter Automatic',
    'Amount': 430,
    'image':
        'https://cdn.homeshopping.pk/product_images/c/634/dawlance-front-load-fully-automatic-washing-machine-8kg-_dwf-8400s-inv__1__64227_zoom.jpg'
  },
  {
    'id': 'H05',
    'title': 'Haier Water Dispenser',
    'Amount': 128,
    'image':
        'https://cdn.homeshopping.pk/product_images/d/672/hwd-r__58774_zoom.jpg'
  },
  {
    'id': 'H06',
    'title': 'Kenwood Mill Blender',
    'Amount': 50,
    'image':
        'https://cdn.homeshopping.pk/product_images/x/421/1-117-600x600-1__43138_zoom.jpg'
  },
  {
    'id': 'H07',
    'title': 'Westpoint Sandwich Maker',
    'Amount': 30,
    'image':
        'https://cdn.homeshopping.pk/product_images/e/215-sandwich-maker-wf-6193-310x310__99800_zoom.gif'
  },
  {
    'id': 'H08',
    'title': 'Anex Slice Toaster',
    'Amount': 20,
    'image':
        'https://cdn.homeshopping.pk/product_images/m/701/anex-2-slice-toaster-_ag-3017__1__95186_zoom.jpg'
  },
];

const music = [
  {
    'id': 'U01',
    'title': 'Yamaha Acoustic Guitar',
    'Amount': 230,
    'image':
        'https://cdn.homeshopping.pk/product_images/l/366/ad6f17885813d95521d42d383aa9c34e31850076_Yamaha_F310T_Acoustic_Guitar-1-600x600-1000x1000__70993_zoom.jpg'
  },
  {
    'id': 'U02',
    'title': 'Yamaha Portable Keyboard',
    'Amount': 415,
    'image':
        'https://cdn.homeshopping.pk/product_images/h/346/1__94058_zoom.jpg'
  },
  {
    'id': 'U03',
    'title': 'Epiphone Acoustic Guitar',
    'Amount': 200,
    'image':
        'https://cdn.homeshopping.pk/product_images/b/652/EAFTEBCH3__70064_zoom.jpg'
  },
  {
    'id': 'U04',
    'title': 'Samson Carbon 49',
    'Amount': 125,
    'image':
        'https://cdn.homeshopping.pk/product_images/w/524/Carbon49_beauty_angle1__92936_zoom.jpg'
  },
  {
    'id': 'U05',
    'title': 'Epiphone 50s Electric',
    'Amount': 915,
    'image':
        'https://cdn.homeshopping.pk/product_images/o/039/ENSVHSVCH1-a-510x510__27092_zoom.jpg'
  },
  {
    'id': 'U06',
    'title': 'ICON iKeyboard 6X',
    'Amount': 175,
    'image':
        'https://cdn.homeshopping.pk/product_images/x/849/iKeyboard6X-Front__88683_zoom.jpg'
  },
  {
    'id': 'U07',
    'title': 'M-Audio Oxygen Pro Keyboard',
    'Amount': 285,
    'image':
        'https://cdn.homeshopping.pk/product_images/m/697/Oxygen-49-web-1-600x800__89467_zoom.png'
  },
  {
    'id': 'U08',
    'title': 'Yamaha Electric Guitar',
    'Amount': 330,
    'image':
        'https://cdn.homeshopping.pk/product_images/d/309/ERG121GPII-Black__49483_zoom.jpg'
  },
];

const book = [
  {
    'id': 'B01',
    'title': '12 Rules for Life',
    'Amount': 20,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/10/12-Rules-for-Life-By-Jordan-Peterson.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B02',
    'title': '50 Economics Classics',
    'Amount': 10,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2021/02/50-Economics-Classics-Your-shortcut-to-the-most-important-ideas-on-capitalism-finance-and-the-global-economy-50-Classics-By-Tom-Butler-Bowdon.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B03',
    'title': 'A Christmas Carol',
    'Amount': 5,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/10/A-Christmas-Carol-By-Charles-Dickens.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B04',
    'title': 'A Mirrored Life The Rumi',
    'Amount': 5,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/10/A-Mirrored-Life-The-Rumi-By-Rabisankar-Bal.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B05',
    'title': 'Black Milk',
    'Amount': 7,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/10/Black-Milk-By-Elif-Shafak.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B06',
    'title': 'Medicine of the Prophet',
    'Amount': 5,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/12/Medicine-of-the-Prophet-By-Ibn-Qayyim-Al-Jawziyya.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B07',
    'title': 'Diary Of A Wimpy Kid',
    'Amount': 4,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2020/10/A-Novel-In-Cartoons.jpg?fit=1500%2C1150&ssl=1'
  },
  {
    'id': 'B08',
    'title': 'The Forty Rules of Love',
    'Amount': 3,
    'image':
        'https://i0.wp.com/www.onlinebookshop.pk/wp-content/uploads/2019/09/The-Forty-Rules-of-Love-By-Elif-Shafak.jpg?fit=1500%2C1150&ssl=1'
  },
];

const game = [
  {
    'id': 'G01',
    'title': 'Vertical Stand For Xbox One',
    'Amount': 12,
    'image':
        'https://cdn.homeshopping.pk/product_images/i/684/c27f451cfc47494ab1da25af6f11401d__58077_zoom.jpg'
  },
  {
    'id': 'G02',
    'title': 'Need for Speed Payback',
    'Amount': 15,
    'image':
        'https://cdn.homeshopping.pk/product_images/e/925/need-for-speed-payback-ps4_1496406119595__36321_zoom.jpg'
  },
  {
    'id': 'G03',
    'title': 'Marvel\'s Spider-Man Game',
    'Amount': 20,
    'image':
        'https://cdn.homeshopping.pk/product_images/w/933/81CNtYAtQ8L._AC_SL1500___23543_zoom.jpg'
  },
  {
    'id': 'G04',
    'title': 'Nintendo - Pro Wireless Controller',
    'Amount': 120,
    'image':
        'https://cdn.homeshopping.pk/product_images/i/156/71uUs057AmL._AC_SL1500___51012_zoom.jpg'
  },
  {
    'id': 'G05',
    'title': 'Nintendo Switch Lite',
    'Amount': 312,
    'image':
        'https://cdn.homeshopping.pk/product_images/g/448/19cb1d6749eb61ae97158f70e13feda7__38429_zoom.jpg'
  },
  {
    'id': 'G06',
    'title': 'Xbox  Wireless Controller',
    'Amount': 75,
    'image':
        'https://cdn.homeshopping.pk/product_images/q/751/black__05553_zoom.jpg'
  },
  {
    'id': 'G07',
    'title': 'SEGA Sonic -Xbox One',
    'Amount': 40,
    'image':
        'https://cdn.homeshopping.pk/product_images/o/368/5b40a91403dd614db2830f9c9959ca10__90100_zoom.jpg'
  },
  {
    'id': 'G08',
    'title': 'A disney Pixar Adventure',
    'Amount': 45,
    'image':
        'https://cdn.homeshopping.pk/product_images/g/058/d810fbfd44df25bfccf8f4e350a97234__41328_zoom.jpg'
  },
];
