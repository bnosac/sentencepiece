.bpemb <- list()
.bpemb$wikicode <- c('mt', 'sd', 'cr', 'ba', 'ht', 'scn', 'bi', 'stq', 'sm', 'diq', 'no', 'yi', 'vec', 'bug', 'am', 'tl', 'mn', 'atj', 'ko', 'mai', 'lij', 'tcy', 'sl', 'bn', 'dv', 'rm', 'ng', 'ml', 'kg', 'koi', 'war', 'et', 'mhr', 'als', 'bar', 'ii', 'sco', 'got', 'pnb', 'ss', 'bpy', 'tum', 'ru', 'qu', 'hy', 'tw', 'bm', 'vep', 'dty', 'udm', 'gd', 'lbe', 'rmy', 'azb', 'kw', 'ja', 'wuu', 'pag', 'ro', 'tet', 'ee', 'min', 'su', 'ha', 'glk', 'pcd', 'tk', 'nrm', 'ku', 'gn', 'ty', 'bh', 'pap', 'fr', 'ia', 'cs', 'ky', 'ff', 'kab', 'rn', 'csb', 'tt', 'cy', 'ilo', 'kaa', 'hif', 'ak', 'pa', 'crh', 'ti', 'myv', 'ur', 'se', 'uz', 'cdo', 'lez', 'srn', 'kk', 'pih', 'de', 'an', 'tyv', 'ext', 'gan', 'wo', 'si', 'lmo', 'hak', 'az', 'ka', 'ik', 'frr', 'hsb', 'ho', 'af', 'nds', 'pam', 'el', 'fur', 'cu', 'hr', 'my', 'nl', 'da', 'ch', 'vls', 'es', 'as', 'lt', 'ny', 'so', 'oc', 'lad', 'pnt', 'ms', 'bcl', 'os', 'co', 'ks', 'or', 'ay', 'wa', 'nah', 'fa', 'pl', 'mzn', 'za', 'th', 'fj', 'kbp', 'be', 'zh', 'ce', 'sh', 'sr', 'id', 'chy', 'ps', 'lo', 'tr', 'st', 'he', 'ang', 'sah', 'io', 'gom', 'ki', 'sn', 'kbd', 'jam', 'bo', 'pms', 'sk', 'kv', 'ckb', 'nv', 'dsb', 'zea', 'xmf', 'fi', 'ltg', 'ksh', 've', 'new', 'na', 'jv', 'tn', 'sw', 'rw', 'ln', 'bs', 'gag', 'ab', 'olo', 'is', 'bjn', 'ceb', 'om', 'vi', 'ast', 'uk', 'mg', 'mwl', 'arz', 'li', 'mrj', 'yo', 'frp', 'gl', 'la', 'km', 'sv', 'nap', 'jbo', 'bxr', 'gv', 'br', 'fo', 'ug', 'pi', 'bg', 'ie', 'din', 'sa', 'pdc', 'cho', 'lb', 'ig', 'aa', 'sc', 'fy', 'kj', 'eo', 'eu', 'kl', 'sq', 'to', 'mi', 'tpi', 'kr', 'hi', 'arc', 'ga', 'nov', 'mdf', 'vo', 'pfl', 'rue', 'haw', 'kn', 'mh', 'mr', 'te', 'ca', 'ace', 'cv', 'zu', 'it', 'iu', 'av', 'sg', 'hz', 'lv', 'ts', 'lrc', 'ar', 'hu', 'nn', 'nso', 'krc', 'mk', 'tg', 'ne', 'dz', 'ta', 'mus', 'ady', 'en', 'lg', 'xal', 'gu', 'pt', 'xh', 'szl', 'chr')
.bpemb$wikicode <- sort(.bpemb$wikicode)
.bpemb$languages <- list('afr'='af', 'als'='als', 'ang'='ang', 'bar'='bar', 'dan'='da', 'deu'='de', 'eng'='en', 'fao'='fo', 'frr'='frr', 'fry'='fy', 'got'='got', 'isl'='is', 'ksh'='ksh', 'ltz'='lb', 'lim'='li', 'nds'='nds', 'nld'='nl', 'nno'='nn', 'nor'='no', 'pdc'='pdc', 'pfl'='pfl', 'sco'='sco', 'stq'='stq', 'swe'='sv', 'vls'='vls', 'yid'='yi', 'zea'='zea', 'arg'='an', 'ast'='ast', 'cat'='ca', 'cos'='co', 'spa'='es', 'ext'='ext', 'fra'='fr', 'frp'='frp', 'fur'='fur', 'glg'='gl', 'ita'='it', 'lat'='la', 'lad'='lad', 'lij'='lij', 'lmo'='lmo', 'mwl'='mwl', 'nap'='nap', 'nrm'='nrm', 'oci'='oc', 'pcd'='pcd', 'por'='pt', 'pms'='pms', 'ron'='ro', 'roh'='rm', 'srd'='sc', 'scn'='scn', 'vec'='vec', 'wln'='wa', 'bel'='be', 'bul'='bg', 'bos'='bs', 'ces'='cs', 'csb'='csb', 'chu'='cu', 'dsb'='dsb', 'hrv'='hr', 'hsb'='hsb', 'mkd'='mk', 'pol'='pl', 'rus'='ru', 'rue'='rue', 'slv'='sl', 'srp'='sr', 'slk'='sk', 'szl'='szl', 'ukr'='uk', 'bcl'='bcl', 'ceb'='ceb', 'ilo'='ilo', 'pag'='pag', 'pam'='pam', 'tgl'='tl', 'war'='war', 'khm'='km', 'vie'='vi', 'jpn'='ja', 'ace'='ace', 'bug'='bug', 'bjn'='bjn', 'cha'='ch', 'ind'='id', 'jav'='jv', 'min'='min', 'msa'='ms', 'sun'='su', 'cdo'='cdo', 'gan'='gan', 'hak'='hak', 'wuu'='wuu', 'zho'='zh', 'aze'='az', 'azb'='azb', 'bak'='ba', 'crh'='crh', 'chv'='cv', 'gag'='gag', 'kaa'='kaa', 'kaz'='kk', 'krc'='krc', 'kir'='ky', 'sah'='sah', 'tuk'='tk', 'tur'='tr', 'tat'='tt', 'tyv'='tyv', 'uig'='ug', 'uzb'='uz', 'ara'='ar', 'heb'='he', 'amh'='am', 'arz'='arz', 'mlt'='mt', 'arc'='arc', 'tir'='ti', 'ckb'='ckb', 'diq'='diq', 'fas'='fa', 'glk'='glk', 'lrc'='lrc', 'kur'='ku', 'mzn'='mzn', 'oss'='os', 'pus'='ps', 'tgk'='tg', 'fin'='fi', 'est'='et', 'sme'='se', 'mrj'='mrj', 'kom'='kv', 'koi'='koi', 'udm'='udm', 'mhr'='mhr', 'vep'='vep', 'myv'='myv', 'mdf'='mdf', 'asm'='as', 'bpy'='bpy', 'bih'='bh', 'ben'='bn', 'div'='dv', 'gom'='gom', 'guj'='gu', 'hin'='hi', 'hif'='hif', 'mar'='mr', 'kas'='ks', 'nep'='ne', 'dty'='dty', 'ori'='or', 'pan'='pa', 'pli'='pi', 'pnb'='pnb', 'rmy'='rmy', 'mai'='mai', 'san'='sa', 'snd'='sd', 'sin'='si', 'urd'='ur', 'epo'='eo', 'ina'='ia', 'ile'='ie', 'ido'='io', 'jbo'='jbo', 'nov'='nov', 'vol'='vo', 'kor'='ko', 'hun'='hu', 'lit'='lt', 'ltg'='ltg', 'lav'='lv', 'eus'='eu', 'kan'='kn', 'mal'='ml', 'tam'='ta', 'tel'='te', 'bre'='br', 'cym'='cy', 'gle'='ga', 'gla'='gd', 'glv'='gv', 'cor'='kw', 'hye'='hy', 'bod'='bo', 'dzo'='dz', 'mya'='my', 'new'='new', 'ell'='el', 'pnt'='pnt', 'kat'='ka', 'xmf'='xmf', 'lao'='lo', 'tha'='th', 'zha'='za', 'ava'='av', 'che'='ce', 'lez'='lez', 'lbe'='lbe', 'mlg'='mg', 'hat'='ht', 'pap'='pap', 'sqi'='sq', 'kon'='kg', 'kik'='ki', 'lin'='ln', 'lug'='lg', 'nso'='nso', 'nya'='ny', 'run'='rn', 'kin'='rw', 'sna'='sn', 'ssw'='ss', 'swa'='sw', 'tsn'='tn', 'sot'='st', 'tso'='ts', 'tum'='tum', 'ven'='ve', 'xho'='xh', 'zul'='zu', 'yor'='yo', 'que'='qu', 'bxr'='bxr', 'mon'='mn', 'xal'='xal', 'haw'='haw', 'mri'='mi', 'smo'='sm', 'ton'='to', 'tah'='ty', 'nah'='nah', 'orm'='om', 'som'='so', 'aym'='ay', 'bis'='bi', 'pih'='pih', 'srn'='srn', 'tpi'='tpi', 'grn'='gn', 'nav'='nv', 'abk'='ab', 'kbd'='kbd', 'kab'='kab', 'ipk'='ik', 'iku'='iu', 'kal'='kl', 'hau'='ha', 'tet'='tet', 'nau'='na', 'ful'='ff', 'wol'='wo', 'aka'='ak', 'ewe'='ee', 'twi'='tw', 'ibo'='ig', 'chy'='chy', 'cre'='cr', 'chr'='chr', 'bam'='bm', 'fij'='fj', 'sag'='sg', 'aar'='aa', 'her'='hz', 'hmo'='ho', 'kau'='kr', 'mus'='mus', 'ndo'='ng', 'kua'='kj', 'ady'='ady', 'cho'='cho', 'mah'='mh', 'iii'='ii', 'jam'='jam', 'tcy'='tcy', 'olo'='olo', 'kbp'='kbp', 'din'='din', 'atj'='atj', 'hbs'='sh', 'gsw'='als', 
                   'Afrikaans'='af', 'Alemannic'='als', 'Anglo-Saxon'='ang', 'Bavarian'='bar', 'Danish'='da', 'German'='de', 'English'='en', 'Faroese'='fo', 'NorthFrisian'='frr', 'WestFrisian'='fy', 'Gothic'='got', 'Icelandic'='is', 'Ripuarian'='ksh', 'Luxembourgish'='lb', 'Limburgish'='li', 'LowSaxon'='nds', 'Dutch'='nl', 'Norwegian(Nynorsk)'='nn', 'Norwegian(Bokm\u00e5l)'='no', 'PennsylvaniaGerman'='pdc', 'PalatinateGerman'='pfl', 'Scots'='sco', 'SaterlandFrisian'='stq', 'Swedish'='sv', 'WestFlemish'='vls', 'Yiddish'='yi', 'Zeelandic'='zea', 'Aragonese'='an', 'Asturian'='ast', 'Catalan'='ca', 'Corsican'='co', 'Spanish'='es', 'Extremaduran'='ext', 'French'='fr', 'Franco-Proven\u00e7al'='frp', 'Friulian'='fur', 'Galician'='gl', 'Italian'='it', 'Latin'='la', 'Ladino'='lad', 'Ligurian'='lij', 'Lombard'='lmo', 'Mirandese'='mwl', 'Neapolitan'='nap', 'Norman'='nrm', 'Occitan'='oc', 'Picard'='pcd', 'Portuguese'='pt', 'Piedmontese'='pms', 'Romanian'='ro', 'Romansh'='rm', 'Sardinian'='sc', 'Sicilian'='scn', 'Venetian'='vec', 'Walloon'='wa', 'Belarusian'='be', 'Bulgarian'='bg', 'Bosnian'='bs', 'Czech'='cs', 'Kashubian'='csb', 'OldChurchSlavonic'='cu', 'LowerSorbian'='dsb', 'Croatian'='hr', 'UpperSorbian'='hsb', 'Macedonian'='mk', 'Polish'='pl', 'Russian'='ru', 'Rusyn'='rue', 'Slovenian'='sl', 'Serbian'='sr', 'Slovak'='sk', 'Silesian'='szl', 'Ukrainian'='uk', 'CentralBicolano'='bcl', 'Cebuano'='ceb', 'Ilocano'='ilo', 'Pangasinan'='pag', 'Kapampangan'='pam', 'Tagalog'='tl', 'Waray'='war', 'Khmer'='km', 'Vietnamese'='vi', 'Japanese'='ja', 'Acehnese'='ace', 'Buginese'='bug', 'Banjar'='bjn', 'Chamorro'='ch', 'Indonesian'='id', 'Javanese'='jv', 'Minangkabau'='min', 'Malay'='ms', 'Sundanese'='su', 'MinDong'='cdo', 'Gan'='gan', 'Hakka'='hak', 'Wu'='wuu', 'Chinese'='zh', 'Azerbaijani'='az', 'SouthernAzerbaijani'='azb', 'Bashkir'='ba', 'CrimeanTatar'='crh', 'Chuvash'='cv', 'Gagauz'='gag', 'Karakalpak'='kaa', 'Kazakh'='kk', 'Karachay-Balkar'='krc', 'Kirghiz'='ky', 'Sakha'='sah', 'Turkmen'='tk', 'Turkish'='tr', 'Tatar'='tt', 'Tuvan'='tyv', 'Uyghur'='ug', 'Uzbek'='uz', 'Arabic'='ar', 'Hebrew'='he', 'Amharic'='am', 'EgyptianArabic'='arz', 'Maltese'='mt', 'Aramaic'='arc', 'Tigrinya'='ti', 'Kurdish(Sorani)'='ckb', 'Zazaki'='diq', 'Persian'='fa', 'Gilaki'='glk', 'NorthernLuri'='lrc', 'Kurdish(Kurmanji)'='ku', 'Mazandarani'='mzn', 'Ossetian'='os', 'Pashto'='ps', 'Tajik'='tg', 'Finnish'='fi', 'Estonian'='et', 'NorthernSami'='se', 'HillMari'='mrj', 'Komi'='kv', 'Komi-Permyak'='koi', 'Udmurt'='udm', 'MeadowMari'='mhr', 'Vepsian'='vep', 'Erzya'='myv', 'Moksha'='mdf', 'Assamese'='as', 'BishnupriyaManipuri'='bpy', 'Bhojpuri'='bh', 'Bengali'='bn', 'Divehi'='dv', 'Konkani'='gom', 'Gujarati'='gu', 'Hindi'='hi', 'FijiHindi'='hif', 'Marathi'='mr', 'Kashmiri'='ks', 'Nepali'='ne', 'Doteli'='dty', 'Oriya'='or', 'EasternPunjabi'='pa', 'Pali'='pi', 'WesternPunjabi'='pnb', 'Romani'='rmy', 'Maithili'='mai', 'Sanskrit'='sa', 'Sindhi'='sd', 'Sinhalese'='si', 'Urdu'='ur', 'Esperanto'='eo', 'Interlingua'='ia', 'Interlingue'='ie', 'Ido'='io', 'Lojban'='jbo', 'Novial'='nov',
                   'Volap\u00fck'='vo', 'Korean'='ko', 'Hungarian'='hu', 'Lithuanian'='lt', 'Latgalian'='ltg', 'Latvian'='lv', 'Basque'='eu', 'Kannada'='kn', 'Malayalam'='ml', 'Tamil'='ta', 'Telugu'='te', 'Breton'='br', 'Welsh'='cy', 'Irish'='ga', 'ScottishGaelic'='gd', 'Manx'='gv', 'Cornish'='kw', 'Armenian'='hy', 'Tibetan'='bo', 'Dzongkha'='dz', 'Burmese'='my', 'Newar'='new', 'Greek'='el', 'Pontic'='pnt', 'Georgian'='ka', 'Mingrelian'='xmf', 'Lao'='lo', 'Thai'='th', 'Zhuang'='za', 'Avar'='av', 'Chechen'='ce', 'Lezgian'='lez', 'Lak'='lbe', 'Malagasy'='mg', 'Haitian'='ht', 'Papiamentu'='pap', 'Albanian'='sq', 'Kongo'='kg', 'Kikuyu'='ki', 'Lingala'='ln', 'Luganda'='lg', 'NorthernSotho'='nso', 'Chichewa'='ny', 'Kirundi'='rn', 'Kinyarwanda'='rw', 'Shona'='sn', 'Swati'='ss', 'Swahili'='sw', 'Tswana'='tn', 'Sesotho'='st', 'Tsonga'='ts', 'Tumbuka'='tum', 'Venda'='ve', 'Xhosa'='xh', 'Zulu'='zu', 
                   'Yoruba'='yo', 'Quechua'='qu', 'Buryat'='bxr', 'Mongolian'='mn', 'Kalmyk'='xal', 'Hawaiian'='haw', 'Maori'='mi', 'Samoan'='sm', 'Tongan'='to', 'Tahitian'='ty', 'Nahuatl'='nah', 'Oromo'='om', 'Somali'='so', 'Aymara'='ay', 'Bislama'='bi', 'Norfolk'='pih', 'Sranan'='srn', 'TokPisin'='tpi', 'Guarani'='gn', 'Navajo'='nv', 'Abkhazian'='ab', 'Kabardian'='kbd', 'Kabyle'='kab', 'Inupiak'='ik', 'Inuktitut'='iu', 'Greenlandic'='kl', 'Hausa'='ha', 'Tetum'='tet', 'Nauruan'='na', 'Fula'='ff', 'Wolof'='wo', 'Akan'='ak', 'Ewe'='ee', 'Twi'='tw', 'Igbo'='ig', 'Cheyenne'='chy', 'Cree'='cr', 'Cherokee'='chr', 'Bambara'='bm', 'Fijian'='fj', 'Sango'='sg', 'Afar'='aa', 'Herero'='hz', 'HiriMotu'='ho', 'Kanuri'='kr', 'Muscogee'='mus', 'Ndonga'='ng', 'Kuanyama'='kj', 'Adyghe'='ady', 'Choctaw'='cho', 'Marshallese'='mh', 'Nuosu'='ii', 'JamaicanPatois'='jam', 'Tulu'='tcy', 'Livvi-Karelian'='olo', 
                   'Kabiy\u00e8'='kbp', 'Dinka'='din', 'Atikamekw'='atj', 'SerboCroatian'='sh', 'Old English (ca. 450-1100)'='ang', 'Northern Frisian'='frr', 'Western Frisian'='fy', 
                   'K\u00f6lsch'='ksh', 'Limburgan'='li', 'Low German'='nds', 'Norwegian Nynorsk'='nn', 'Norwegian'='no', 'Pennsylvania German'='pdc', 'Pfaelzisch'='pfl', 'Saterfriesisch'='stq', 'Vlaams'='vls', 'Zeeuws'='zea', 'Arpitan'='frp', 'Narom'='nrm', 'Occitan (post 1500)'='oc', 'Piemontese'='pms', 'Church Slavic'='cu', 'Lower Sorbian'='dsb', 'Upper Sorbian'='hsb', 'Central Bikol'='bcl', 'Iloko'='ilo', 'Pampanga'='pam', 'Waray (Philippines)'='war', 'Central Khmer'='km', 'Achinese'='ace', 'Malay (macrolanguage)'='ms', 'Min Dong Chinese'='cdo', 'Gan Chinese'='gan', 'Hakka Chinese'='hak', 'Wu Chinese'='wuu', 'South Azerbaijani'='azb', 'Crimean Tatar'='crh', 'Kara-Kalpak'='kaa', 'Yakut'='sah', 'Tuvinian'='tyv', 'Uighur'='ug', 'Egyptian Arabic'='arz', 'Official Aramaic (700-300 BCE)'='arc', 'Central Kurdish'='ckb', 'Dimli (individual language)'='diq', 'Northern Luri'='lrc', 'Kurdish'='ku', 'Mazanderani'='mzn', 'Pushto'='ps', 'Northern Sami'='se', 'Western Mari'='mrj', 'Eastern Mari'='mhr', 'Veps'='vep', 'Bishnupriya'='bpy', 'Bihari languages'='bh', 'Dhivehi'='dv', 'Goan Konkani'='gom', 'Fiji Hindi'='hif', 'Nepali (macrolanguage)'='ne', 'Dotyali'='dty', 'Oriya (macrolanguage)'='or', 'Panjabi'='pa', 'Western Panjabi'='pnb', 'Vlax Romani'='rmy', 'Sinhala'='si', 'Interlingua (International Auxiliary Language Association)'='ia', 'Scottish Gaelic'='gd', 'Newari'='new', 'Modern Greek (1453-)'='el', 'Avaric'='av', 'Lezghian'='lez', 'Papiamento'='pap', 'Ganda'='lg', 'Pedi'='nso', 'Nyanja'='ny', 'Rundi'='rn', 'Swahili (macrolanguage)'='sw', 'Southern Sotho'='st', 'Russia Buriat'='bxr', 'Tonga (Tonga Islands)'='to', 'Nahuatl languages'='nah', 'Pitcairn-Norfolk'='pih', 'Sranan Tongo'='srn', 'Tok Pisin'='tpi', 'Inupiaq'='ik', 'Kalaallisut'='kl', 'Nauru'='na', 'Fulah'='ff', 'Hiri Motu'='ho', 'Creek'='mus', 'Sichuan Yi'='ii', 'Jamaican Creole English'='jam', 'Livvi'='olo', 'Kabiy\u00E8'='kbp', 'Serbo-Croatian'='sh')
