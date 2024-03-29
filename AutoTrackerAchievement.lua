﻿
-- ////////////////
--      DATA
-- ////////////////

local AutoTrackerAchievementDB_Defaut = {
	["arena"] = true,
	["raid"] = true,
	["region"] = true,
	["dungeon"] = true,
	["progressBar"] = true,
	["progressBarREF"] = "CENTER",
	["progressBarX"] = 0,
	["progressBarY"] = -200,
	["defaut"] = true,
	["defautliste"] = "",
	["Favoris"] = {},
	["debug"] = false,
	["version"] = 9.2,
}

local AtaDiff = {

	["None"] = {0, "None",}, -- 0 - None; not in an Instance.
	["5NM"] = {1, "5NM",}, -- 1 - 5-player Instance.
	["5HM"] = {2, "5HM",}, -- 2 - 5-player Heroic Instance.
	["10NM"] = {3, "10NM",}, -- 3 - 10-player Raid Instance.
	["25NM"] = {4, "25NM",}, -- 4 - 25-player Raid Instance.
	["10HM"] = {5, "10HM",}, -- 5 - 10-player Heroic Raid Instance.
	["25HM"] = {6, "25HM",}, -- 6 - 25-player Heroic Raid Instance.
	["LFR"] = {17, "LFR",}, -- 7 - 25-player Raid Finder Instance.
	["Challenge"] = {8, "Challenge",}, -- 8 - Challenge Mode Instance.
	["40NM"] = {9, "40NM",}, -- 9 - 40-player Raid Instance.
	-- 10 - Not used.
	["HeroicScenario"] = {11, "Scenario HM",}, -- 11 - Heroic Scenario Instance.
	["NormalScenario"] = {12, "Scenario",}, -- 12 - Scenario Instance.
	-- 13 - Not used.
	["FlexNormal"] = {14, "Flex NM",}, -- 14 - 10-30-player Normal Raid Instance.
	["FlexHeroic"] = {15, "Flex HM",}, -- 15 - 10-30-player Heroic Raid Instance.
	["Mythic"] = {16, "Mythic",}, -- 16 - 20-player Mythic Raid Instance .
	-- 17 - 10-30-player Raid Finder Instance.
	-- 18 - 40-player Event raid (Used by the level 100 version of Molten Core for WoW's 10th anniversary).
	-- 19 - 5-player Event instance (Used by the level 90 version of UBRS at WoD launch).
	-- 20 - 25-player Event scenario (unknown usage).
	-- 21 - Not used.
	-- 22 - Not used.
	-- 23 - Mythic 5-player Instance.
	-- 24 - Timewalker 5-player Instance.

}

local AtaColor = {
	Green = "|cFF00FF00",
	Red = "|cFFFF0000",
	Blue = "|cFF0000FF",
	Yellow = "|cFFFFFF00",
}

local GetMapName = {

	--https://wowpedia.fandom.com/wiki/UiMapID

	[-1] = 'Arena',
	[1] = 'Durotar',
	[2] = 'Burning Blade Coven',
	[3] = 'Tiragarde Keep',
	[4] = 'Tiragarde Keep',
	[5] = 'Skull Rock',
	[6] = 'Dustwind Cave',
	[7] = 'Mulgore',
	[8] = 'Palemane Rock',
	[9] = 'The Venture Co. Mine',
	[10] = 'Northern Barrens',
	[11] = 'Wailing Caverns',
	[12] = 'Kalimdor',
	[13] = 'Eastern Kingdoms',
	[14] = 'Arathi Highlands',
	[15] = 'Badlands',
	[16] = 'Uldaman',
	[17] = 'Blasted Lands',
	[18] = 'Tirisfal Glades',
	[19] = 'Scarlet Monastery Entrance',
	[20] = 'Keeper\'s Rest',
	[21] = 'Silverpine Forest',
	[22] = 'Western Plaguelands',
	[23] = 'Eastern Plaguelands',
	[24] = 'Light\'s Hope Chapel',
	[25] = 'Hillsbrad Foothills',
	[26] = 'The Hinterlands',
	[27] = 'Dun Morogh',
	[28] = 'Coldridge Pass',
	[29] = 'The Grizzled Den',
	[30] = 'New Tinkertown',
	[31] = 'Gol\'Bolar Quarry',
	[32] = 'Searing Gorge',
	[33] = 'Blackrock Mountain',
	[34] = 'Blackrock Mountain',
	[35] = 'Blackrock Mountain',
	[36] = 'Burning Steppes',
	[37] = 'Elwynn Forest',
	[38] = 'Fargodeep Mine',
	[39] = 'Fargodeep Mine',
	[40] = 'Jasperlode Mine',
	[41] = 'Dalaran',
	[42] = 'Deadwind Pass',
	[43] = 'The Master\'s Cellar',
	[44] = 'The Master\'s Cellar',
	[45] = 'The Master\'s Cellar',
	[46] = 'Karazhan Catacombs',
	[47] = 'Duskwood',
	[48] = 'Loch Modan',
	[49] = 'Redridge Mountains',
	[50] = 'Northern Stranglethorn',
	[51] = 'Swamp of Sorrows',
	[52] = 'Westfall',
	[53] = 'Gold Coast Quarry',
	[54] = 'Jangolode Mine',
	[55] = 'The Deadmines',
	[56] = 'Wetlands',
	[57] = 'Teldrassil',
	[58] = 'Shadowthread Cave',
	[59] = 'Fel Rock',
	[60] = 'Ban\'ethil Barrow Den',
	[61] = 'Ban\'ethil Barrow Den',
	[62] = 'Darkshore',
	[63] = 'Ashenvale',
	[64] = 'Thousand Needles',
	[65] = 'Stonetalon Mountains',
	[66] = 'Desolace',
	[67] = 'Maraudon',
	[68] = 'Maraudon',
	[69] = 'Feralas',
	[70] = 'Dustwallow Marsh',
	[71] = 'Tanaris',
	[72] = 'The Noxious Lair',
	[73] = 'The Gaping Chasm',
	[74] = 'Caverns of Time',
	[75] = 'Caverns of Time',
	[76] = 'Azshara',
	[77] = 'Felwood',
	[78] = 'Un\'Goro Crater',
	[79] = 'The Slithering Scar',
	[80] = 'Moonglade',
	[81] = 'Silithus',
	[82] = 'Twilight\'s Run',
	[83] = 'Winterspring',
	[84] = 'Stormwind City',
	[85] = 'Orgrimmar',
	[86] = 'Orgrimmar',
	[87] = 'Ironforge',
	[88] = 'Thunder Bluff',
	[89] = 'Darnassus',
	[90] = 'Undercity',
	[91] = 'Alterac Valley',
	[92] = 'Warsong Gulch',
	[93] = 'Arathi Basin',
	[94] = 'Eversong Woods',
	[95] = 'Ghostlands',
	[96] = 'Amani Catacombs',
	[97] = 'Azuremyst Isle',
	[98] = 'Tides\' Hollow',
	[99] = 'Stillpine Hold',
	[100] = 'Hellfire Peninsula',
	[101] = 'Outland',
	[102] = 'Zangarmarsh',
	[103] = 'The Exodar',
	[104] = 'Shadowmoon Valley',
	[105] = 'Blade\'s Edge Mountains',
	[106] = 'Bloodmyst Isle',
	[107] = 'Nagrand',
	[108] = 'Terokkar Forest',
	[109] = 'Netherstorm',
	[110] = 'Silvermoon City',
	[111] = 'Shattrath City',
	[112] = 'Eye of the Storm',
	[113] = 'Northrend',
	[114] = 'Borean Tundra',
	[115] = 'Dragonblight',
	[116] = 'Grizzly Hills',
	[117] = 'Howling Fjord',
	[118] = 'Icecrown',
	[119] = 'Sholazar Basin',
	[120] = 'The Storm Peaks',
	[121] = 'Zul\'Drak',
	[122] = 'Isle of Quel\'Danas',
	[123] = 'Wintergrasp',
	[124] = 'Plaguelands: The Scarlet Enclave',
	[125] = 'Dalaran',
	[126] = 'Dalaran',
	[127] = 'Crystalsong Forest',
	[128] = 'Strand of the Ancients',
	[129] = 'The Nexus',
	[130] = 'The Culling of Stratholme',
	[131] = 'The Culling of Stratholme',
	[132] = 'Ahn\'kahet: The Old Kingdom',
	[133] = 'Utgarde Keep',
	[134] = 'Utgarde Keep',
	[135] = 'Utgarde Keep',
	[136] = 'Utgarde Pinnacle',
	[137] = 'Utgarde Pinnacle',
	[138] = 'Halls of Lightning',
	[139] = 'Halls of Lightning',
	[140] = 'Halls of Stone',
	[141] = 'The Eye of Eternity',
	[142] = 'The Oculus',
	[143] = 'The Oculus',
	[144] = 'The Oculus',
	[145] = 'The Oculus',
	[146] = 'The Oculus',
	[147] = 'Ulduar',
	[148] = 'Ulduar',
	[149] = 'Ulduar',
	[150] = 'Ulduar',
	[151] = 'Ulduar',
	[152] = 'Ulduar',
	[153] = 'Gundrak',
	[154] = 'Gundrak',
	[155] = 'The Obsidian Sanctum',
	[156] = 'Vault of Archavon',
	[157] = 'Azjol-Nerub',
	[158] = 'Azjol-Nerub',
	[159] = 'Azjol-Nerub',
	[160] = 'Drak\'Tharon Keep',
	[161] = 'Drak\'Tharon Keep',
	[162] = 'Naxxramas',
	[163] = 'Naxxramas',
	[164] = 'Naxxramas',
	[165] = 'Naxxramas',
	[166] = 'Naxxramas',
	[167] = 'Naxxramas',
	[168] = 'The Violet Hold',
	[169] = 'Isle of Conquest',
	[170] = 'Hrothgar\'s Landing',
	[171] = 'Trial of the Champion',
	[172] = 'Trial of the Crusader',
	[173] = 'Trial of the Crusader',
	[174] = 'The Lost Isles',
	[175] = 'Kaja\'mite Cavern',
	[176] = 'Volcanoth\'s Lair',
	[177] = 'Gallywix Labor Mine',
	[178] = 'Gallywix Labor Mine',
	[179] = 'Gilneas',
	[180] = 'Emberstone Mine',
	[181] = 'Greymane Manor',
	[182] = 'Greymane Manor',
	[183] = 'The Forge of Souls',
	[184] = 'Pit of Saron',
	[185] = 'Halls of Reflection',
	[186] = 'Icecrown Citadel',
	[187] = 'Icecrown Citadel',
	[188] = 'Icecrown Citadel',
	[189] = 'Icecrown Citadel',
	[190] = 'Icecrown Citadel',
	[191] = 'Icecrown Citadel',
	[192] = 'Icecrown Citadel',
	[193] = 'Icecrown Citadel',
	[194] = 'Kezan',
	[195] = 'Kaja\'mine',
	[196] = 'Kaja\'mine',
	[197] = 'Kaja\'mine',
	[198] = 'Mount Hyjal',
	[199] = 'Southern Barrens',
	[200] = 'The Ruby Sanctum',
	[201] = 'Kelp\'thar Forest',
	[202] = 'Gilneas City',
	[203] = 'Vashj\'ir',
	[204] = 'Abyssal Depths',
	[205] = 'Shimmering Expanse',
	[206] = 'Twin Peaks',
	[207] = 'Deepholm',
	[208] = 'Twilight Depths',
	[209] = 'Twilight Depths',
	[210] = 'The Cape of Stranglethorn',
	[213] = 'Ragefire Chasm',
	[217] = 'Ruins of Gilneas',
	[218] = 'Ruins of Gilneas City',
	[219] = 'Zul\'Farrak',
	[220] = 'The Temple of Atal\'Hakkar',
	[221] = 'Blackfathom Deeps',
	[222] = 'Blackfathom Deeps',
	[223] = 'Blackfathom Deeps',
	[224] = 'Stranglethorn Vale',
	[225] = 'The Stockade',
	[226] = 'Gnomeregan',
	[227] = 'Gnomeregan',
	[228] = 'Gnomeregan',
	[229] = 'Gnomeregan',
	[230] = 'Uldaman',
	[231] = 'Uldaman',
	[232] = 'Molten Core',
	[233] = 'Zul\'Gurub',
	[234] = 'Dire Maul',
	[235] = 'Dire Maul',
	[236] = 'Dire Maul',
	[237] = 'Dire Maul',
	[238] = 'Dire Maul',
	[239] = 'Dire Maul',
	[240] = 'Dire Maul',
	[241] = 'Twilight Highlands',
	[242] = 'Blackrock Depths',
	[243] = 'Blackrock Depths',
	[244] = 'Tol Barad',
	[245] = 'Tol Barad Peninsula',
	[246] = 'The Shattered Halls',
	[247] = 'Ruins of Ahn\'Qiraj',
	[248] = 'Onyxia\'s Lair',
	[249] = 'Uldum',
	[250] = 'Blackrock Spire',
	[251] = 'Blackrock Spire',
	[252] = 'Blackrock Spire',
	[253] = 'Blackrock Spire',
	[254] = 'Blackrock Spire',
	[255] = 'Blackrock Spire',
	[256] = 'Auchenai Crypts',
	[257] = 'Auchenai Crypts',
	[258] = 'Sethekk Halls',
	[259] = 'Sethekk Halls',
	[260] = 'Shadow Labyrinth',
	[261] = 'The Blood Furnace',
	[262] = 'The Underbog',
	[263] = 'The Steamvault',
	[264] = 'The Steamvault',
	[265] = 'The Slave Pens',
	[266] = 'The Botanica',
	[267] = 'The Mechanar',
	[268] = 'The Mechanar',
	[269] = 'The Arcatraz',
	[270] = 'The Arcatraz',
	[271] = 'The Arcatraz',
	[272] = 'Mana-Tombs',
	[273] = 'The Black Morass',
	[274] = 'Old Hillsbrad Foothills',
	[275] = 'The Battle for Gilneas',
	[276] = 'The Maelstrom',
	[277] = 'Lost City of the Tol\'vir',
	[279] = 'Wailing Caverns',
	[280] = 'Maraudon',
	[281] = 'Maraudon',
	[282] = 'Baradin Hold',
	[283] = 'Blackrock Caverns',
	[284] = 'Blackrock Caverns',
	[285] = 'Blackwing Descent',
	[286] = 'Blackwing Descent',
	[287] = 'Blackwing Lair',
	[288] = 'Blackwing Lair',
	[289] = 'Blackwing Lair',
	[290] = 'Blackwing Lair',
	[291] = 'The Deadmines',
	[292] = 'The Deadmines',
	[293] = 'Grim Batol',
	[294] = 'The Bastion of Twilight',
	[295] = 'The Bastion of Twilight',
	[296] = 'The Bastion of Twilight',
	[297] = 'Halls of Origination',
	[298] = 'Halls of Origination',
	[299] = 'Halls of Origination',
	[300] = 'Razorfen Downs',
	[301] = 'Razorfen Kraul',
	[302] = 'Scarlet Monastery',
	[303] = 'Scarlet Monastery',
	[304] = 'Scarlet Monastery',
	[305] = 'Scarlet Monastery',
	[306] = 'ScholomanceOLD',
	[307] = 'ScholomanceOLD',
	[308] = 'ScholomanceOLD',
	[309] = 'ScholomanceOLD',
	[310] = 'Shadowfang Keep',
	[311] = 'Shadowfang Keep',
	[312] = 'Shadowfang Keep',
	[313] = 'Shadowfang Keep',
	[314] = 'Shadowfang Keep',
	[315] = 'Shadowfang Keep',
	[316] = 'Shadowfang Keep',
	[317] = 'Stratholme',
	[318] = 'Stratholme',
	[319] = 'Ahn\'Qiraj',
	[320] = 'Ahn\'Qiraj',
	[321] = 'Ahn\'Qiraj',
	[322] = 'Throne of the Tides',
	[323] = 'Throne of the Tides',
	[324] = 'The Stonecore',
	[325] = 'The Vortex Pinnacle',
	[327] = 'Ahn\'Qiraj: The Fallen Kingdom',
	[328] = 'Throne of the Four Winds',
	[329] = 'Hyjal Summit',
	[330] = 'Gruul\'s Lair',
	[331] = 'Magtheridon\'s Lair',
	[332] = 'Serpentshrine Cavern',
	[333] = 'Zul\'Aman',
	[334] = 'Tempest Keep',
	[335] = 'Sunwell Plateau',
	[336] = 'Sunwell Plateau',
	[337] = 'Zul\'Gurub',
	[338] = 'Molten Front',
	[339] = 'Black Temple',
	[340] = 'Black Temple',
	[341] = 'Black Temple',
	[342] = 'Black Temple',
	[343] = 'Black Temple',
	[344] = 'Black Temple',
	[345] = 'Black Temple',
	[346] = 'Black Temple',
	[347] = 'Hellfire Ramparts',
	[348] = 'Magisters\' Terrace',
	[349] = 'Magisters\' Terrace',
	[350] = 'Karazhan',
	[351] = 'Karazhan',
	[352] = 'Karazhan',
	[353] = 'Karazhan',
	[354] = 'Karazhan',
	[355] = 'Karazhan',
	[356] = 'Karazhan',
	[357] = 'Karazhan',
	[358] = 'Karazhan',
	[359] = 'Karazhan',
	[360] = 'Karazhan',
	[361] = 'Karazhan',
	[362] = 'Karazhan',
	[363] = 'Karazhan',
	[364] = 'Karazhan',
	[365] = 'Karazhan',
	[366] = 'Karazhan',
	[367] = 'Firelands',
	[368] = 'Firelands',
	[369] = 'Firelands',
	[370] = 'The Nexus',
	[371] = 'The Jade Forest',
	[372] = 'Greenstone Quarry',
	[373] = 'Greenstone Quarry',
	[374] = 'The Widow\'s Wail',
	[375] = 'Oona Kagu',
	[376] = 'Valley of the Four Winds',
	[377] = 'Cavern of Endless Echoes',
	[378] = 'The Wandering Isle',
	[379] = 'Kun-Lai Summit',
	[380] = 'Howlingwind Cavern',
	[381] = 'Pranksters\' Hollow',
	[382] = 'Knucklethump Hole',
	[383] = 'The Deeper',
	[384] = 'The Deeper',
	[385] = 'Tomb of Conquerors',
	[386] = 'Ruins of Korune',
	[387] = 'Ruins of Korune',
	[388] = 'Townlong Steppes',
	[389] = 'Niuzao Temple',
	[390] = 'Vale of Eternal Blossoms',
	[391] = 'Shrine of Two Moons',
	[392] = 'Shrine of Two Moons',
	[393] = 'Shrine of Seven Stars',
	[394] = 'Shrine of Seven Stars',
	[395] = 'Guo-Lai Halls',
	[396] = 'Guo-Lai Halls',
	[397] = 'Eye of the Storm',
	[398] = 'Well of Eternity',
	[399] = 'Hour of Twilight',
	[400] = 'Hour of Twilight',
	[401] = 'End Time',
	[402] = 'End Time',
	[403] = 'End Time',
	[404] = 'End Time',
	[405] = 'End Time',
	[406] = 'End Time',
	[407] = 'Darkmoon Island',
	[408] = 'Darkmoon Island',
	[409] = 'Dragon Soul',
	[410] = 'Dragon Soul',
	[411] = 'Dragon Soul',
	[412] = 'Dragon Soul',
	[413] = 'Dragon Soul',
	[414] = 'Dragon Soul',
	[415] = 'Dragon Soul',
	[416] = 'Dustwallow Marsh',
	[417] = 'Temple of Kotmogu',
	[418] = 'Krasarang Wilds',
	[419] = 'Ruins of Ogudei',
	[420] = 'Ruins of Ogudei',
	[421] = 'Ruins of Ogudei',
	[422] = 'Dread Wastes',
	[423] = 'Silvershard Mines',
	[424] = 'Pandaria',
	[425] = 'Northshire',
	[426] = 'Echo Ridge Mine',
	[427] = 'Coldridge Valley',
	[428] = 'Frostmane Hovel',
	[429] = 'Temple of the Jade Serpent',
	[430] = 'Temple of the Jade Serpent',
	[431] = 'Scarlet Halls',
	[432] = 'Scarlet Halls',
	[433] = 'The Veiled Stair',
	[434] = 'The Ancient Passage',
	[435] = 'Scarlet Monastery',
	[436] = 'Scarlet Monastery',
	[437] = 'Gate of the Setting Sun',
	[438] = 'Gate of the Setting Sun',
	[439] = 'Stormstout Brewery',
	[440] = 'Stormstout Brewery',
	[441] = 'Stormstout Brewery',
	[442] = 'Stormstout Brewery',
	[443] = 'Shado-Pan Monastery',
	[444] = 'Shado-Pan Monastery',
	[445] = 'Shado-Pan Monastery',
	[446] = 'Shado-Pan Monastery',
	[447] = 'A Brewing Storm',
	[448] = 'The Jade Forest',
	[449] = 'Temple of Kotmogu',
	[450] = 'Unga Ingoo',
	[451] = 'Assault on Zan\'vess',
	[452] = 'Brewmoon Festival',
	[453] = 'Mogu\'shan Palace',
	[454] = 'Mogu\'shan Palace',
	[455] = 'Mogu\'shan Palace',
	[456] = 'Terrace of Endless Spring',
	[457] = 'Siege of Niuzao Temple',
	[458] = 'Siege of Niuzao Temple',
	[459] = 'Siege of Niuzao Temple',
	[460] = 'Shadowglen',
	[461] = 'Valley of Trials',
	[462] = 'Camp Narache',
	[463] = 'Echo Isles',
	[464] = 'Spitescale Cavern',
	[465] = 'Deathknell',
	[466] = 'Night Web\'s Hollow',
	[467] = 'Sunstrider Isle',
	[468] = 'Ammen Vale',
	[469] = 'New Tinkertown',
	[470] = 'Frostmane Hold',
	[471] = 'Mogu\'shan Vaults',
	[472] = 'Mogu\'shan Vaults',
	[473] = 'Mogu\'shan Vaults',
	[474] = 'Heart of Fear',
	[475] = 'Heart of Fear',
	[476] = 'Scholomance',
	[477] = 'Scholomance',
	[478] = 'Scholomance',
	[479] = 'Scholomance',
	[480] = 'Proving Grounds',
	[481] = 'Crypt of Forgotten Kings',
	[482] = 'Crypt of Forgotten Kings',
	[483] = 'Dustwallow Marsh',
	[486] = 'Krasarang Wilds',
	[487] = 'A Little Patience',
	[488] = 'Dagger in the Dark',
	[489] = 'Dagger in the Dark',
	[490] = 'Black Temple',
	[491] = 'Black Temple',
	[492] = 'Black Temple',
	[493] = 'Black Temple',
	[494] = 'Black Temple',
	[495] = 'Black Temple',
	[496] = 'Black Temple',
	[497] = 'Black Temple',
	[498] = 'Krasarang Wilds',
	[499] = 'Deeprun Tram',
	[500] = 'Deeprun Tram',
	[501] = 'Dalaran',
	[502] = 'Dalaran',
	[503] = 'Brawl\'gar Arena',
	[504] = 'Isle of Thunder',
	[505] = 'Lightning Vein Mine',
	[506] = 'The Swollen Vault',
	[507] = 'Isle of Giants',
	[508] = 'Throne of Thunder',
	[509] = 'Throne of Thunder',
	[510] = 'Throne of Thunder',
	[511] = 'Throne of Thunder',
	[512] = 'Throne of Thunder',
	[513] = 'Throne of Thunder',
	[514] = 'Throne of Thunder',
	[515] = 'Throne of Thunder',
	[516] = 'Isle of Thunder',
	[517] = 'Lightning Vein Mine',
	[518] = 'Thunder King\'s Citadel',
	[519] = 'Deepwind Gorge',
	[520] = 'Vale of Eternal Blossoms',
	[521] = 'Vale of Eternal Blossoms',
	[522] = 'The Secrets of Ragefire',
	[523] = 'Dun Morogh',
	[524] = 'Battle on the High Seas',
	[525] = 'Frostfire Ridge',
	[526] = 'Turgall\'s Den',
	[527] = 'Turgall\'s Den',
	[528] = 'Turgall\'s Den',
	[529] = 'Turgall\'s Den',
	[530] = 'Grom\'gar',
	[531] = 'Grulloc\'s Grotto',
	[532] = 'Grulloc\'s Grotto',
	[533] = 'Snowfall Alcove',
	[534] = 'Tanaan Jungle',
	[535] = 'Talador',
	[536] = 'Tomb of Lights',
	[537] = 'Tomb of Souls',
	[538] = 'The Breached Ossuary',
	[539] = 'Shadowmoon Valley',
	[540] = 'Bloodthorn Cave',
	[541] = 'Den of Secrets',
	[542] = 'Spires of Arak',
	[543] = 'Gorgrond',
	[544] = 'Moira\'s Reach',
	[545] = 'Moira\'s Reach',
	[546] = 'Fissure of Fury',
	[547] = 'Fissure of Fury',
	[548] = 'Cragplume Cauldron',
	[549] = 'Cragplume Cauldron',
	[550] = 'Nagrand',
	[551] = 'The Masters\' Cavern',
	[552] = 'Stonecrag Gorge',
	[553] = 'Oshu\'gun',
	[554] = 'Timeless Isle',
	[555] = 'Cavern of Lost Spirits',
	[556] = 'Siege of Orgrimmar',
	[557] = 'Siege of Orgrimmar',
	[558] = 'Siege of Orgrimmar',
	[559] = 'Siege of Orgrimmar',
	[560] = 'Siege of Orgrimmar',
	[561] = 'Siege of Orgrimmar',
	[562] = 'Siege of Orgrimmar',
	[563] = 'Siege of Orgrimmar',
	[564] = 'Siege of Orgrimmar',
	[565] = 'Siege of Orgrimmar',
	[566] = 'Siege of Orgrimmar',
	[567] = 'Siege of Orgrimmar',
	[568] = 'Siege of Orgrimmar',
	[569] = 'Siege of Orgrimmar',
	[570] = 'Siege of Orgrimmar',
	[571] = 'Celestial Tournament',
	[572] = 'Draenor',
	[573] = 'Bloodmaul Slag Mines',
	[574] = 'Shadowmoon Burial Grounds',
	[575] = 'Shadowmoon Burial Grounds',
	[576] = 'Shadowmoon Burial Grounds',
	[577] = 'Tanaan Jungle',
	[578] = 'Umbral Halls',
	[579] = 'Lunarfall Excavation',
	[580] = 'Lunarfall Excavation',
	[581] = 'Lunarfall Excavation',
	[582] = 'Lunarfall',
	[585] = 'Frostwall Mine',
	[586] = 'Frostwall Mine',
	[587] = 'Frostwall Mine',
	[588] = 'Ashran',
	[589] = 'Ashran Mine',
	[590] = 'Frostwall',
	[593] = 'Auchindoun',
	[594] = 'Shattrath City',
	[595] = 'Iron Docks',
	[596] = 'Blackrock Foundry',
	[597] = 'Blackrock Foundry',
	[598] = 'Blackrock Foundry',
	[599] = 'Blackrock Foundry',
	[600] = 'Blackrock Foundry',
	[601] = 'Skyreach',
	[602] = 'Skyreach',
	[606] = 'Grimrail Depot',
	[607] = 'Grimrail Depot',
	[608] = 'Grimrail Depot',
	[609] = 'Grimrail Depot',
	[610] = 'Highmaul',
	[611] = 'Highmaul',
	[612] = 'Highmaul',
	[613] = 'Highmaul',
	[614] = 'Highmaul',
	[615] = 'Highmaul',
	[616] = 'Upper Blackrock Spire',
	[617] = 'Upper Blackrock Spire',
	[618] = 'Upper Blackrock Spire',
	[619] = 'Broken Isles',
	[620] = 'The Everbloom',
	[621] = 'The Everbloom',
	[622] = 'Stormshield',
	[623] = 'Hillsbrad Foothills (Southshore vs. Tarren Mill)',
	[624] = 'Warspear',
	[626] = 'Dalaran (Broken Isles)',
	[627] = 'Dalaran (Broken Isles)',
	[628] = 'Dalaran (Broken Isles)',
	[629] = 'Dalaran (Broken Isles)',
	[630] = 'Azsuna',
	[631] = 'Nar\'thalas Academy',
	[632] = 'Oceanus Cove',
	[633] = 'Temple of a Thousand Lights',
	[634] = 'Stormheim',
	[635] = 'Shield\'s Rest',
	[636] = 'Stormscale Cavern',
	[637] = 'Thorignir Refuge',
	[638] = 'Thorignir Refuge',
	[639] = 'Aggramar\'s Vault',
	[640] = 'Vault of Eyir',
	[641] = 'Val\'sharah',
	[642] = 'Darkpens',
	[643] = 'Sleeper\'s Barrow',
	[644] = 'Sleeper\'s Barrow',
	[645] = 'Twisting Nether',
	[646] = 'Broken Shore',
	[647] = 'Acherus: The Ebon Hold',
	[648] = 'Acherus: The Ebon Hold',
	[649] = 'Helheim',
	[650] = 'Highmountain',
	[651] = 'Bitestone Enclave',
	[652] = 'Thunder Totem',
	[653] = 'Cave of the Blood Trial',
	[654] = 'Mucksnout Den',
	[655] = 'Lifespring Cavern',
	[656] = 'Lifespring Cavern',
	[657] = 'Path of Huln',
	[658] = 'Path of Huln',
	[659] = 'Stonedark Grotto',
	[660] = 'Feltotem Caverns',
	[661] = 'Hellfire Citadel',
	[662] = 'Hellfire Citadel',
	[663] = 'Hellfire Citadel',
	[664] = 'Hellfire Citadel',
	[665] = 'Hellfire Citadel',
	[666] = 'Hellfire Citadel',
	[667] = 'Hellfire Citadel',
	[668] = 'Hellfire Citadel',
	[669] = 'Hellfire Citadel',
	[670] = 'Hellfire Citadel',
	[671] = 'The Cove of Nashal',
	[672] = 'Mardum, the Shattered Abyss',
	[673] = 'Cryptic Hollow',
	[674] = 'Soul Engine',
	[675] = 'Soul Engine',
	[676] = 'Broken Shore',
	[677] = 'Vault of the Wardens',
	[678] = 'Vault of the Wardens',
	[679] = 'Vault of the Wardens',
	[680] = 'Suramar',
	[681] = 'The Arcway Vaults',
	[682] = 'Felsoul Hold',
	[683] = 'The Arcway Vaults',
	[684] = 'Shattered Locus',
	[685] = 'Shattered Locus',
	[686] = 'Elor\'shan',
	[687] = 'Kel\'balor',
	[688] = 'Ley Station Anora',
	[689] = 'Ley Station Moonfall',
	[690] = 'Ley Station Aethenar',
	[691] = 'Nyell\'s Workshop',
	[692] = 'Falanaar Arcway',
	[693] = 'Falanaar Arcway',
	[694] = 'Helmouth Shallows',
	[695] = 'Skyhold',
	[696] = 'Stormheim',
	[697] = 'Azshara',
	[698] = 'Icecrown Citadel',
	[699] = 'Icecrown Citadel',
	[700] = 'Icecrown Citadel',
	[701] = 'Icecrown Citadel',
	[702] = 'Netherlight Temple',
	[703] = 'Halls of Valor',
	[704] = 'Halls of Valor',
	[705] = 'Halls of Valor',
	[706] = 'Helmouth Cliffs',
	[707] = 'Helmouth Cliffs',
	[708] = 'Helmouth Cliffs',
	[709] = 'The Wandering Isle',
	[710] = 'Vault of the Wardens',
	[711] = 'Vault of the Wardens',
	[712] = 'Vault of the Wardens',
	[713] = 'Eye of Azshara',
	[714] = 'Niskara',
	[715] = 'Emerald Dreamway',
	[716] = 'Skywall',
	[717] = 'Dreadscar Rift',
	[718] = 'Dreadscar Rift',
	[719] = 'Mardum, the Shattered Abyss',
	[720] = 'Mardum, the Shattered Abyss',
	[721] = 'Mardum, the Shattered Abyss',
	[723] = 'The Violet Hold',
	[725] = 'The Maelstrom',
	[726] = 'The Maelstrom',
	[728] = 'Terrace of Endless Spring',
	[729] = 'Crumbling Depths',
	[731] = 'Neltharion\'s Lair',
	[732] = 'Violet Hold',
	[733] = 'Darkheart Thicket',
	[734] = 'Hall of the Guardian',
	[735] = 'Hall of the Guardian',
	[736] = 'The Beyond',
	[737] = 'The Vortex Pinnacle',
	[738] = 'Firelands',
	[739] = 'Trueshot Lodge',
	[740] = 'Shadowgore Citadel',
	[741] = 'Shadowgore Citadel',
	[742] = 'Abyssal Maw',
	[743] = 'Abyssal Maw',
	[744] = 'Ulduar',
	[745] = 'Ulduar',
	[746] = 'Ulduar',
	[747] = 'The Dreamgrove',
	[748] = 'Niskara',
	[749] = 'The Arcway',
	[750] = 'Thunder Totem',
	[751] = 'Black Rook Hold',
	[752] = 'Black Rook Hold',
	[753] = 'Black Rook Hold',
	[754] = 'Black Rook Hold',
	[755] = 'Black Rook Hold',
	[756] = 'Black Rook Hold',
	[757] = 'Ursoc\'s Lair',
	[758] = 'Gloaming Reef',
	[759] = 'Black Temple',
	[760] = 'Malorne\'s Nightmare',
	[761] = 'Court of Stars',
	[762] = 'Court of Stars',
	[763] = 'Court of Stars',
	[764] = 'The Nighthold',
	[765] = 'The Nighthold',
	[766] = 'The Nighthold',
	[767] = 'The Nighthold',
	[768] = 'The Nighthold',
	[769] = 'The Nighthold',
	[770] = 'The Nighthold',
	[771] = 'The Nighthold',
	[772] = 'The Nighthold',
	[773] = 'Tol Barad',
	[774] = 'Tol Barad',
	[775] = 'The Exodar',
	[776] = 'Azuremyst Isle',
	[777] = 'The Emerald Nightmare',
	[778] = 'The Emerald Nightmare',
	[779] = 'The Emerald Nightmare',
	[780] = 'The Emerald Nightmare',
	[781] = 'The Emerald Nightmare',
	[782] = 'The Emerald Nightmare',
	[783] = 'The Emerald Nightmare',
	[784] = 'The Emerald Nightmare',
	[785] = 'The Emerald Nightmare',
	[786] = 'The Emerald Nightmare',
	[787] = 'The Emerald Nightmare',
	[788] = 'The Emerald Nightmare',
	[789] = 'The Emerald Nightmare',
	[790] = 'Eye of Azshara',
	[791] = 'Temple of the Jade Serpent',
	[792] = 'Temple of the Jade Serpent',
	[793] = 'Black Rook Hold',
	[794] = 'Karazhan',
	[795] = 'Karazhan',
	[796] = 'Karazhan',
	[797] = 'Karazhan',
	[798] = 'The Arcway',
	[799] = 'The Oculus',
	[800] = 'The Oculus',
	[801] = 'The Oculus',
	[802] = 'The Oculus',
	[803] = 'The Oculus',
	[804] = 'Scarlet Monastery',
	[805] = 'Scarlet Monastery',
	[806] = 'Trial of Valor',
	[807] = 'Trial of Valor',
	[808] = 'Trial of Valor',
	[809] = 'Karazhan (Legion)',
	[810] = 'Karazhan (Legion)',
	[811] = 'Karazhan (Legion)',
	[812] = 'Karazhan (Legion)',
	[813] = 'Karazhan (Legion)',
	[814] = 'Karazhan (Legion)',
	[815] = 'Karazhan (Legion)',
	[816] = 'Karazhan (Legion)',
	[817] = 'Karazhan (Legion)',
	[818] = 'Karazhan (Legion)',
	[819] = 'Karazhan (Legion)',
	[820] = 'Karazhan (Legion)',
	[821] = 'Karazhan (Legion)',
	[822] = 'Karazhan (Legion)',
	[823] = 'Pit of Saron',
	[824] = 'Islands',
	[825] = 'Wailing Caverns',
	[826] = 'Cave of the Bloodtotem',
	[827] = 'Stratholme',
	[828] = 'The Eye of Eternity',
	[829] = 'Halls of Valor',
	[830] = 'Krokuun',
	[831] = 'The Vindicaar',
	[832] = 'The Vindicaar',
	[833] = 'Nath\'raxas Spire',
	[834] = 'Coldridge Valley',
	[835] = 'The Deadmines',
	[836] = 'The Deadmines',
	[837] = 'Arathi Basin',
	[838] = 'Battle for Blackrock Mountain',
	[839] = 'The Maelstrom',
	[840] = 'Gnomeregan',
	[841] = 'Gnomeregan',
	[842] = 'Gnomeregan',
	[843] = 'Shado-Pan Showdown',
	[844] = 'Arathi Basin',
	[845] = 'Cathedral of Eternal Night',
	[846] = 'Cathedral of Eternal Night',
	[847] = 'Cathedral of Eternal Night',
	[848] = 'Cathedral of Eternal Night',
	[849] = 'Cathedral of Eternal Night',
	[850] = 'Tomb of Sargeras',
	[851] = 'Tomb of Sargeras',
	[852] = 'Tomb of Sargeras',
	[853] = 'Tomb of Sargeras',
	[854] = 'Tomb of Sargeras',
	[855] = 'Tomb of Sargeras',
	[856] = 'Tomb of Sargeras',
	[857] = 'Throne of the Four Winds',
	[858] = 'Assault on Broken Shore',
	[859] = 'Warsong Gulch',
	[860] = 'The Ruby Sanctum',
	[861] = 'Mardum, the Shattered Abyss',
	[862] = 'Zuldazar',
	[863] = 'Nazmir',
	[864] = 'Vol\'dun',
	[865] = 'Stormheim',
	[866] = 'Stormheim',
	[867] = 'Azsuna',
	[868] = 'Val\'sharah',
	[869] = 'Highmountain',
	[870] = 'Highmountain',
	[871] = 'The Lost Glacier',
	[872] = 'Stormstout Brewery',
	[873] = 'Stormstout Brewery',
	[874] = 'Stormstout Brewery',
	[875] = 'Zandalar',
	[876] = 'Kul Tiras',
	[877] = 'Fields of the Eternal Hunt',
	[879] = 'Mardum, the Shattered Abyss',
	[880] = 'Mardum, the Shattered Abyss',
	[881] = 'The Eye of Eternity',
	[882] = 'Eredath',
	[883] = 'The Vindicaar',
	[884] = 'The Vindicaar',
	[885] = 'Antoran Wastes',
	[886] = 'The Vindicaar',
	[887] = 'The Vindicaar',
	[888] = 'Hall of Communion',
	[889] = 'Arcatraz',
	[890] = 'Arcatraz',
	[891] = 'Azuremyst Isle',
	[892] = 'Azuremyst Isle',
	[893] = 'Azuremyst Isle',
	[894] = 'Azuremyst Isle',
	[895] = 'Tiragarde Sound',
	[896] = 'Drustvar',
	[897] = 'The Deaths of Chromie',
	[898] = 'The Deaths of Chromie',
	[899] = 'The Deaths of Chromie',
	[900] = 'The Deaths of Chromie',
	[901] = 'The Deaths of Chromie',
	[902] = 'The Deaths of Chromie',
	[903] = 'The Seat of the Triumvirate',
	[904] = 'Silithus Brawl',
	[905] = 'Argus',
	[906] = 'Arathi Highlands',
	[907] = 'Seething Shore',
	[908] = 'Ruins of Lordaeron',
	[909] = 'Antorus, the Burning Throne',
	[910] = 'Antorus, the Burning Throne',
	[911] = 'Antorus, the Burning Throne',
	[912] = 'Antorus, the Burning Throne',
	[913] = 'Antorus, the Burning Throne',
	[914] = 'Antorus, the Burning Throne',
	[915] = 'Antorus, the Burning Throne',
	[916] = 'Antorus, the Burning Throne',
	[917] = 'Antorus, the Burning Throne',
	[918] = 'Antorus, the Burning Throne',
	[919] = 'Antorus, the Burning Throne',
	[920] = 'Antorus, the Burning Throne',
	[921] = 'Invasion Point: Aurinor',
	[922] = 'Invasion Point: Bonich',
	[923] = 'Invasion Point: Cen\'gar',
	[924] = 'Invasion Point: Naigtal',
	[925] = 'Invasion Point: Sangua',
	[926] = 'Invasion Point: Val',
	[927] = 'Greater Invasion Point: Pit Lord Vilemus',
	[928] = 'Greater Invasion Point: Mistress Alluradel',
	[929] = 'Greater Invasion Point: Matron Folnuna',
	[930] = 'Greater Invasion Point: Inquisitor Meto',
	[931] = 'Greater Invasion Point: Sotanathor',
	[932] = 'Greater Invasion Point: Occularus',
	[933] = 'Forge of Aeons',
	[934] = 'Atal\'Dazar',
	[935] = 'Atal\'Dazar',
	[936] = 'Freehold',
	[938] = 'Gilneas Island',
	[939] = 'Tropical Isle 8.0',
	[940] = 'The Vindicaar',
	[941] = 'The Vindicaar',
	[942] = 'Stormsong Valley',
	[943] = 'Arathi Highlands',
	[946] = 'Cosmic',
	[947] = 'Azeroth',
	[948] = 'The Maelstrom',
	[971] = 'Telogrus Rift',
	[972] = 'Telogrus Rift',
	[973] = 'The Sunwell',
	[974] = 'Tol Dagor',
	[975] = 'Tol Dagor',
	[976] = 'Tol Dagor',
	[977] = 'Tol Dagor',
	[978] = 'Tol Dagor',
	[979] = 'Tol Dagor',
	[980] = 'Tol Dagor',
	[981] = 'Un\'gol Ruins',
	[985] = 'Eastern Kingdoms',
	[986] = 'Kalimdor',
	[987] = 'Outland',
	[988] = 'Northrend',
	[989] = 'Pandaria',
	[990] = 'Draenor',
	[991] = 'Zandalar',
	[992] = 'Kul Tiras',
	[993] = 'Broken Isles',
	[994] = 'Argus',
	[997] = 'Tirisfal Glades',
	[998] = 'Undercity',
	[1004] = 'Kings\' Rest',
	[1009] = 'Atul\'Aman',
	[1010] = 'The MOTHERLODE!!',
	[1011] = 'Zandalar',
	[1012] = 'Stormwind City',
	[1013] = 'The Stockade',
	[1014] = 'Kul Tiras',
	[1015] = 'Waycrest Manor',
	[1016] = 'Waycrest Manor',
	[1017] = 'Waycrest Manor',
	[1018] = 'Waycrest Manor',
	[1021] = 'Chamber of Heart',
	[1022] = 'Uncharted Island',
	[1029] = 'Waycrest Manor',
	[1030] = 'Greymane Manor',
	[1031] = 'Greymane Manor',
	[1032] = 'Skittering Hollow',
	[1033] = 'The Rotting Mire',
	[1034] = 'Verdant Wilds',
	[1035] = 'Molten Cay',
	[1036] = 'The Dread Chain',
	[1037] = 'Whispering Reef',
	[1038] = 'Temple of Sethraliss',
	[1039] = 'Shrine of the Storm',
	[1040] = 'Shrine of the Storm',
	[1041] = 'The Underrot',
	[1042] = 'The Underrot',
	[1043] = 'Temple of Sethraliss',
	[1044] = 'Arathi Highlands',
	[1045] = 'Thros, The Blighted Lands',
	[1148] = 'Uldir',
	[1149] = 'Uldir',
	[1150] = 'Uldir',
	[1151] = 'Uldir',
	[1152] = 'Uldir',
	[1153] = 'Uldir',
	[1154] = 'Uldir',
	[1155] = 'Uldir',
	[1156] = 'The Great Sea',
	[1157] = 'The Great Sea',
	[1158] = 'Arathi Highlands',
	[1159] = 'Blackrock Depths',
	[1160] = 'Blackrock Depths',
	[1161] = 'Boralus',
	[1162] = 'Siege of Boralus',
	[1163] = 'Dazar\'alor',
	[1164] = 'Dazar\'alor',
	[1165] = 'Dazar\'alor',
	[1166] = 'Zanchul',
	[1167] = 'Zanchul',
	[1169] = 'Tol Dagor',
	[1170] = 'Gorgrond',
	[1171] = 'Gol Thovas',
	[1172] = 'Gol Thovas',
	[1173] = 'Rastakhan\'s Might',
	[1174] = 'Rastakhan\'s Might',
	[1176] = 'Breath Of Pa\'ku',
	[1177] = 'Breath Of Pa\'ku',
	[1179] = 'Abyssal Melody',
	[1180] = 'Abyssal Melody',
	[1181] = 'Zuldazar',
	[1182] = 'Saltstone Mine',
	[1183] = 'Thornheart',
	[1184] = 'Winterchill Mine',
	[1185] = 'Winterchill Mine',
	[1186] = 'Blackrock Depths',
	[1187] = 'Azsuna',
	[1188] = 'Val\'sharah',
	[1189] = 'Highmountain',
	[1190] = 'Stormheim',
	[1191] = 'Suramar',
	[1192] = 'Broken Shore',
	[1193] = 'Zuldazar',
	[1194] = 'Nazmir',
	[1195] = 'Vol\'dun',
	[1196] = 'Tiragarde Sound',
	[1197] = 'Drustvar',
	[1198] = 'Stormsong Valley',
	[1203] = 'Darkshore',
	[1208] = 'Eastern Kingdoms',
	[1209] = 'Kalimdor',
	[1244] = 'Arathi Highlands',
	[1245] = 'Badlands',
	[1246] = 'Blasted Lands',
	[1247] = 'Tirisfal Glades',
	[1248] = 'Silverpine Forest',
	[1249] = 'Western Plaguelands',
	[1250] = 'Eastern Plaguelands',
	[1251] = 'Hillsbrad Foothills',
	[1252] = 'The Hinterlands',
	[1253] = 'Dun Morogh',
	[1254] = 'Searing Gorge',
	[1255] = 'Burning Steppes',
	[1256] = 'Elwynn Forest',
	[1257] = 'Deadwind Pass',
	[1258] = 'Duskwood',
	[1259] = 'Loch Modan',
	[1260] = 'Redridge Mountains',
	[1261] = 'Swamp of Sorrows',
	[1262] = 'Westfall',
	[1263] = 'Wetlands',
	[1264] = 'Stormwind City',
	[1265] = 'Ironforge',
	[1266] = 'Undercity',
	[1267] = 'Eversong Woods',
	[1268] = 'Ghostlands',
	[1269] = 'Silvermoon City',
	[1270] = 'Isle of Quel\'Danas',
	[1271] = 'Gilneas',
	[1272] = 'Vashj\'ir',
	[1273] = 'Ruins of Gilneas',
	[1274] = 'Stranglethorn Vale',
	[1275] = 'Twilight Highlands',
	[1276] = 'Tol Barad',
	[1277] = 'Tol Barad Peninsula',
	[1305] = 'Durotar',
	[1306] = 'Mulgore',
	[1307] = 'Northern Barrens',
	[1308] = 'Teldrassil',
	[1309] = 'Darkshore',
	[1310] = 'Ashenvale',
	[1311] = 'Thousand Needles',
	[1312] = 'Stonetalon Mountains',
	[1313] = 'Desolace',
	[1314] = 'Feralas',
	[1315] = 'Dustwallow Marsh',
	[1316] = 'Tanaris',
	[1317] = 'Azshara',
	[1318] = 'Felwood',
	[1319] = 'Un\'Goro Crater',
	[1320] = 'Moonglade',
	[1321] = 'Silithus',
	[1322] = 'Winterspring',
	[1323] = 'Thunder Bluff',
	[1324] = 'Darnassus',
	[1325] = 'Azuremyst Isle',
	[1326] = 'The Exodar',
	[1327] = 'Bloodmyst Isle',
	[1328] = 'Mount Hyjal',
	[1329] = 'Southern Barrens',
	[1330] = 'Uldum',
	[1331] = 'The Exodar',
	[1332] = 'Darkshore',
	[1333] = 'Darkshore',
	[1334] = 'Wintergrasp',
	[1335] = 'Cooking: Impossible',
	[1336] = 'Havenswood',
	[1337] = 'Jorundall',
	[1338] = 'Darkshore',
	[1339] = 'Warsong Gulch',
	[1343] = '8.1 Darkshore Outdoor Final Phase',
	[1345] = 'Crucible of Storms',
	[1346] = 'Crucible of Storms',
	[1347] = 'Zandalari Treasury',
	[1348] = 'Zandalari Treasury',
	[1349] = 'Tol Dagor',
	[1350] = 'Tol Dagor',
	[1351] = 'Tol Dagor',
	[1352] = 'Battle of Dazar\'alor',
	[1353] = 'Battle of Dazar\'alor',
	[1354] = 'Battle of Dazar\'alor',
	[1355] = 'Nazjatar',
	[1356] = 'Battle of Dazar\'alor',
	[1357] = 'Battle of Dazar\'alor',
	[1358] = 'Battle of Dazar\'alor',
	[1359] = 'Icecrown Citadel',
	[1360] = 'Icecrown Citadel',
	[1361] = 'OldIronforge',
	[1362] = 'Shrine of the Storm',
	[1363] = 'Crucible of Storms',
	[1364] = 'Battle of Dazar\'alor',
	[1366] = 'Arathi Basin',
	[1367] = 'Battle of Dazar\'alor',
	[1371] = 'GnomereganA',
	[1372] = 'GnomereganB',
	[1374] = 'GnomereganD',
	[1375] = 'Halls of Stone',
	[1379] = '8.3 Visions of N\'Zoth',
	[1380] = 'GnomereganC',
	[1381] = 'Uldir',
	[1382] = 'Uldir',
	[1383] = 'Arathi Basin',
	[1384] = 'Northrend',
	[1396] = 'Borean Tundra',
	[1397] = 'Dragonblight',
	[1398] = 'Grizzly Hills',
	[1399] = 'Howling Fjord',
	[1400] = 'Icecrown',
	[1401] = 'Sholazar Basin',
	[1402] = 'The Storm Peaks',
	[1403] = 'Zul\'Drak',
	[1404] = 'Wintergrasp',
	[1405] = 'Crystalsong Forest',
	[1406] = 'Hrothgar\'s Landing',
	[1407] = 'Prison of Ink',
	[1408] = 'Ashran',
	[1409] = 'Exile\'s Reach',
	[1462] = 'Mechagon Island',
	[1465] = 'Scarlet Halls',
	[1467] = 'Outland',
	[1468] = 'The Dreamgrove',
	[1469] = 'Vision of Orgrimmar',
	[1470] = 'Vision of Stormwind',
	[1471] = 'Emerald Dreamway',
	[1472] = 'The Dragon\'s Spine',
	[1473] = 'Chamber of Heart',
	[1474] = 'The Maelstrom',
	[1475] = 'The Emerald Dream',
	[1476] = 'Twilight Highlands',
	[1478] = 'Ashran',
	[1479] = 'Baine Rescue',
	[1490] = 'Mechagon',
	[1491] = 'Mechagon',
	[1493] = 'Mechagon',
	[1494] = 'Mechagon',
	[1497] = 'Mechagon',
	[1499] = 'Zin-Azshari',
	[1501] = 'Crestfall',
	[1502] = 'Snowblossom Village',
	[1504] = 'Nazjatar',
	[1505] = 'Stratholme',
	[1512] = 'The Eternal Palace',
	[1513] = 'The Eternal Palace',
	[1514] = 'The Eternal Palace',
	[1515] = 'The Eternal Palace',
	[1516] = 'The Eternal Palace',
	[1517] = 'The Eternal Palace',
	[1518] = 'The Eternal Palace',
	[1519] = 'The Eternal Palace',
	[1520] = 'The Eternal Palace',
	[1521] = 'Karazhan Catacombs',
	[1522] = 'Crumbling Cavern',
	[1523] = 'Solesa Naksu [DNT]',
	[1525] = 'Revendreth',
	[1527] = 'Uldum',
	[1528] = 'Nazjatar',
	[1530] = 'Vale of Eternal Blossoms',
	[1531] = 'Crapopolis',
	[1532] = 'Crapopolis',
	[1533] = 'Bastion',
	[1534] = 'Orgrimmar',
	[1535] = 'Durotar',
	[1536] = 'Maldraxxus',
	[1537] = 'Alterac Valley',
	[1538] = 'Blackwing Descent',
	[1539] = 'Blackwing Descent',
	[1540] = 'Halls of Origination',
	[1541] = 'Halls of Origination',
	[1542] = 'Halls of Origination',
	[1543] = 'The Maw',
	[1544] = 'Mogu\'shan Palace',
	[1545] = 'Mogu\'shan Palace',
	[1546] = 'Mogu\'shan Palace',
	[1547] = 'Mogu\'shan Vaults',
	[1548] = 'Mogu\'shan Vaults',
	[1549] = 'Mogu\'shan Vaults',
	[1550] = 'The Shadowlands',
	[1552] = 'Caverns of Time',
	[1553] = 'Caverns of Time',
	[1554] = 'Serpentshrine Cavern',
	[1555] = 'Tempest Keep',
	[1556] = 'Hyjal Summit',
	[1557] = 'Naxxramas',
	[1558] = 'Icecrown Citadel',
	[1559] = 'The Bastion of Twilight',
	[1560] = 'Blackwing Lair',
	[1561] = 'Firelands',
	[1563] = 'Trial of the Crusader',
	[1565] = 'Ardenweald',
	[1569] = 'Bastion',
	[1570] = 'Vale of Eternal Blossoms',
	[1571] = 'Uldum',
	[1573] = 'Mechagon City',
	[1574] = 'Mechagon City',
	[1576] = 'Deepwind Gorge',
	[1577] = 'Gilneas City',
	[1578] = 'Blackrock Depths',
	[1579] = 'Pools Of Power',
	[1580] = 'Ny\'alotha',
	[1581] = 'Ny\'alotha',
	[1582] = 'Ny\'alotha',
	[1590] = 'Ny\'alotha',
	[1591] = 'Ny\'alotha',
	[1592] = 'Ny\'alotha',
	[1593] = 'Ny\'alotha',
	[1594] = 'Ny\'alotha',
	[1595] = 'Ny\'alotha',
	[1596] = 'Ny\'alotha',
	[1597] = 'Ny\'alotha',
	[1600] = 'Vault of Y\'Shaarj',
	[1602] = 'Icecrown Citadel',
	[1603] = 'Ardenweald',
	[1604] = 'Chamber Of Heart',
	[1609] = 'Darkmaul Citadel',
	[1610] = 'Darkmaul Citadel',
	[1611] = 'Dark Citadel',
	[1614] = 'JT_New_A',
	[1615] = 'TG10_Floor [Deprecated]',
	[1616] = 'TG11_Floor [Deprecated]',
	[1617] = 'TG12_Floor [Deprecated]',
	[1618] = 'Torghast',
	[1619] = 'Torghast',
	[1620] = 'Torghast',
	[1621] = 'Torghast',
	[1623] = 'Torghast',
	[1624] = 'Torghast',
	[1627] = 'Torghast',
	[1628] = 'Torghast',
	[1629] = 'Torghast',
	[1630] = 'Torghast',
	[1631] = 'Torghast',
	[1632] = 'Torghast',
	[1635] = 'Torghast',
	[1636] = 'Torghast',
	[1641] = 'Torghast',
	[1642] = 'Val\'sharah',
	[1643] = 'Ardenweald',
	[1644] = 'Ember Court',
	[1645] = 'Torghast',
	[1647] = 'The Shadowlands',
	[1648] = 'The Maw',
	[1649] = 'Etheric Vault',
	[1650] = 'Sightless Hold',
	[1651] = 'Molten Forge',
	[1652] = 'Vault of Souls',
	[1656] = 'Torghast',
	[1658] = 'Alpha_TG_R02',
	[1659] = 'Alpha_TG_R03',
	[1661] = 'Alpha_TG_R05',
	[1662] = 'Queen\'s Conservatory',
	[1663] = 'Halls of Atonement',
	[1664] = 'Halls of Atonement',
	[1665] = 'Halls of Atonement',
	[1666] = 'The Necrotic Wake',
	[1667] = 'The Necrotic Wake',
	[1668] = 'The Necrotic Wake',
	[1669] = 'Mists of Tirna Scithe',
	[1670] = 'Oribos',
	[1671] = 'Oribos',
	[1672] = 'Oribos',
	[1673] = 'Oribos',
	[1674] = 'Plaguefall',
	[1675] = 'Sanguine Depths',
	[1676] = 'Sanguine Depths',
	[1677] = 'De Other Side',
	[1678] = 'De Other Side',
	[1679] = 'De Other Side',
	[1680] = 'De Other Side',
	[1681] = 'Icecrown Citadel',
	[1682] = 'Icecrown Citadel',
	[1683] = 'Theater of Pain',
	[1684] = 'Theater of Pain',
	[1685] = 'Theater of Pain',
	[1686] = 'Theater of Pain',
	[1687] = 'Theater of Pain',
	[1688] = 'Revendreth',
	[1689] = 'Maldraxxus',
	[1690] = 'Aspirant\'s Quarters',
	[1691] = 'Shattered Grove',
	[1692] = 'Spires Of Ascension',
	[1693] = 'Spires Of Ascension',
	[1694] = 'Spires Of Ascension',
	[1695] = 'Spires Of Ascension',
	[1697] = 'Plaguefall',
	[1698] = 'Seat of the Primus',
	[1699] = 'Sinfall',
	[1700] = 'Sinfall',
	[1701] = 'Heart of the Forest',
	[1702] = 'Heart of the Forest',
	[1703] = 'Heart of the Forest',
	[1705] = 'Torghast',
	[1707] = 'Elysian Hold',
	[1708] = 'Elysian Hold',
	[1709] = 'Ardenweald',
	[1711] = 'Ascension Coliseum',
	[1712] = 'Torghast',
	[1713] = 'Path of Wisdom',
	[1714] = 'Third Chamber of Kalliope',
	[1715] = 'Vestibule Of Eternity',
	[1716] = 'Torghast',
	[1717] = 'Chill\'s Reach',
	[1720] = 'Covenant_Ard_Torghast',
	[1721] = 'Torghast',
	[1724] = 'Vortrexxis',
	[1726] = 'The North Sea',
	[1727] = 'The North Sea',
	[1728] = 'The Runecarver',
	[1734] = 'Revendreth',
	[1735] = 'Castle Nathria',
	[1736] = 'Torghast',
	[1738] = 'Revendreth',
	[1739] = 'Ardenweald',
	[1740] = 'Ardenweald',
	[1741] = 'Maldraxxus',
	[1742] = 'Revendreth',
	[1744] = 'Castle Nathria',
	[1745] = 'Castle Nathria',
	[1746] = 'Castle Nathria',
	[1747] = 'Castle Nathria',
	[1748] = 'Castle Nathria',
	[1749] = 'Torghast',
	[1750] = 'Castle Nathria',
	[1751] = 'Torghast',
	[1752] = 'Torghast',
	[1753] = 'Torghast',
	[1754] = 'Torghast',
	[1755] = 'Castle Nathria',
	[1756] = 'Torghast',
	[1757] = 'Torghast',
	[1758] = 'Torghast',
	[1759] = 'Torghast',
	[1760] = 'Torghast',
	[1761] = 'Torghast',
	[1762] = 'Torghast, Tower of the Damned',
	[1763] = 'Torghast',
	[1764] = 'Torghast',
	[1765] = 'Torghast',
	[1766] = 'Torghast',
	[1767] = 'Torghast',
	[1768] = 'Torghast',
	[1769] = 'Torghast',
	[1770] = 'Torghast',
	[1771] = 'Torghast',
	[1772] = 'Torghast',
	[1773] = 'Torghast',
	[1774] = 'Torghast',
	[1776] = 'Torghast',
	[1777] = 'Torghast',
	[1778] = 'Torghast',
	[1779] = 'Torghast',
	[1780] = 'Torghast',
	[1781] = 'Torghast',
	[1782] = 'Torghast',
	[1783] = 'Torghast',
	[1784] = 'Torghast',
	[1785] = 'Torghast',
	[1786] = 'Torghast',
	[1787] = 'Torghast',
	[1788] = 'Torghast',
	[1789] = 'Torghast',
	[1791] = 'Torghast',
	[1792] = 'Torghast',
	[1793] = 'Torghast',
	[1794] = 'Torghast',
	[1795] = 'Torghast',
	[1796] = 'Torghast',
	[1797] = 'Torghast',
	[1798] = 'Torghast',
	[1799] = 'Torghast',
	[1800] = 'Torghast',
	[1801] = 'Torghast',
	[1802] = 'Torghast',
	[1803] = 'Torghast',
	[1804] = 'Torghast',
	[1805] = 'Torghast',
	[1806] = 'Torghast',
	[1807] = 'Torghast',
	[1808] = 'Torghast',
	[1809] = 'Torghast',
	[1810] = 'Torghast',
	[1811] = 'Torghast',
	[1812] = 'Torghast',
	[1813] = 'Bastion',
	[1814] = 'Maldraxxus',
	[1816] = 'Claw\'s Edge',
	[1818] = 'Tirna Vaal',
	[1819] = 'Fungal Terminus',
	[1820] = 'Pit of Anguish',
	[1821] = 'Pit of Anguish',
	[1822] = 'Extractor\'s Sanatorium',
	[1823] = 'Altar of Domination',
	[1824] = 'Matriarch\'s Den',
	[1825] = 'The Root Cellar',
	[1826] = 'The Root Cellar',
	[1827] = 'The Root Cellar',
	[1833] = 'Torghast',
	[1834] = 'Torghast',
	[1835] = 'Torghast',
	[1836] = 'Torghast',
	[1837] = 'Torghast',
	[1838] = 'Torghast',
	[1839] = 'Torghast',
	[1840] = 'Torghast',
	[1841] = 'Torghast',
	[1842] = 'Torghast',
	[1843] = 'Torghast',
	[1844] = 'Torghast',
	[1845] = 'Torghast',
	[1846] = 'Torghast',
	[1847] = 'Torghast',
	[1848] = 'Torghast',
	[1849] = 'Torghast',
	[1850] = 'Torghast',
	[1851] = 'Torghast',
	[1852] = 'Torghast',
	[1853] = 'Torghast',
	[1854] = 'Torghast',
	[1855] = 'Torghast',
	[1856] = 'Torghast',
	[1857] = 'Torghast',
	[1858] = 'Torghast',
	[1859] = 'Torghast',
	[1860] = 'Torghast',
	[1861] = 'Torghast',
	[1862] = 'Torghast',
	[1863] = 'Torghast',
	[1864] = 'Torghast',
	[1865] = 'Torghast',
	[1867] = 'Torghast',
	[1868] = 'Torghast',
	[1869] = 'Torghast',
	[1870] = 'Torghast',
	[1871] = 'Torghast',
	[1872] = 'Torghast',
	[1873] = 'Torghast',
	[1874] = 'Torghast',
	[1875] = 'Torghast',
	[1876] = 'Torghast',
	[1877] = 'Torghast',
	[1878] = 'Torghast',
	[1879] = 'Torghast',
	[1880] = 'Torghast',
	[1881] = 'Torghast',
	[1882] = 'Torghast',
	[1883] = 'Torghast',
	[1884] = 'Torghast',
	[1885] = 'Torghast',
	[1886] = 'Torghast',
	[1887] = 'Torghast',
	[1888] = 'Torghast',
	[1889] = 'Torghast',
	[1890] = 'Torghast',
	[1891] = 'Torghast',
	[1892] = 'Torghast',
	[1893] = 'Torghast',
	[1894] = 'Torghast',
	[1895] = 'Torghast',
	[1896] = 'Torghast',
	[1897] = 'Torghast',
	[1898] = 'Torghast',
	[1899] = 'Torghast',
	[1900] = 'Torghast',
	[1901] = 'Torghast',
	[1902] = 'Torghast',
	[1903] = 'Torghast',
	[1904] = 'Torghast',
	[1905] = 'Torghast',
	[1907] = 'Torghast',
	[1908] = 'Torghast',
	[1909] = 'Torghast',
	[1910] = 'Torghast',
	[1911] = 'Torghast',
	[1912] = 'The Runecarver\'s Oubliette',
	[1913] = 'Torghast',
	[1914] = 'Torghast',
	[1917] = 'De Other Side',
	[1920] = 'Torghast',
	[1921] = 'Torghast',
	[1922] = 'Draenor',
	[1923] = 'Pandaria',
	[1958] = 'Firelands',
	[1959] = 'Firelands',
	[1960] = 'The Maw',
	[1961] = 'Korthia',
	[1962] = 'Torghast',
	[1963] = 'Torghast',
	[1964] = 'Torghast',
	[1965] = 'Torghast',
	[1966] = 'Torghast',
	[1967] = 'Torghast',
	[1968] = 'Torghast',
	[1969] = 'Torghast',
	[1970] = 'Zereth Mortis',
	[1971] = 'Skyhold',
	[1974] = 'Torghast',
	[1975] = 'Torghast',
	[1976] = 'Torghast',
	[1977] = 'Torghast',
	[1979] = 'Torghast',
	[1980] = 'Torghast',
	[1981] = 'Torghast',
	[1982] = 'Torghast',
	[1983] = 'Torghast',
	[1984] = 'Torghast',
	[1985] = 'Torghast',
	[1986] = 'Torghast',
	[1987] = 'Torghast',
	[1988] = 'Torghast',
	[1989] = 'Tazavesh, the Veiled Market',
	[1990] = 'Tazavesh, the Veiled Market',
	[1991] = 'Tazavesh, the Veiled Market',
	[1992] = 'Tazavesh, the Veiled Market',
	[1993] = 'Tazavesh, the Veiled Market',
	[1995] = 'Tazavesh, the Veiled Market',
	[1996] = 'Tazavesh, the Veiled Market',
	[1997] = 'Tazavesh, the Veiled Market',
	[1998] = 'Sanctum of Domination',
	[1999] = 'Sanctum of Domination',
	[2000] = 'Sanctum of Domination',
	[2001] = 'Sanctum of Domination',
	[2002] = 'Sanctum of Domination',
	[2003] = 'Sanctum of Domination',
	[2004] = 'Sanctum of Domination',
	[2005] = 'Ardenweald',
	[2006] = 'Cavern of Contemplation',
	[2007] = 'Gromit Hollow',
	[2008] = 'Chamber of the Sigil',
	[2009] = 'TG106_Floor_MM',
	[2010] = 'Torghast',
	[2011] = 'Torghast',
	[2012] = 'Torghast',
	[2016] = 'Tazavesh, the Veiled Market',
	[2017] = 'Spires Of Ascension',
	[2018] = 'Spires Of Ascension',
	[2019] = 'Torghast',
	[2027] = 'Zereth Mortis',
	[2028] = 'Zereth Mortis',
	[2029] = 'Zereth Mortis',
	[2030] = 'Zereth Mortis',
	[2031] = 'Zereth Mortis',
	[2042] = 'Oribos',
	[2046] = 'Zereth Mortis',
	[2047] = 'Sepulcher of the First Ones',
	[2048] = 'Sepulcher of the First Ones',
	[2049] = 'Sepulcher of the First Ones',
	[2050] = 'Sepulcher of the First Ones',
	[2051] = 'Sepulcher of the First Ones',
	[2052] = 'Sepulcher of the First Ones',
	[2055] = 'Zereth Mortis',
	[2059] = 'Zereth Mortis',
	[2061] = 'Sepulcher of the First Ones',
	[2066] = 'Zereth Mortis',
}

local GetCategorie = {

	--CategoryParent
	-- Pvp = 95
	-- Contenu d'extension = 15301
	-- Evénements mondiaux = 155

	--Divers
	['Arena'] = 165,
	['Darkmoon Island'] = 15101,
	['Deeprun Tram'] = 15202, -- Brawlers Alliance
	['Brawl\'gar Arena'] = 15202, -- Brawlers Horde
	-- Battlegrounds
	['Arathi Basin'] = 14802,
	['Alterac Valley'] = 14801,
	['Eye of the Storm'] = 14803,
	['Warsong Gulch'] = 14804,
	['Strand of the Ancients'] = 14881,
	['Wintergrasp'] = 14901,
	-- Cataclysm
	['Isle of Conquest'] = 15003,
	['Battle for Gilneas'] = 15073,
	['Twin Peaks'] = 15074,
	['Tol Barad'] = 15075,
	-- Mop
	['Silvershard Mines'] = 15162,
	['Temple of Kotmogu'] = 15163,
	['Deepwind Gorge'] = 15218,
	-- WOD
	['Lunarfall'] = 15303, -- Garrison Alliance
	['Frostwall'] = 15303, -- Garrison Horde
	['Ashran'] = 15241,
	-- BFA


}

local GetAchievementList = {
	-- VANILLA
	-- Régions
	['Arathi Highlands'] = {4896,},
	['Badlands'] = {4900,5444,},
	['Blade\'s Edge Mountains'] = {1193,1276,},
	['Blasted Lands'] = {4909,},
	['Burning Steppes'] = {4901,},
	['Desolace'] = {4930,},
	['Eastern Plaguelands'] = {4892,},
	['Felwood'] = {4931,},
	['Netherstorm'] = {1194,},
	['Northern Stranglethorn'] = {4906,},
	['Searing Gorge'] = {4910,},
	['Sholazar Basin'] = {39,938,},
	['Silithus'] = {4934,},
	['Swamp of Sorrows'] = {4904,},
	['Tanaris'] = {4935,},
	['The Cape of Stranglethorn'] = {4905,},
	['The Hinterlands'] = {4897,},
	['The Storm Peaks'] = {38,1428,},
	['Thousand Needles'] = {4938,},
	['Un\'Goro Crater'] = {4939,},
	['Western Plaguelands'] = {4893,},
	['Winterspring'] = {4940,5443,},
	['Zangarmarsh'] = {1190,},
	['Azshara']  = {5547,5448,5546,},
	['Darkshore'] = {5453,},
	-- Dungeons
	-- Raid

	-- BURNING CRUSADE
	-- Régions
	['Terokkar Forest'] = {1275,},
	['Nagrand'] = {939,},
	['Shadowmoon Valley'] = {1195,},
	-- Dungeons
	-- Raid

	-- LICH KING
	-- Régions
	['Zul\'Drak'] = {36,1596,},
	['Dragonblight'] = {1277,547,},
	['Borean Tundra'] = {561,},
	['Icecrown'] = {40,},
	-- Dungeons
	['Utgarde Keep'] = {['HM'] = {1919,},},
	['The Nexus'] = {['HM'] = {2150,2036,2037,},},
	['Azjol-Nerub'] = {['HM'] = {1860,1296,1297,},},
	['Ahn\'kahet: The Old Kingdom'] = {['HM'] = {1862,2038,2056,},},
	['Drak\'Tharon Keep'] = {['HM'] = {2151,2057,2039,},},
	['The Violet Hold'] = {['HM'] = {2041,1865,2153,1816,},},
	['Gundrak'] = {['HM'] = {2058,2152,2040,1864,},},
	['Halls of Stone'] = {['HM'] = {2151,1866,2155,},},
	['Utgarde Pinnacle'] = {['HM'] = {2043,2156,2157,1873,1790,},},
	['The Oculus'] = {['HM'] = {1871,1868,2046,2044,2045,},},
	['Halls of Lightning'] = {['HM'] = {1834,2042,1867,},},
	['Trial of the Champion'] = {['HM'] = {3802,3804,3803,},},
	['The Culling of Stratholme'] = {['HM'] = {1872,1817,},},
	['Pit of Saron'] = {['HM'] = {4525,4524,},},
	['The Forge of Souls'] = {['HM'] = {4522,4523,},},
	['Halls of Reflection'] = {['HM'] = {4526,},},
	-- Raid
	['Onyxia\'s Lair'] = {
		['10'] = {4402,4404,4403,},
		['25'] = {4405,4407,4406,},
	},
	['Vault of Archavon'] = {
		['10'] = {4016,},
		['25'] = {4017,},
	},
	['The Eye of Eternity'] = {
		['10'] = {1874,2148},
		['25'] = {1875,2149},
	},
	['The Obsidian Sanctum'] = {
		['10'] = {2049,2050,2051,624,2047},
		['25'] = {2052,2053,2054,1877,2048},
	},
	['Naxxramas'] = {
		['10'] = {1997,1858,1856,2178,2176,1996,2182,2146,2184,578},
		['25'] = {2140,1859,1857,2179,2177,2139,2183,2147,2185,579},
	},
	['Ulduar'] = {
		['10'] = {2907,2909,3056,2905,2911,2925,2927,2930,2923,2919,2933,3058,2937,2934,2931,2947,2945,2941,2940,2939,2951,2959,2953,2955,3006,3076,2961,3182,2963,2967,3176,2971,2977,2975,2973,2982,2980,3179,2989,3180,3138,3181,2996,3159,3015,3008,3012,3014,3003},
		['25'] = {2908,2910,3057,2906,2912,2926,2928,2929,2924,2921,3059,2938,2936,2932,2948,2946,2944,2943,2942,2952,2960,2954,2956,3007,3077,2962,3184,2965,2968,3183,2972,2978,2976,2974,2983,2981,3187,3237,3189,2995,3188,2997,3164,3016,3010,3013,3017,3002},
	},
	['Trial of the Crusader'] = {
		['10'] = {3917,3797,3936,3996,3799,3800},
		['25'] = {3916,3813,3937,3997,3815,3816},
	},
	['Icecrown Citadel'] = {
		['10'] = {4534,4535,4536,4537,4538,4577,4578,4582,4539,4579,4580,4581,4601},
		['25'] = {4610,4611,4612,4613,4614,4615,4616,4617,4618,4619,4620,4622,4621},
	},

	-- CATACLYSM
	-- Régions
	['Mount Hyjal'] = {4870,5869,4959,5864,5868,5861,5483,5865,5862,5860,},
	['Vashj\'ir'] = {4975,5452,},
	['Twilight Highlands'] = {5451,4960,},
	['Molten Front'] = {5870,5872,5874,5859,5866,5871,5867,},
	['Uldum'] = {4872,4961,5317,},
	['Deepholm'] = {4871,5445,5450,5446,5447,5449,},
	-- Dungeons
	['Blackrock Caverns'] = {['HM'] = {5281,5282,5283,5284,},},
	['Lost City of the Tol\'vir'] = {['HM'] = {5290,5291,5292,},},
	['Grim Batol'] = {['HM'] = {5297,5298,},},
	['Throne of the Tides'] = {['HM'] = {5285,5286,},},
	['End Time'] = {['HM'] = {5995,6130,},},
	['The Vortex Pinnacle'] = {['HM'] = {5288,5289,},},
	['The Stonecore'] = {['HM'] = {5287,},},
	['Hour of Twilight'] = {['HM'] = {},},
	['Well of Eternity'] = {['HM'] = {6127,6070,},},
	['Halls of Origination'] = {['HM'] = {5294,5295,5293,5296,},},
	['Zul\'Aman'] = {['HM'] = {5761,5750,5760,5858,},},
	['Zul\'Gurub'] = {['HM'] = {5744,5743,5759,5762,},},
	-- Raid
	['Blackwing Lair'] = {['NM'] = {5306,5309,5307,5310,5308,4849,4842},},
	['The Bastion of Twilight'] = {['NM'] = {4852,5312,5311,4850},},
	['Throne of the Four Winds'] = {['NM'] = {5304,5305,4851},},
	['Firelands'] = {['NM'] = {5810,5813,5829,5821,5855,5799,5830,5802},},
	['Dragon Soul'] = {['NM'] = {6174,6180,6128,6105,6133,6107,6175,6084},},

	-- MYSTS OF PANDARIA
	-- Régions
	['Kun-Lai Summit'] = {6537,7286,},
	['Dread Wastes'] = {6540,7316,7312,7313,},
	['Townlong Steppes'] = {6539,7297,7298,7288,7299,},
	['Vale of Eternal Blossoms'] = {7315,7317,7319,7320,},
	['Valley of the Four Winds'] = {6301,7295,},
	['Isle of Thunder'] = {8099,8103,8104,8108,8109,8111,8114,8116,8118,8120,8101,8105,8107,8110,8112,8115,8117,8119,8212},
	['Isle of Giants'] = {8123,},
	['Timeless Isle'] = {8714,8726,8729,8712,8728,8730,8727,8723,8784,8722,8725,8724,8743,},
	-- Scenario
	['Arena of Annihilation'] = {7273,7272},
	['Crypt of Forgotten Kings'] = {7275,7276},
	['Brewmoon Festival'] = {6930,6931},
	['Theramore\'s Fall (A)'] = {7527,7526},
	['Theramore\'s Fall (H)'] = {7530,7529},
	['Greenstone Village'] = {7266,7267},
	['A Brewing Storm'] = {7261,7258,7257},
	['Unga Ingoo'] = {7231,7232,7239,7248},
	['Lion\'s Landing (A)'] = {8011,8012},
	['Domination Point (H)'] = {8014,8015},
	['A Little Patience'] = {7989,7990,7991,7992,7993},
	['Dagger in the Dark'] = {7984,7986,7987},
	['Assault on Zan\'vess'] = {8017,8016},
	['Thunder King\'s Citadel'] = {8106,},
	['Dark Heart of Pandaria'] = {8319,},
	['Battle on the High Seas'] = {8347,},
	['Blood in the Snow'] = {8329,8330,},
	['The Secrets of Ragefire'] = {8295,},
	-- Dungeons
	['Stormstout Brewery'] = {['HM'] = {6420,6400,6089,6402,},},
	['Shado-Pan Monastery'] = {['HM'] = {6477,6472, 6471,},},
	['Scarlet Monastery'] = {['HM'] = {6929,6946,6928,},},
	['Mogu\'shan Palace'] = {['HM'] = {6478,6736,6713,},},
	['Gate of the Setting Sun'] = {['HM'] = {6476,6479,6945,},},
	['Scarlet Halls'] = {['HM'] = {6427,6684,},},
	['Scholomance'] = {['HM'] = {6531,6394,6396,6821,},},
	['Siege of Niuzao Temple'] = {['HM'] = {6822,6688,6485,},},
	['Temple of the Jade Serpent'] = {['HM'] = {6460,6475,6671,},},
	-- Raid
	['Mogu\'shan Vaults'] = {['NM'] = {6455,7056,6687,6823,6674,6686,},},
	['Heart of Fear'] = {['NM'] = {6553,6937,6922,6683,6518,6936,},},
	['Terrace of Endless Spring'] = {['NM'] = {6824,6825,6717,6933,},},
	['Throne of Thunder'] = {['NM'] = {8094,8038,8073,8077,8082,8097,8098,8037,8081,8087,8086,8090,},},
	['Siege of Orgrimmar'] = {['NM'] = {8537,8529,8461,8448,8530,8520,8462,8543,8459,8527,8531,8453,8536,8538,8521,8532,8528,8679,},},

	-- DRAENOR
	-- Régions
	['Gorgrond'] = {8939,9400,9401,9402,9659,9607,9659,9656,9655,9667,9663,9658,9678,9654,},
	['Frostfire Ridge'] = {8937,9533,9535,9534,9710,9711,9536,9537,},
	['Shadowmoon Valley (Draenor)'] = {8938,9433,8845,9434,9483,9437,9435,9433,9481,9436,9479,9432,},
	['Nagrand (Draenor)'] = {8942,9615,9617,9541,9548,9610,},
	['Talador'] = {8940,9632,9638,9674,9434,9636,9634,9637,9632,9638,9636,9635,9633,9486,},
	['Spires of Arak'] = {8941,9613,9612,9600,9571,9601,},
	['Tanaan Jungle'] = {10261,10260,10069,10061,10262,10070,},
	-- Dungeons
	['Auchindoun'] = {['HM'] = {9552,9023,9551,},}, -- Auchindoun
	['Grimrail Depot'] = {['HM'] = {9024,9007,},}, -- Dêpot de Tristerail
	['The Everbloom'] = {['HM'] = {9017,9493,9223,},}, -- La Flore éternelle
	['Bloodmaul Slag Mines'] = {['HM'] = {9008,8993,9005,},}, -- Mine de la Masse-Sanglante
	['Skyreach'] = {['HM'] = {9033,9035,9034,9036,},}, -- Orée-du-ciel
	['Iron Docks'] = {['HM'] = {9082,9083,9081,},}, -- Quais de Fer
	['Shadowmoon Burial Grounds'] = {['HM'] = {9025,9026,9018,},}, -- Terres sacrées de Ombrelune
	['Upper Blackrock Spire'] = {['HM'] = {9057,9058,9045,9056},}, -- Sommets du Pic Rochenoire
	-- Raid
	['Highmaul'] = {['NM'] = {8948,8947,8974,8958,8975,8976,8977,},},
	['Blackrock Foundry'] = {['NM'] = {8979,8980,8930,8983,8982,8978,8929,8981,8984,8952,},},
	['Hellfire Citadel'] = {['NM'] = {10013,10012,10054,10087,10073,9979,10057,10030,9989,10086,10026,9988,9972,},},

	-- LEGION
	-- Régions
	['Azsuna'] = {11261,10665,11256,},
	['Val\'sharah'] = {11262,10666,11258,},
	['Highmountain'] = {11264,10667,11257,},
	['Stormheim'] = {11263,10668,11259,},
	['Suramar'] = {11265,10669,11260,},
	['Dalaran (Broken Isles)'] = {11066,},
	['Broken Shore'] = {11681,11543,11841,11802,11731,11737,11735,11732,11738,11736,11607},
	['Eredath'] = {12084,12101,12102,12103,12104,12069,12074,12077,12078,12028,},
	['Antoran Wastes'] = {12084,12101,12102,12103,12104,12069,12074,12077,12078,12028,},
	['Krokuun'] = {12084,12101,12102,12103,12104,12069,12074,12077,12078,12028,},
	['Argus'] = {12084,12101,12102,12103,12104,12069,12074,12077,12078,12028,},
	-- Dungeons
	['Black Rook Hold'] = {['MM'] = {10709,10710,10711,},}, -- Bastion du Freux
	['Cathedral of Eternal Night'] = {['MM'] = {11768,11703,11769,},}, -- Cathedrale de la Nuit éternelle
	['Vault of the Wardens'] = {['MM'] = {10679,10707,10680,},}, -- Caveau des gardiennes
	['Court of Stars'] = {['MM'] = {10610,10611,},}, -- Cour des étoiles
	['Darkheart Thicket'] = {['MM'] = {10769,10766,},}, -- Fourré Sombrecoeur
	['Helmouth Cliffs'] = {['MM'] = {10413,10411,10412,},}, -- Gueule des âmes
	['The Arcway'] = {['MM'] = {10773,10775,10776,},}, -- L'Arcavia
	['Violet Hold'] = {['MM'] = {10554,10553,},}, -- Fort Pourpre (Legion)
	['Eye of Azshara'] = {['MM'] = {10456,10458,10457,},}, -- Œil d'Azshara
	['Neltharion\'s Lair'] = {['MM'] = {10996,10875,},}, -- Repaire de Neltharion
	['Karazhan (Legion)'] = {['MM'] = {11335,11433,11338,11432,11430,},}, -- Retour à Karazhan
	['Halls of Valor'] = {['MM'] = {10542,10543,10544,},}, -- Salles des Valeureux
	['The Seat of the Triumvirate'] = {['MM'] = {12004,12005,12009,},}, -- Le siège du Triumvirat
	-- Raid
	['The Emerald Nightmare'] = {['NM'] = {10555, 10772,10753,10663,10755,10771,10830,},},
	['Trial of Valor'] = {['NM'] = {11337,11387,11386,11377,},},
	['The Nighthold'] = {['NM'] = {10575,10817,10851,10696,10699,10754,10829,10697,10704,10678,10742,},},
	['Tomb of Sargeras'] = {['NM'] = {11770,11696,11683,11724,11773,11676,11675,11699,11674,},},
	['Antorus, the Burning Throne'] = {['NM'] = {12257, 11948, 12065, 11949, 12030, 11915, 11928, 12046, 12067, 11930, 12129,},},

	-- BATTLE FOR AZEROTH
	-- Régions
	['Tiragarde Sound'] = {12939,13050,12556,13058,13057,12852,},
	['Stormsong Valley'] = {12940,13047,13042,13045,13046,13054,12558,13051,12853,},
	['Drustvar'] = {12941,12557,13094,12995,13087,13083,13064,12941,},
	['Nazmir'] = {12942,13048,13023,12561,12771,},
	['Zuldazar'] = {12944,13048,13035,12559,12851,},
	['Vol\'dun'] = {12943,13011,12560,12849,},
	['Mechagon Island'] = {13696, 13776,13489,13470,13556,13479,13708,13625,13477,13474,13476,13693,13473,13478,13475,13482,13695},
	['Nazjatar'] = {13712,13699,13549,13691,13626,13836,13692,13715,13713,13720,13722,13694,13690,13635,13695,},
	['Uldum (N\'Zoth)'] = {14159,14158,14160,},
	['Vale of Eternal Blossoms (N\'Zoth)'] = {14159,14158,14160,},
	-- Dungeons
	['Freehold'] = {['MM'] = {12548,12998,12550,},}, -- Alliance -- Port-Liberté
	['Tol Dagor'] = {['MM'] = {12462,12457,},}, -- Alliance -- Tol Dagor
	['Waycrest Manor'] = {['MM'] = {12490,12495,12489,},}, -- Alliance -- Manoir Malvoie
	['Shrine of the Storm'] = {['MM'] = {12600,12602,12601,},}, -- Alliance -- Sanctuaire des Tempêtes
	['Siege of Boralus'] = {['MM'] = {12726,12727,12489,},}, -- Alliance -- Siège de Boralus
	['Atal\'Dazar'] = {['MM'] = {12273,12272,12270,},}, -- Horde -- Atal'Dazar
	['The MOTHERLODE!!'] = {['MM'] = {12854,12855,},}, -- Horde -- le Filon !
	['Temple of Sethraliss'] = {['MM'] = {12508,12507,12503,},}, -- Horde -- Temple de Sephraliss
	['The Underrot'] = {['MM'] = {12549,12498,12499,},}, -- Horde -- Les tréfonds Putrides
	['Kings\' Rest'] = {['MM'] = {12723,12722,},}, -- Horde -- Repos des rois
	['Mechagon'] = {['MM'] = {13624,13698,13706,13723,13545,},},
	-- Islands
	['Dread Chain'] = {13095, 13096, 13097, 13098, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['The Rotting Mire'] = {13103, 13104, 13105, 13106, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Un\'gol Ruins'] = {12590, 12589, 12591, 12592, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Whispering Reef'] = {13119, 13118, 13116, 13115, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Havenswood'] = {13396, 13397, 13398, 13400, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Snowblossom Village'] = {13581, 13582, 13583, 13584, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Molten Cay'] = {13099, 13100, 13101, 13102, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Skittering Hollow'] = {13107, 13108, 13109, 13110, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Verdant Wilds'] = {13111, 13112, 13113, 13114, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Jorundall'] = {13389, 13394, 13395, 13399, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	['Crestfall'] = {13577, 13578, 13579, 13580, 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,},
	-- 13142, 13125, 12597, 13120, 12594, 13134, 12595, 13126, 13132, 13128, 13122, 13141, 12596, 13121, 13129, 13127,

	-- Raid
	['Uldir'] = {['NM'] = {12551,12938,12828,12830,12937,12823,12772,12836},}, -- Uldir
	['Dazar\'alor'] = {['NM'] = {13316,13345,13410,13431,13425,13325,13383,13401,13430,},}, -- Bataille de Dazar'alor
	['Crucible of Storms'] = {['NM'] = {13506,13501,},}, -- Creuset des Tempêtes
	['Eternal Palace'] = {['NM'] = {13684,13628,13633,13716,13767,13629,13724,13768,},}, -- Palais éternel
	['Ny\'Alotha'] = {['NM'] = {14019,14037,14023,14026,13999,14147,14008,14024,13990,14139,14038,14148,},}, -- Ny'Alotha, la cité en éveil

	-- SHADOWLANDS
	-- Régions
	['The Maw'] = {15054, 14738, 14761, 14943, 14744, 14742, 14660, 14746, 14747, 14663, 14743, 14659, 14658, 14745, 15001, 15035, 15044, 15042, 15036, 15039, 15000, 15034, 15033, 15032},
	['Bastion'] = {14339, 14737, 14311, 14801, 14307, 14851, 14303, 14514,},
	['Maldraxxus'] = {14802, 14312, 14308, 14799, 14305, 14513,},
	['Ardenweald'] = {14304, 14313, 14788, 14779, 14353, 14309, 14774,},
	['Revendreth'] = {14306, 14798, 14314, 14276, 14310, 14771, 13878, 14856, 14512,},
	['Torghast'] = {15054, 15043, 14778, 15089, 15093, 15095, 15105, 14468, 14570, 15096, 14498, 15327, 15067, 14469, 14809, 15094, 15092, 15091, 14471, 14470, 14483, 14463, 14493, 15076, 14776, 14478, 14568, 14810, 14569, 14473, 15068, 15075, 14472, 14488, 14773, 14571, 14808, 14521, 14848,},
	['Korthia'] = {15107, 15066, 15099, 15053, 15055, 15056, 15057},
	['Zereth Mortis'] = {15509, 15229, 15392, 15331, 15502, 15514, 15513, 15391, 15224, 15512, 15542, 15406, 15407, 15411, 15410},
	-- Congregations
	--['Ascension Coliseum'] = {14502,14851,14853,14854,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,},
	-- Dungeons
	['Plaguefall'] = {['MM'] = {14415, 14296, 14347, 14292, 14369, 14414,},},
	['Tazavesh'] = {['MM'] = {15178, 15190, 15179, 15109, 15106, 15177,},},
	['Sanguine Depths'] = {['MM'] = {14289, 14199, 14290, 14286, 14197, 14198,},},
	['The Necrotic Wake'] = {['NM'] = {14339,}, ['MM'] = {14368, 14295, 14320, 14285, 14366, 14367,},},
	['Mists of Tirna Scithe'] = {['MM'] = {14413, 14291, 14375, 14503, 14412, 14371,},},
	['Spires Of Ascension'] = {['NM'] = {14339,}, ['MM'] = {14327, 14325, 14323, 14331, 14324, 14326,},},
	['De Other Side'] = {['MM'] = {14409, 14354, 14606, 14374, 14373, 14408,},},
	['Halls of Atonement'] = {['MM'] = {14567, 14411, 14352, 14284, 14370, 14410,},},
	['Theater of Pain'] = {['MM'] = {14417, 14607, 14533, 14297, 14372, 14416,},},
	-- Raid
	['Sanctum of Domination'] = {['NM'] = {15065, 15058, 15132, 14998, 15126, 15124, 15123, 15122, 15125, 15133, 15003, 15108, 15105, 15131,}, }, -- Sanctum de Domination
	['Castle Nathria'] = {['NM'] = {14293, 14608, 14610, 14294, 14525, 14376, 14524, 14619, 14617, 14523,}, }, -- Chateau Nathria
	['Sepulcher of the First Ones'] = {['NM'] = {15399, 15492, 15397, 15494, 15416, 15400, 15419, 15401, 15418, 15398, 15396, 15315, 15493, 15381, 15386, 15417, 15478, 15490,}, }, -- Chateau Nathria

}

local GetFactionAchievementList = {

	['Borean Tundra'] = { ["Alliance"] = {33}, ["Horde"] = {1358},},
	['Dragonblight'] = { ["Alliance"] = {35}, ["Horde"] = {1359},},
	['Grizzly Hills'] = { ["Alliance"] = {37}, ["Horde"] = {1357},},
	['Howling Fjord'] = { ["Alliance"] = {34}, ["Horde"] = {1356},},
	['Hellfire Peninsula'] = { ["Alliance"] = {1189}, ["Horde"] = {1271},},
	['Nagrand'] = { ["Alliance"] = {1192}, ["Horde"] = {1273},},
	['Terokkar Forest'] = { ["Alliance"] = {1191}, ["Horde"] = {1272},},
	['Ashenvale'] = { ["Alliance"] = {4925}, ["Horde"] = {4976},},
	['Azshara'] = { ["Alliance"] = {}, ["Horde"] = {4927,5454},},
	['Bloodmyst Isle'] = { ["Alliance"] = {4926},},
	['Darkshore'] = { ["Alliance"] = {4928}, ["Horde"] = {},},
	['Dustwallow Marsh'] = { ["Alliance"] = {4929}, ["Horde"] = {4978},},
	['Feralas'] = { ["Alliance"] = {4932}, ["Horde"] = {4979},},
	['Ghostlands'] = { ["Alliance"] = {}, ["Horde"] = {4908},},
	['Hillsbrad Foothills'] = { ["Alliance"] = {}, ["Horde"] = {4895},},
	['Loch Modan'] = { ["Alliance"] = {4899}, ["Horde"] = {},},
	['Redridge Mountains'] = { ["Alliance"] = {4902}, ["Horde"] = {},},
	['Northern Barrens'] = { ["Alliance"] = {}, ["Horde"] = {4933},},
	['Silverpine Forest'] = { ["Alliance"] = {}, ["Horde"] = {4894},},
	['Southern Barrens'] = { ["Alliance"] = {4937}, ["Horde"] = {4981},},
	['Stonetalon Mountains'] = { ["Alliance"] = {4936}, ["Horde"] = {4980},},
	['Twilight Highlands'] = { ["Alliance"] = {4873,5320,5481,}, ["Horde"] = {5501,5482,5321,},},
	['Vashj\'ir'] = { ["Alliance"] = {4869,5318,}, ["Horde"] = {4982,5319,},},
	['Westfall'] = { ["Alliance"] = {4903,}, ["Horde"] = {},},
	['Wetlands'] = { ["Alliance"] = {4898,}, ["Horde"] = {},},
	['Krasarang Wilds'] = { ["Alliance"] = {6535}, ["Horde"] = {6536},},
	['Kun-Lai Summit'] = { ["Alliance"] = {6537}, ["Horde"] = {6538},},
	['The Jade Forest'] = { ["Alliance"] = {6300}, ["Horde"] = {6534},},

	['Shadowmoon Valley (Draenor)'] = { ["Alliance"] = {8845,9602,9528,}, ["Horde"] = {},},
	['Gorgrond'] = { ["Alliance"] = {8923,}, ["Horde"] = {8924},},
	['Nagrand (Draenor)'] = { ["Alliance"] = {8927,}, ["Horde"] = {8928},},
	['Talador'] = { ["Alliance"] = {8920,}, ["Horde"] = {8919},},
	['Spires of Arak'] = { ["Alliance"] = {8925,}, ["Horde"] = {8926},},
	['Tanaan Jungle'] = { ["Alliance"] = {10068,10072,}, ["Horde"] = {10075,10265,},},
	['Frostfire Ridge'] = { ["Alliance"] = {}, ["Horde"] = {9606,8671,9529,},},

	['Tiragarde Sound'] = { ["Alliance"] = {12473,13059,12087,13049,}, ["Horde"] = {},},
	['Stormsong Valley'] = { ["Alliance"] = {12496,13053,13062,}, ["Horde"] = {},},
	['Drustvar'] = { ["Alliance"] = {12497,13082,}, ["Horde"] = {},},
	['Nazmir'] = { ["Alliance"] = {13026,}, ["Horde"] = {11868,13021,13025,13022,},},
	['Zuldazar'] = { ["Alliance"] = {}, ["Horde"] = {11861,13038,13030,12480,13039,13037,},},
	['Vol\'dun'] = { ["Alliance"] = {}, ["Horde"] = {12478,13017,13014,13009,13041},},
	['Drustvar'] = { ["Alliance"] = {}, ["Horde"] = {13435},},
}

-- ////////////////
--      FRAME
-- ////////////////

function eventHandler(self, event, ...)
	AtaLocalisation(GetLocale())
	DebugPrint('ATAe = ' .. event)
	if event == "VARIABLES_LOADED" then
		if AutoTrackerAchievementDB == nil then
			AutoTrackerAchievementDB = AutoTrackerAchievementDB_Defaut
		else
			local AutoTrackerAchievementDB_temp = AutoTrackerAchievementDB
			AutoTrackerAchievementDB = {}
			for key,value in pairs(AutoTrackerAchievementDB_Defaut) do
				if AutoTrackerAchievementDB_temp[key] ~= nil then
					AutoTrackerAchievementDB[key] = AutoTrackerAchievementDB_temp[key]
				elseif AutoTrackerAchievementDB_Defaut[key] ~= nil then
					AutoTrackerAchievementDB[key] = AutoTrackerAchievementDB_Defaut[key]
				end
			end
		end
	elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
		AchievementListConstructor();
		GetItemsList(GetSetsList());
	end
end

local progressBar = CreateFrame("StatusBar", nil, UIParent) -- ObjectiveTrackerFrame
progressBar:SetStatusBarTexture('Interface\\TargetingFrame\\UI-StatusBar')
progressBar:SetStatusBarColor(0, 0.35, 0);
progressBar:SetFrameStrata("BACKGROUND")
progressBar:SetWidth(235)
progressBar:SetHeight(14) -- for your Texture
-- Drag and Drop
progressBar:SetMovable(true)
progressBar:EnableMouse(true)
progressBar:RegisterForDrag("LeftButton")
progressBar:SetScript("OnDragStart", progressBar.StartMoving)
progressBar:SetScript("OnDragStop", function(self, button)
	self:StopMovingOrSizing();
	point, relativeTo, relativePoint, xOfs, yOfs = progressBar:GetPoint()
	AutoTrackerAchievementDB.progressBarREF = point
	AutoTrackerAchievementDB.progressBarX = xOfs
	AutoTrackerAchievementDB.progressBarY = yOfs
end)
-- Text
progressBar.text = progressBar:CreateFontString(nil, "OVERLAY", "GameFontNormal");
progressBar.text:SetFont("MORPHEUS", 8, "OUTLINE")
progressBar.text:SetPoint("CENTER");
progressBar.text:SetText("0/0");
-- Border
progressBar.border = CreateFrame("StatusBar", nil, progressBar)
progressBar.border:SetStatusBarTexture('Interface/AchievementFrame/UI-Achievement-ProgressBar-Border')
progressBar.border:SetWidth(282) -- Set these to whatever height/width is needed
progressBar.border:SetHeight(35) -- for your Texture
progressBar.border:SetPoint("TOPLEFT",-5,6)
-- Events
progressBar:RegisterEvent("VARIABLES_LOADED"); -- Addon status
progressBar:RegisterEvent("PLAYER_ENTERING_WORLD"); -- Travel
progressBar:RegisterEvent("ZONE_CHANGED_NEW_AREA"); -- Travel
--progressBar:RegisterEvent("ZONE_CHANGED"); -- Travel
progressBar:RegisterEvent("ACHIEVEMENT_EARNED"); -- Update
progressBar:RegisterEvent("QUEST_ACCEPTED");
--progressBar:RegisterEvent("LOOT_CLOSED");
progressBar:SetScript("OnEvent", eventHandler);
progressBar:Hide()

local stuffBar = CreateFrame("ScrollFrame", nil, progressBar) -- ObjectiveTrackerFrame
stuffBar:Hide()

function UpdateProgressBar(c, t)
	DebugPrint("Update ProgressBar : " .. c .. "/" .. t )
	if AutoTrackerAchievementDB['progressBar'] == true then
		progressBar:ClearAllPoints()
		progressBar:SetPoint(AutoTrackerAchievementDB.progressBarREF, AutoTrackerAchievementDB.progressBarX, AutoTrackerAchievementDB.progressBarY)
		local mapName = GetZoneText()
		if t == 0 then
			progressBar.text:SetText(mapName .. " : none")
			progressBar:Show()
		elseif c == t then
			progressBar.text:SetText(mapName .. " : complete")
			progressBar:SetMinMaxValues(0,1)
			progressBar:SetValue(1)
			progressBar:Show()
		else
			progressBar:SetMinMaxValues(0,t)
			progressBar:SetValue(c)
			progressBar.text:SetText(mapName .." : " .. c .. "/" .. t)
			progressBar:Show()
		end
	end
end

local guiPanel = CreateFrame("Frame")
guiPanel.name = "AutoTrackerAchievement"              -- see panel fields
guiPanel.title = guiPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
guiPanel.title:SetPoint("TOPLEFT", 10, -10)
guiPanel.title:SetText(guiPanel.name)
-- Title Category 1
guiPanel.category1 = guiPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
guiPanel.category1:SetPoint("TOPLEFT", 10, select(5,guiPanel.title:GetPoint()) - 30)
guiPanel.category1:SetText("Use Achievement detection in...")
-- Arena checkbox
guiPanel.arena = CreateFrame("CheckButton", "checkBoxArena", guiPanel, "ChatConfigCheckButtonTemplate");
guiPanel.arena:SetPoint("TOPLEFT", 10, select(5,guiPanel.category1:GetPoint()) - 30)
guiPanel.arena.title = guiPanel.arena:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
guiPanel.arena.title:SetPoint("TOPLEFT", 25, -5)
guiPanel.arena.title:SetText("Arena")
-- Raid checkbox
guiPanel.raid = CreateFrame("CheckButton", "checkBoxRaid", guiPanel, "ChatConfigCheckButtonTemplate");
guiPanel.raid:SetPoint("TOPLEFT", 10, select(5,guiPanel.arena:GetPoint()) - 30)
guiPanel.raid.title = guiPanel.raid:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
guiPanel.raid.title:SetPoint("TOPLEFT", 25, -5)
guiPanel.raid.title:SetText("Raids")
-- Zone checkbox
guiPanel.region = CreateFrame("CheckButton", "checkBoxRegion", guiPanel, "ChatConfigCheckButtonTemplate");
guiPanel.region:SetPoint("TOPLEFT", 10, select(5,guiPanel.raid:GetPoint()) - 30)
guiPanel.region.title = guiPanel.region:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
guiPanel.region.title:SetPoint("TOPLEFT", 25, -5)
guiPanel.region.title:SetText("Zones")
-- Dungeons & Scenarios checkbox
guiPanel.dungeon = CreateFrame("CheckButton", "checkBoxDungeon", guiPanel, "ChatConfigCheckButtonTemplate");
guiPanel.dungeon:SetPoint("TOPLEFT", 10, select(5,guiPanel.region:GetPoint()) - 30)
guiPanel.dungeon.title = guiPanel.dungeon:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
guiPanel.dungeon.title:SetPoint("TOPLEFT", 25, -5)
guiPanel.dungeon.title:SetText("Dungeons & Scenarios")

-- Title Category 1
guiPanel.category2 = guiPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
guiPanel.category2:SetPoint("TOPLEFT", 10, select(5,guiPanel.dungeon:GetPoint()) - 40)
guiPanel.category2:SetText("Options...")
-- Option ProgressBar
guiPanel.progressBar = CreateFrame("CheckButton", "checkBoxProgressBar", guiPanel, "ChatConfigCheckButtonTemplate");
guiPanel.progressBar:SetPoint("TOPLEFT", 10, select(5,guiPanel.category2:GetPoint()) - 30)
guiPanel.progressBar.title = guiPanel.progressBar:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
guiPanel.progressBar.title:SetPoint("TOPLEFT", 25, -5)
guiPanel.progressBar.title:SetText("Progress Bar")
-- Reset ProgressBar progressBarPosition
guiPanel.progressBarPositionReset = CreateFrame("Button", "progressBarResetPositionButton", guiPanel, "UIPanelButtonTemplate");
guiPanel.progressBarPositionReset:SetPoint("TOPLEFT", 200, select(5,guiPanel.progressBar:GetPoint()))
guiPanel.progressBarPositionReset:SetWidth(100)
guiPanel.progressBarPositionReset:SetScript("OnClick", function(self)
	AutoTrackerAchievementDB.progressBarREF = AutoTrackerAchievementDB_Defaut.progressBarREF
	AutoTrackerAchievementDB.progressBarX = AutoTrackerAchievementDB_Defaut.progressBarX
	AutoTrackerAchievementDB.progressBarY = AutoTrackerAchievementDB_Defaut.progressBarY
	progressBar:ClearAllPoints()
	progressBar:SetPoint(AutoTrackerAchievementDB_Defaut.progressBarREF,AutoTrackerAchievementDB_Defaut.progressBarX,AutoTrackerAchievementDB_Defaut.progressBarY)
end)
guiPanel.progressBarPositionReset:SetText("Reset Position")

InterfaceOptions_AddCategory(guiPanel)

function guiPanel.okay()
	AutoTrackerAchievementDB['arena'] = guiPanel.arena:GetChecked()
	AutoTrackerAchievementDB['raid'] = guiPanel.raid:GetChecked()
	AutoTrackerAchievementDB['region'] = guiPanel.region:GetChecked()
	AutoTrackerAchievementDB['dungeon'] = guiPanel.dungeon:GetChecked()
	AutoTrackerAchievementDB['progressBar'] = guiPanel.progressBar:GetChecked()
end

function guiPanel.refresh ()
	guiPanel.arena:SetChecked(AutoTrackerAchievementDB['arena'])
	guiPanel.raid:SetChecked(AutoTrackerAchievementDB['raid'])
	guiPanel.region:SetChecked(AutoTrackerAchievementDB['region'])
	guiPanel.dungeon:SetChecked(AutoTrackerAchievementDB['dungeon'])
	guiPanel.progressBar:SetChecked(AutoTrackerAchievementDB['progressBar'])
end

-- ////////////////
--      SLASH
-- ////////////////
function setContains(set, key)
    return set[key] ~= nil
end

function AtaCommand(msg)
	if msg == 'clean' then CleanTrackList()
	elseif msg == 'config' then InterfaceOptionsFrame_OpenToCategory(guiPanel);InterfaceOptionsFrame_OpenToCategory(guiPanel);
	elseif msg == 'debug' then
		if select(1, UnitName("player")) == "Garikover" then
			AutoTrackerAchievementDB["debug"] = (AutoTrackerAchievementDB["debug"] == false and true or false);
			print("Ata Debug mode : ",AutoTrackerAchievementDB["debug"]);
		end
	elseif msg == 'raid' then CheckBestRaid()
	elseif msg == 'reset' then AutoTrackerAchievementDB = AutoTrackerAchievementDB_Defaut;
	elseif msg == 'get' then AchievementListConstructor()
	elseif msg == 'set' then GetItemsList(GetSetsList())
	elseif string.find(msg, 'save ') == 1 then SaveTrackList(msg);
	elseif string.find(msg, 'load ') == 1 then LoadTrackList(msg);
	elseif string.find(msg, 'defaut ') == 1 then DefautTrackList(msg);
	elseif string.find(msg, 'category ') == 1 then
		subCat = string.gsub(msg, "category ", "");
		idTable = GetCategoryList()
		for key,value in ipairs(idTable) do
			title, parentCategoryID, flags = GetCategoryInfo(value)
			if parentCategoryID == tonumber(subCat) then print(value, title) end
		end
	else print(L["Commande non reconnue"]);
	end
end

SLASH_ATA1 = '/ata';
SlashCmdList["ATA"] = AtaCommand;

-- ////////////////
--   ACHIEVEMENTS
-- ////////////////

function AchievementListConstructor()

	local difficulty = select(3, GetInstanceInfo())
	local nbtracked = 0

	nbQuests = C_QuestLog.GetNumQuestWatches()
	CleanTrackList() -- on vire les HFs
	SaveTrackQuests() -- on vire les quêtes + sauvegarde
	ZoneName = GetMapName[C_Map.GetBestMapForUnit("player")];
	IdMap = C_Map.GetBestMapForUnit("player");

	-- DEBUG
	DebugPrint('-----------------------------------------')
	DebugPrint(string.format("Map = %s (%i)", C_Map.GetMapInfo(IdMap).name, IdMap))
	DebugPrint('Difficulté = ' .. difficulty)
	DebugPrint('Zone = \"'.. ZoneName .. '\"')

	ListeHF = GetAchievementListFromZone(ZoneName)

	if ListeHF ~= nil then
	    DebugPrint('Hfs = '.. #ListeHF)
		tracked, hidden, completed = DisplayAchievementsList(ListeHF)
		UpdateProgressBar(completed, #ListeHF)
	else
		UpdateProgressBar(0, 0)
	end

	-- Defaut si aucune quetes en suivi
	if AutoTrackerAchievementDB["defaut"] == true and AutoTrackerAchievementDB["defautliste"] ~= 0 and difficulty == 0 and C_QuestLog.GetNumQuestWatches() == 0 and tablelength(ListeHF) == 0 then
		if nbtracked == nil or nbtracked == 0 then LoadTrackList(AutoTrackerAchievementDB["defautliste"]) end
	end

	return ListeHF
end

function GetAchievementListFromZone(ZoneName)

    local difficulty = select(3, GetInstanceInfo())

    -- World (0) or Normal Dungeons (1)
    ListeHF = nil
    if GetFactionAchievementList[ZoneName] ~= nil then ListeHF = GetFactionAchievementList[ZoneName][UnitFactionGroup("player")] end

    ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName])

    if GetAchievementList[ZoneName] ~= nil then

        DebugPrint('Zone = référencée')

        -- Heroic (2) dungeons
        if difficulty == 2 then
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['NM'])
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['HM'])

            -- Raid (10 or 25, normal or heroic)
        elseif 	difficulty == 3 or difficulty == 4 or difficulty == 5 or difficulty == 6 then
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['NM'])
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['HM'])
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName][((difficulty == 3 or difficulty == 5) and '10' or '25')])

            -- Mythic dungeons/raid
        elseif difficulty == 16 or difficulty == 23 then
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['NM'])
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['HM'])
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['MM'])

            -- Raid (flex, normal or heroic)
        elseif difficulty == 14 or difficulty == 15 then
            ListeHF = concatArray(ListeHF, GetAchievementList[ZoneName]['NM'])
        end
    else
        DebugPrint('Zone = non référencée')
    end

    ListeHF = concatArray(ListeHF, GetAchievementListFromCategory(GetCategorie[IdZone]))

    return ListeHF
end

function GetAchievementListFromCategory(cat)
	if cat ~= nil then
		local list = {}
		for j = 1, GetCategoryNumAchievements(cat) do
			list[j] = select(1,GetAchievementInfo(cat,j))
		end
		return list
	else
		return nil
	end
end

function DisplayAchievementsList(list)
	local tracked = 0
	local hidden = 0
	local completed = 0
	for i=1,#list do
		if GetAchievementInfo(list[i]) ~= nil then
			DebugPrint(i .. ' - ' .. GetAchievementLink(list[i]) .. ' (' .. list[i] .. ')')
			if not select(4, GetAchievementInfo(list[i]))then
				if tracked < 10 then
					C_ContentTracking.StartTracking(2, list[i])
					tracked = tracked +1
				else
					hidden = hidden +1
				end
			else
				completed = completed + 1
			end
		end
	end
	return tracked, hidden, completed
end

function CheckBestRaid()
	PrintMessage(AtaColor.Yellow .. "Check best raid to Farm")

	local diff = {'10','25','NM','HM','MM'}
	local list = {}
	local i = 1
	for mapName, tableHF in pairs(GetAchievementList) do
		for keyDiff, difficulty in pairs(diff) do
			if tableHF[difficulty] ~= nil then
				nb = 0
				for key2,achievementID in pairs(tableHF[difficulty]) do
					if select(4, GetAchievementInfo(achievementID)) == false then nb = nb + 1 end
				end
				if nb > 0 then
					list[i] = {mapName, nb, difficulty}
					i = i +1
				end
			end
		end
	end

	table.sort(list, function (left, right)
		return left[2] > right[2]
	end)

	for key, value in pairs(list) do
		PrintMessage(AtaColor.Red .. value[2] .. '|r ' .. AtaColor.Yellow .. value[1] .. '|r ' .. '[' .. value[3] .. ']')
	end