.bpemb$languages <- data.frame(language = names(.bpemb$languages), 
                               wikicode =  as.character(sapply(.bpemb$languages, identity)), 
                               stringsAsFactors = FALSE)
.bpemb$languages <- .bpemb$languages[order(.bpemb$languages$wikicode), ]
.bpemb$languages <- unique(.bpemb$languages)
rownames(.bpemb$languages) <- NULL
.bpemb$vocab_sizes = list(
  
    "ab"= c(
      1000,
      3000,
      5000
    ),
    "ace"= c(
      1000,
      3000,
      5000
    ),
    "ady"= c(
      1000,
      3000,
      5000
    ),
    "af"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ak"= c(
      1000,
      3000,
      5000
    ),
    "als"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "am"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "an"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ang"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ar"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "arc"= c(
      1000,
      3000,
      5000
    ),
    "arz"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "as"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ast"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "atj"= c(
      1000,
      3000,
      5000
    ),
    "av"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "ay"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "az"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "azb"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ba"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "bar"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bcl"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "be"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bg"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bi"= c(
      1000,
      3000,
      5000
    ),
    "bjn"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "bm"= c(
      1000,
      3000,
      5000
    ),
    "bn"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bo"= c(
      100000,
      10000,
      25000,
      3000,
      50000,
      5000
    ),
    "bpy"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "br"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bs"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "bug"= c(
      1000,
      3000,
      5000
    ),
    "bxr"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ca"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "cdo"= c(
      3000,
      5000
    ),
    "ce"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ceb"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ch"= c(
      1000,
      3000,
      5000
    ),
    "chr"= c(
      1000,
      3000,
      5000
    ),
    "chy"= c(
      1000,
      3000,
      5000
    ),
    "ckb"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "co"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "cr"= c(
      1000,
      3000,
      5000
    ),
    "crh"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "cs"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "csb"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "cu"= c(
      1000,
      3000,
      5000
    ),
    "cv"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "cy"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "da"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "de"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "din"= c(
      1000,
      3000,
      5000
    ),
    "diq"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "dsb"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "dty"= c(
      10000,
      1000,
      3000,
      5000
    ),
    #"dummy"= c(),
    "dv"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "dz"= c(
      1000,
      3000,
      5000
    ),
    "ee"= c(
      1000,
      3000,
      5000
    ),
    "el"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "en"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "eo"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "es"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "et"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "eu"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ext"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "fa"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ff"= c(
      1000,
      3000,
      5000
    ),
    "fi"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "fj"= c(
      1000,
      3000,
      5000
    ),
    "fo"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "fr"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "frp"= c(
      1000,
      3000,
      5000
    ),
    "frr"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "fur"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "fy"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ga"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "gag"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "gan"= c(
      10000
    ),
    "gd"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "gl"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "glk"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "gn"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "gom"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "got"= c(
      1000,
      3000,
      5000
    ),
    "gu"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "gv"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ha"= c(
      1000,
      3000,
      5000
    ),
    "hak"= c(
      10000,
      5000
    ),
    "haw"= c(
      1000,
      3000,
      5000
    ),
    "he"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "hi"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "hif"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "hr"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "hsb"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ht"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "hu"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "hy"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ia"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "id"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ie"= c(
      1000,
      3000,
      5000
    ),
    "ig"= c(
      1000,
      3000,
      5000
    ),
    "ik"= c(
      1000,
      3000,
      5000
    ),
    "ilo"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "io"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "is"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "it"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "iu"= c(
      1000,
      3000,
      5000
    ),
    "ja"= c(
      100000,
      10000,
      200000,
      25000,
      50000,
      5000
    ),
    "jam"= c(
      1000,
      3000,
      5000
    ),
    "jbo"= c(
      1000,
      3000,
      5000
    ),
    "jv"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ka"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "kaa"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "kab"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "kbd"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "kbp"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "kg"= c(
      1000,
      3000,
      5000
    ),
    "ki"= c(
      1000,
      3000,
      5000
    ),
    "kk"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "kl"= c(
      1000,
      3000,
      5000
    ),
    "km"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "kn"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ko"= c(
      100000,
      10000,
      200000,
      25000,
      50000,
      5000
    ),
    "koi"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "krc"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ks"= c(
      1000,
      3000,
      5000
    ),
    "ksh"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ku"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "kv"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "kw"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "ky"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "la"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "lad"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "lb"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "lbe"= c(
      1000,
      3000,
      5000
    ),
    "lez"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "lg"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "li"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "lij"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "lmo"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ln"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "lo"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "lrc"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "lt"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ltg"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "lv"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "mai"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "mdf"= c(
      1000,
      3000,
      5000
    ),
    "mg"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "mh"= c(
      1000
    ),
    "mhr"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "mi"= c(
      1000,
      3000,
      5000
    ),
    "min"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "mk"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ml"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "mn"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "mr"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "mrj"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ms"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "mt"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "multi"= c(
      1000000,
      100000,
      320000
    ),
    "mwl"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "my"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "myv"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "mzn"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "na"= c(
      1000,
      3000,
      5000
    ),
    "nap"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "nds"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ne"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "new"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "ng"= c(
      1000,
      3000
    ),
    "nl"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "nn"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "no"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "nov"= c(
      1000,
      3000,
      5000
    ),
    "nrm"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "nso"= c(
      1000,
      3000,
      5000
    ),
    "nv"= c(
      1000,
      3000,
      5000
    ),
    "ny"= c(
      1000,
      3000,
      5000
    ),
    "oc"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "olo"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "om"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "or"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "os"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "pa"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "pag"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "pam"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "pap"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "pcd"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "pdc"= c(
      1000,
      3000,
      5000
    ),
    "pfl"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "pi"= c(
      1000,
      3000,
      5000
    ),
    "pih"= c(
      1000,
      3000,
      5000
    ),
    "pl"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "pms"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "pnb"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "pnt"= c(
      1000,
      3000,
      5000
    ),
    "ps"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "pt"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "qu"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "rm"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "rmy"= c(
      1000,
      3000,
      5000
    ),
    "rn"= c(
      1000,
      3000,
      5000
    ),
    "ro"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ru"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "rue"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "rw"= c(
      1000,
      3000,
      5000
    ),
    "sa"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sah"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sc"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "scn"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sco"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sd"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "se"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "sg"= c(
      1000,
      3000,
      5000
    ),
    "sh"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "si"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sk"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "sl"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "sm"= c(
      1000,
      3000,
      5000
    ),
    "sn"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "so"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sq"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "sr"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "srn"= c(
      1000,
      3000,
      5000
    ),
    "ss"= c(
      1000,
      3000,
      5000
    ),
    "st"= c(
      1000,
      3000,
      5000
    ),
    "stq"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "su"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "sv"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "sw"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "szl"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "ta"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "tcy"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "te"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "tet"= c(
      1000,
      3000,
      5000
    ),
    "tg"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "th"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ti"= c(
      1000,
      3000,
      5000
    ),
    "tk"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "tl"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "tn"= c(
      1000,
      3000,
      5000
    ),
    "to"= c(
      1000,
      3000,
      5000
    ),
    "tpi"= c(
      1000,
      3000,
      5000
    ),
    "tr"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ts"= c(
      1000,
      3000,
      5000
    ),
    "tt"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "tum"= c(
      1000,
      3000,
      5000
    ),
    "tw"= c(
      1000,
      3000,
      5000
    ),
    "ty"= c(
      1000,
      3000,
      5000
    ),
    "tyv"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "udm"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "ug"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "uk"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ur"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "uz"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "ve"= c(
      1000,
      3000,
      5000
    ),
    "vec"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "vep"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "vi"= c(
      100000,
      10000,
      1000,
      200000,
      25000,
      3000,
      50000,
      5000
    ),
    "vls"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "vo"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "wa"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "war"= c(
      100000,
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "wo"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "wuu"= c(
      10000,
      25000,
      50000
    ),
    "xal"= c(
      1000,
      3000,
      5000
    ),
    "xh"= c(
      10000,
      1000,
      3000,
      5000
    ),
    "xmf"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "yi"= c(
      10000,
      1000,
      25000,
      3000,
      50000,
      5000
    ),
    "yo"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "za"= c(
      3000,
      5000
    ),
    "zea"= c(
      10000,
      1000,
      25000,
      3000,
      5000
    ),
    "zh"= c(
      100000,
      10000,
      200000,
      25000,
      50000
    ),
    "zu"= c(
      1000,
      3000,
      5000
    )
)
.bpemb$vocab_sizes <- lapply(.bpemb$vocab_sizes, sort)