end

-- ////////////////
--    ARMOR SETS
-- ////////////////

function tableHasKey(table,key)
    return table[key] ~= nil
end

function GetSetsList()
    local sets = {}
    local new_sets = {}
    for _, set in ipairs(C_TransmogSets.GetAllSets()) do
        if set.classMask == select(3, UnitClass("Player")) and set.collected == false then
            sets[set.setID] = {["name"] = set.name, ["setID"] = set.setID,["collected"] = 0, ["notCollected"] = 0,}
            for i=0, 19 do
                local isCollected = nil
                for _, source in ipairs(C_TransmogSets.GetSourcesForSlot(set.setID, i)) do
                    if isCollected == nil then isCollected = false end
                    if source.isCollected == true then isCollected = true; break end
                end
                if isCollected ~= nil then
                    if isCollected == true then sets[set.setID]['collected'] = sets[set.setID]['collected'] + 1 else sets[set.setID]['notCollected'] = sets[set.setID]['notCollected'] + 1 end
                end
            end
        end
    end
    for setID, slot in pairs(sets) do
        if slot.notCollected > 0 then
            table.insert(new_sets, {["name"] = slot.name, ["setID"] = slot.setID, ["collected"] = slot.collected, ["notCollected"] = slot.notCollected, ["left"] = (slot.collected * 100 / (slot.collected + slot.notCollected)) })
        end
    end
    table.sort(new_sets, function (k1, k2) return k1.left > k2.left end )
    return new_sets
end

function GetItemsList(sets)

    stuffBar:Show()
	for i = 1, #stuffBar do stuffBar[i]:Hide() end

	local ind = 0
    local listStuff = {}
    local listInstance = {}

	for _, set in pairs(sets) do
        for j, source in ipairs(C_TransmogSets.GetAllSourceIDs(set.setID)) do
            local categoryID, visualID, canEnchant, icon, isCollected, itemLink, transmogLink, itemType, itemSubTypeIndex = C_TransmogCollection.GetAppearanceSourceInfo(source)

            -- itemType => 1 normal, 3 pvp, nil legendary
            if isCollected == false and itemType == 1 then

                local drops = C_TransmogCollection.GetAppearanceSourceDrops(source)
                local itemDifficulty = tonumber(string.match(itemLink, 'item:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:([^:]*):'))

                if drops ~= nil then
                    for k=1, #drops do
                        local drop = drops[k]

                        if #drop.difficulties == 0 then
                            if itemDifficulty == nil then drop.difficulties[1] = "Normal" else drop.difficulties[1] = itemDifficulty end
                        end

                        for l=1,#drop.difficulties do
                            local difficulty = drop.difficulties[l]
                            local instance = drop.instance
                            local boss = drop.encounter

                            if IsInstanceLocked(i1) == false and SameMap(instance) == true then
                                if listStuff[difficulty] == nil then listStuff[difficulty] = {} end
                                if listStuff[difficulty][boss] == nil then listStuff[difficulty][boss] = {["q"] = 0, ["name"] = set.name} end
                                listStuff[difficulty][boss]["q"] = listStuff[difficulty][boss]["q"] + 1
                            end

                            if listInstance[instance] == nil then listInstance[instance] = {} end
                            if listInstance[instance][difficulty] == nil then listInstance[instance][difficulty] = {["q"] = 0, ["name"] = set.name} end
                            listInstance[instance][difficulty]["q"] = listInstance[instance][difficulty]["q"] + 1
                        end
                    end
                end
            end
        end
	end

    if GetTableLng(listStuff) == 0 then

        for i1, v1 in pairs(listInstance) do


            if IsInstanceLocked(i1) == true then

                --stuffBar[ind] = progressBar:CreateFontString(nil, "OVERLAY", "GameFontRed");

            elseif IsInstanceLocked(i1) == false then
                ind = ind + 1
                stuffBar[ind] = progressBar:CreateFontString(nil, "OVERLAY", "GameFontNormal");
                stuffBar[ind]:SetFont("MORPHEUS", 8, "OUTLINE")
                stuffBar[ind]:SetPoint("TOPLEFT", 0, -15*ind-5);
                stuffBar[ind]:SetText(i1);

                text = ""
                for i2, v2 in pairs(v1) do
                    text = text .. i2 .. " (" .. v2.q .. ") "
                end

                ind = ind + 1
                stuffBar[ind] = progressBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                stuffBar[ind]:SetFont("MORPHEUS", 8, "OUTLINE")
                stuffBar[ind]:SetPoint("TOPLEFT", 0, -15*ind-5);
                stuffBar[ind]:SetText(" - " .. text);

            end


        end

    else

        for i1, v1 in pairs(listStuff) do
            ind = ind + 1
            stuffBar[ind] = progressBar:CreateFontString(nil, "OVERLAY", "GameFontNormal");
            stuffBar[ind]:SetFont("MORPHEUS", 8, "OUTLINE")
            stuffBar[ind]:SetPoint("TOPLEFT", 0, -15*ind-5);
            stuffBar[ind]:SetText(i1);
            text = ""
            for i2, v2 in pairs(v1) do
                ind = ind + 1
                stuffBar[ind] = progressBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
                stuffBar[ind]:SetFont("MORPHEUS", 8, "OUTLINE")
                stuffBar[ind]:SetPoint("TOPLEFT", 0, -15*ind-5);
                stuffBar[ind]:SetText(" - " .. i2 .. " (" .. v2.q .. ")");
            end
        end

    end


    --offset = offset + stuffBar[ind]:GetStringWidth()
    --GameFontRed

end

function SameMap(s)
    local instance = string.gsub(string.gsub(s, "’", ""), "", "")
    local zoneName = string.gsub(string.gsub(GetZoneText(), "’", ""), "'", "")
    if string.find(instance, zoneName) ~= nil or string.find(zoneName, instance) ~= nil then
        return true
    else
        return false
    end
end

function IsInstanceLocked(s)
    for i=1, GetNumSavedInstances() do
        local name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(i)

        if s == name and locked == true then
            return true
        end
    end

    return false
end

function GetTableLng(tbl)
  local getN = 0
  for n in pairs(tbl) do
    getN = getN + 1
  end
  return getN
end

-- ////////////////
--    FUNCTIONS
-- ////////////////

-- Tracking des achievements
function CleanTrackList()
    local achievlisted = C_ContentTracking.GetTrackedIDs(2)
    for i=1,#achievlisted do
        C_ContentTracking.StopTracking(2, achievlisted[i])
    end
	DebugPrint("Nettoyage liste")
end
function SaveTrackList(msg)
	local achievlisted = C_ContentTracking.GetTrackedIDs(2)
	name = string.gsub(msg, "save ", "");

	if AutoTrackerAchievementDB["debug"] == true and name ~= "" then
		print("Sauvegarde : " .. name);
		AutoTrackerAchievementDB["Favoris"][name] = achievlisted;
	elseif name ~= "" then
		print(L["Liste sauvegardee"]);
		AutoTrackerAchievementDB["Favoris"][name] = achievlisted;
	else
		print(L["Nom de sauvegarde invalide"]);
	end
end
function LoadTrackList(msg)
	DebugPrint("Chargement de la liste")
	name = string.gsub(msg, "load ", "");
	if AutoTrackerAchievementDB["Favoris"][name] ~= nil then
		Liste = AutoTrackerAchievementDB["Favoris"][name];
		DisplayAchievementsList(Liste);
	end
end
function DeleteTrackList(msg)
	name = string.gsub(msg, "delete ", "")
	AutoTrackerAchievementDB["Favoris"][name] = 0
	tableau = AutoTrackerAchievementDB["Favoris"]
	NewTab = {}
end
function DefautTrackList(msg)
	DebugPrint("Chargement de la liste par défaut")
	name = string.gsub(msg, "defaut ", "");
	if AutoTrackerAchievementDB["Favoris"][name] ~= nil then
		AutoTrackerAchievementDB["defautliste"] = name
		DebugPrint("Defaut " .. name)
	else
		print(L["Pas de liste de ce nom"]);
	end
end

-- Tracking des quetes
function SaveTrackQuests()
	DebugPrint("Save quests watched !")
	listequetes = {}
	if C_QuestLog.GetNumQuestWatches() > 0 then
		for i = 1,C_QuestLog.GetNumQuestWatches() do
			questID = C_QuestLog.GetQuestIDForQuestWatchIndex(1)
			table.insert(listequetes, questID)
			local wasRemoved = C_QuestLog.RemoveQuestWatch(questID)
			DebugPrint("Save " .. GetQuestLink(questID))

		end
	end
end
function LoadTrackQuests()
	DebugPrint("Load quests watched !")
	if listequetes ~= nil then
		for i=#listequetes, 1, -1 do
			C_QuestLog.AddQuestWatch(listequetes[i])
			DebugPrint("Load " .. GetQuestLink(listequetes[i]))
		end
	end
	listequetes = {}
end

function PrintMessage(s)
	print(AtaColor.Green.."ATA : |r " .. s);
end
function tablelength(T)
	local count = 0
	if T ~= nil then
		for _ in pairs(T) do count = count + 1 end
	end
	return count
end
function DebugPrint(s)
	if AutoTrackerAchievementDB["debug"] == true then print(s); end
end
function concatArray(t1, t2)
	if t1 ~= nil and t2 ~= nil then
		for i = 1, #t1 do table.insert(t2, t1[i]) end
	elseif t1 ~= nil then
		t2 = t1
	end
	return t2
end

-- ////////////////
-- Langue
-- ////////////////

function AtaLocalisation(lang)
L = {};
	debut_ligne = "|cFFFF0000> "
	if lang == "frFR" then
		L["Pas de liste de ce nom"] = "Pas de liste de ce nom";
		L["Creation de la sauvegarde"] = "Creation de la sauvegarde";
		L["Nom de sauvegarde invalide"] = "Nom de sauvegarde invalide";
		L["Liste sauvegardee"] = "Liste sauvegardee";
		L["Zone sans Haut-faits"] = "Zone sans Haut-faits";
		L["Commande non reconnue"] = "Commande non reconnue";
		L["Zone clean"] = "Felicitation, il n'y a plus de HF à faire dans cette zone.";
		-- Config
		L["ata config"] = debut_ligne .. "|cFF00FF00/ata config |r affiche l'interface des otpions";
		L["ata check"] = debut_ligne .. "|cFF00FF00/ata check |r affiche le nombre de HF à faire restant dans chaque raid";
		L["ata clean"] = debut_ligne .. "|cFF00FF00/ata clean |r vide le suivi des HF";
		L["ata save"] = debut_ligne .. "|cFF00FF00/ata save <nom> |r enregistre la liste des HF en suivi sous le nom choisi";
		L["ata load"] = debut_ligne .. "|cFF00FF00/ata load <nom> |r affiche les HF enregistres dans la liste <nom>";
		L["ata defaut"] = debut_ligne .. "|cFF00FF00/ata defaut <nom> |r affiche les HF enregistres dans la liste <nom> s'il n'y a rien d'autre à afficher";
		L["ata mount"] = debut_ligne .. "|cFF00FF00/ata mount <nom> |r affiche les raids sans ID pour le farm des montures";
		-- Raids
		L["ata raid lk"] = debut_ligne .. "|cFF00FF00/ata {onyxia/archavon/malygos/sartha/naxx/ulduar/coliseum/icc}{10/25}";
		L["ata raid cata"] = debut_ligne .. "|cFF00FF00/ata {bwd,bot,tfw,firelands,ds}";
		L["ata raid pandaria"] = debut_ligne .. "|cFF00FF00/ata {mv,hof,tes,tot,soo}";
		-- UI
		--Text1:SetText("Arene")
		--Text2:SetText("Raids")
		--Text3:SetText("Regions")
		--Text4:SetText("Donjons et Scenarios")
		--Text5:SetText("sinon")
	else -- lang == "enEN"
		L["Pas de liste de ce nom"] = "No tracklist with this name";
		L["Creation de la sauvegarde"] = "Generating variables";
		L["Mise a jour"] = "Updating options";
		L["Nom de sauvegarde invalide"] = "Save name error";
		L["Liste sauvegardee"] = "Tracklist recording";
		L["Zone sans Haut-faits"] = "Area without achievement";
		L["Commande non reconnue"] = "Unknwown command";
		L["Zone clean"] = "Congratulation, there is more to achievements in this area.";
		-- Config
		L["ata config"] = debut_ligne .. "|cFF00FF00/ata config |r show settings";
		L["ata check"] = debut_ligne .. "|cFF00FF00/ata check |r show quantity of achievement not completed in each raid";
		L["ata clean"] = debut_ligne .. "|cFF00FF00/ata clean |r clean track list";
		L["ata save"] = debut_ligne .. "|cFF00FF00/ata save <name> |r save achievement track list as <name>";
		L["ata load"] = debut_ligne .. "|cFF00FF00/ata load <nom> |r show the track list <name>";
		L["ata defaut"] = debut_ligne .. "|cFF00FF00/ata defaut <nom> |r show the track list <name> only if there is no achievement in this area";
		L["ata mount"] = debut_ligne .. "|cFF00FF00/ata mount <nom> |r show unlocked raid or dungeon to farm mounts";
		-- Raids
		L["ata raid lk"] = debut_ligne .. "|cFF00FF00/ata {onyxia/archavon/malygos/sartha/naxx/ulduar/coliseum/icc}{10/25}";
		L["ata raid cata"] = debut_ligne .. "|cFF00FF00/ata {bwd,bot,tfw,firelands,ds}";
		L["ata raid pandaria"] = debut_ligne .. "|cFF00FF00/ata {mv,hof,tes,tot,soo}";
		-- UI
		--Text1:SetText("Arena")
		--Text2:SetText("Raids")
		--Text3:SetText("Zones")
		--Text4:SetText("Dungeons and Scenarios")
		--Text5:SetText("else")
	end

end
