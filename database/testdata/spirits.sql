-- purpose: Defines some test-data for the spirits table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-07

use albinre;

-- insert some data for gin
set @base_spirit_id = 1;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Beefeater London Dry Gin",            40.0, "Kryddig smak med inslag av enbär, korianderfrö och citron. Används som drinkingrediens.", @base_spirit_id),
    ("Beefeater 24",                        45.0, "", @base_spirit_id),
    ("AB Svenska Sprit Gin",                40.0, "Kryddig smak med inslag av enbär, kummin, citrusskal och angelicarot.", @base_spirit_id),
    ("Bombay Sapphire London Dry Gin",      40.0, "Nyanserad, kryddig smak med inslag av citrusskal, enbär, angelicarot, korianderfrön och kanel. Används som drinkingrediens.", @base_spirit_id),
    ("Djurgårdens Gin",                     40.0, "Kryddig smak med inslag av pomerans, enbär, kummin, fänkål och örter. Används som drinkingrediens.", @base_spirit_id),
    ("Gibson's London Dry Gin",             37.5, "Kryddig smak med inslag av citron, enbär, koriander och örter. Används som drinkingrediens.", @base_spirit_id),
    ("Gordon's London Dry Gin",             37.5, "Örtig smak med tydlig karaktär av enbär, inslag av koriander och citrus. Används som drinkingrediens.", @base_spirit_id),
    ("Greenall's Berkeley Square",          40.0, "Nyanserad, kryddig smak med inslag av koriander, basilika, citrusskal och limeblad. Serveras som drinkingrediens.", @base_spirit_id),
    ("Göteborg Gin",                        45.0, "Kryddig smak med inslag av citrusskal, enbär, päron och koriander. Serveras som drinkingrediens.", @base_spirit_id),
    ("Hendrick's Gin",                      41.4, "Komplex, harmonisk smak med inslag av enbär, rosor, koriander och apelsinskal. Används som drinkingrediens.", @base_spirit_id),
    ("Le Gin de Christian Drouin",          42.0, "Kryddig, något blommig smak med inslag av enbär, kardemumma, ingefära, citrusskal, anis och färska örter. Används som drinkingrediens.", @base_spirit_id),
    ("Monkey 47",                           47.0, "Kryddig, komplex smak med inslag av enbär, kanel, koriander, citrusskal, sandelträ och peppar. Serveras som drinkingrediens.", @base_spirit_id),
    ("Star Dry Gin",                        37.5, "Kryddig smak med inslag av enbär, citrusskal, örter och korianderfrö. Används som drinkingrediens.", @base_spirit_id),
    ("Tanqueray London Dry Gin",            43.1, "Kryddig smak med karaktär av enbär, inslag av koriander, citronskal och örter. Används som drinkingrediens.", @base_spirit_id);

-- insert some data for vodka
set @base_spirit_id = 2;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Absolut Vodka",               40.0, "Ren smak med inslag av ljust bröd och citrus. Serveras kyld som snaps eller amvänds som drinkingrediens.", @base_spirit_id),
    ("Genuin Vodka",                37.5, "Ren smak med ton av citrus och örter. Serveras kyld som snaps eller används som drinkingrediens.", @base_spirit_id),
    ("Purity Vodka",                40.0, "Ren smak med ton av citrusskal och örter. Serveras kyld som snaps eller används som drinkingrediens.", @base_spirit_id),
    ("Vanlig Vodka",                37.5, "Ren smak med inslag av vete och citrusskal. Serveras kyld som snaps eller används som drinkingrediens.", @base_spirit_id),
    ("Sture Vodka",                 37.5, "Ren smak med ton av citrus.", @base_spirit_id),
    ("Virtuous Vodka Vanilla",      38.0, "Plenty of Bourbon Vanilla with a sweet tonality and clear tannic acidity gives this vodka its amber appearance. The fragrance from the highest-quality vanilla bean is unmistakable as is the vanilla bean we left behind in the bottle.", @base_spirit_id),
    ("Virtuous Vodka Chili",        38.0, "The Vodka is well-balanced between fruit and the heat and the fragrance from tomatoe and paprika can be deceitful before the heat hits you. The heat from the chili transforms in your mouth to splendid aromatic taste.", @base_spirit_id),
    ("Virtuous Vodka Raspberry",    38.0, "Deep red vodka with a striking taste from perfectly ripe raspberries. A certain acidity and sweetness from the raspberries balances the vodka.", @base_spirit_id),
    ("Koskenkorva Vodka",           37.5, "", @base_spirit_id),
    ("Explorer Vodka",              37.5, "Ren smak med inslag av vete och apelsinskal. Serveras kyld som snaps eller används som drinkingrediens.", @base_spirit_id);

-- insert some data for vodka
set @base_spirit_id = 3;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Sierra Tequila Silver",       38.0, "Robust smak med inslag av gräs och citrusskal. Används som drinkingrediens.", @base_spirit_id),
    ("El Paseillo Charro",          40.0, "Nyanserad, kryddig smak med tydlig fatkaraktär, inslag av halm, vanilj, pomerans, örter och vanilj. Serveras rumstempererad som digestif.", @base_spirit_id),
    ("Los Tres Toños",              38.0, "Balanserad, nyanserad smak med fatkaraktär, inslag av gula päron, pomerans, lakrits, halm och vanilj. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Sauza Blanco",                38, "Fruktig smak med inslag av päron, jäst och halm.", @base_spirit_id),
    ("José Cuervo Especial",        38.0, "Kryddig smak med fatkaraktär, inslag av farinsocker, halm och apelsinskal. Serveras som snaps.", @base_spirit_id),
    ("Feria de Jalisco Reposado",   38.0, "Kryddig, nyanserad smak med fatkaraktär, inslag av agave, nötter, torkad frukt, halm och vanilj. Serveras rumstempererad som digestif.", @base_spirit_id);

-- insert some data for whisky
set @base_spirit_id = 4;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Jack Daniel's",           40.0, "Smakrik, kryddig whiskey med karaktär av kolade ekfat, inslag av torkade aprikoser, nötter, smörkola, apelsin och vanilj. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Jameson",                 40.0, "Fruktig smak med inslag av fat, apelsinmarmelad, vanilj, gula päron och honung. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Jameson Black Barrel",    40.0, "Nyanserad, kryddig smak med tydlig rostad fatkaraktär, inslag av smörkola, torkad frukt, pekannötter, choklad, vanilj och kaffe. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Teeling Rum Cask",        46.0, "Fruktig, kryddig smak med fatkaraktär, inslag av gula päron, vanilj, aprikos, arrak och apelsinskal. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Tullamore Dew",           40.0, "Fruktig smak med inslag av fat, viol, päron, pomerans och vanilj. Serveras vid rumstemperatur som avec, elller används som drinkingrediens, t.ex. till Irish Coffee.", @base_spirit_id),
    ("Bulleit Bourbon",         45.0, "Nyanserad smak med tydlig karaktär av kolade ekfat, inslag av smörkola, pomerans, nötter och vaniljfudge. Serveras som avec.", @base_spirit_id),
    ("Jim Beam Bourbon",        40.0, "Smakrik whiskey med tydlig karaktär av kolade ekfat, inslag av apelsin, mörk choklad, torkad frukt, vanilj och pekannötter. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Maker's Mark",            45.0, "Smakrik, fruktig whiskey med tydlig karaktär av kolade ekfat, inslag av vanilj, torkad frukt, knäck och pomerans. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id);

-- insert some data for white rum
set @base_spirit_id = 5;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Bacardi Carta Blanca",            37.5, "Robust smak med inslag av arrak och örter. Används som drinkingrediens.", @base_spirit_id),
    ("Barracuda Rum Silver",            38.0, "Fruktig smak med inslag av arrak, gräs och citrus. Används som drinkingrediens.", @base_spirit_id),
    ("Cachaça 51",                      40.0, "Kryddig smak med inslag av lime, arrak, kanel och muscovadosocker. Serveras som drinkingrediens.", @base_spirit_id),
    ("Havana Club Añejo 3 años",        40.0, "Kryddig smak med inslag av torkad ananas, halm, vanilj, päron och arrak. Används som drinkingrediens.", @base_spirit_id),
    ("Havana Club Añejo Blanco",        37.5, "Fruktig smak med inslag av päron, arrak, vanilj och gräs. Används som drinkingrediens.", @base_spirit_id),
    ("No1 Rum Super Premium",           37.5, "Kryddig smak med inslag av arrak, gräddkola, choklad och vanilj.", @base_spirit_id),
    ("Noble Selected Caribbean Rum",    37.5, "Kryddig smak med inslag av ananas, vanilj, kokos, arrak, örter, kaffe och kakao. Används som drinkingrediens.", @base_spirit_id);

-- insert some data for dark rum
set @base_spirit_id = 6;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Angostura 1919",                              40.0, "Balanserad, kryddig smak med tydlig fatkaraktär och liten sötma, inslag av mango, marsipan, kanel, vanilj och arrak. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Appleton Estate Rare Blend 12 Years",         43.0, "Nyanserad, kryddig smak med fatkaraktär, inslag av torkad ananas, choklad, sultanarussin, arrak, vanilj, apelsin och choklad. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Captain Morgan Jamaica Rum",                  40.0, "Kryddig smak med inslag av valnötter, torkad frukt, kakao och arrak. Används som drinkingrediens eller serveras som avec.", @base_spirit_id),
    ("Diplomático Reserva",                         40.0, "Nyanserad, kryddig smak med fatkaraktär och liten sötma, inslag av apelsin, choklad, arrak, knäck, vanilj och nötter. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Diplomático Reserva Exclusiva",               40.0, "Nyanserad, kryddig smak med sötma och tydlig fatkaraktär, inslag av apelsin, russin, nötter, vaniljfudge och kanel. Serveras som avec.", @base_spirit_id),
    ("Doorly's 6 Years",                            40.0, "Kryddig, nyanserad smak med fatkaraktär, inslag av torkad frukt, marsipan, pomerans, apelsin, vaniljfudge och arrak. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Doorly's XO Fine Old Barbados Rum",           40.0, "Nyanserad smak med tydlig fatkaraktär, inslag av torkade dadlar, marsipan, russin, nötter, arrak och apelsinskal. Serveras rumstempererad som avec.", @base_spirit_id),
    ("El Dorado 15 Years",                          43.0, "Nyanserad, kryddig smak med fatkaraktär och sötma, inslag av farinsocker, torkad frukt, pomerans, arrak, kakao och vanilj. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Havana Club Añejo 7 años",                    40.0, "Kryddig doft med fatkaraktär, inslag av sultanarussin, farinsocker, arrak, vanilj, kanel och marsipan. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("J Bally 7 ans Pyramide",                      45.0, "Nyanserad, kryddig smak med tydlig fatkaraktär, inslag av torkad frukt, apelsin, farinsocker, örter, arrak, kanel och mörk choklad. Serveras som avec.", @base_spirit_id),
    ("Matusalem Solera 7 Blender",                  40.0, "Balanserad smak med fatkaraktär, inslag av arrak, muscovadosocker, marsipan, apelsin, choklad och vanilj. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Negrita Dark",                                37.5, "Kryddig smak med inslag av apelsinskal, arrak och vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Plantation 20th Anniversary XO Barbados",     40.0, "Komplex, kryddig smak med tydlig fatkaraktär och sötma, inslag av apelsinskal, mandelmassa, arrak, kokos och vanilj. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Plantation Grande Reserve Barbados",          40.0, "Nyanserad, kryddig smak med fatkaraktär och sötma, inslag av apelsin, örter, mandelmassa, vanilj och arrak. Serveras som avec.", @base_spirit_id),
    ("Ron Barceló Gran Añejo",                      37.5, "Kryddig smak med fatkaraktär, inslag av pomerans, farinsocker, torkad frukt, nötter och kanel. Serveras rumstempererad som avec.", @base_spirit_id),
    ("Ron Quorhum Solera XO QRM",                   42.0, "Nyanserad, kryddig smak med sötma och tydlig fatkaraktär, inslag av hasselnötter, choklad, apelsin, kaffe, arrak och vanilj. Serveras som avec.", @base_spirit_id),
    ("Ron Zacapa Gran Reserva",                     40.0, "Smakrik, nyanserad rom med fatkaraktär och liten sötma, inslag av torkad frukt, lönnsirap, nötter och örter. Serveras rumstempererad som avec.", @base_spirit_id),
    ("The Brand New Republique Gran Añejo 3 años",  40.0, "Fruktig smak med inslag av fat, apelsin, aprikos, vanilj, farinsocker, arrak och örter. Serveras rumstempererad som avec eller används som drinkingrediens.", @base_spirit_id);

-- insert some data for liqueur
set @base_spirit_id = 7;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Advocaat",                                    15.0, "Gräddig, mycket söt och simmig smak inslag av äggula och vanilj. Serveras kyld som avec, eller med krossad is.", @base_spirit_id),
    ("Amarula Cream",                               17.0, "Gräddig, mycket söt smak med tydlig karaktär av smörkola, inslag av vanilj och tropisk frukt. Serveras med krossad is eller kyld som avec.", @base_spirit_id),
    ("Arancello",                                   25.0, "Mycket söt och fruktig, ren smak med tydlig karaktär av apelsin, inslag av apelsinskal. Serveras väl kyld, eller används som drinkingrediens.", @base_spirit_id),
    ("Baileys Coffee",                              17.0, "Gräddig, mycket söt smak med tydlig karaktär av kaffe, inslag av mjölkchoklad och smörkola. Serveras väl kyld som avec eller med is.", @base_spirit_id),
    ("Baileys Original Irish Cream",                17.0, "Gräddig, mycket söt smak med inslag av gräddkola, vanilj, mjölk choklad och aprikos. Ton av whiskey. Serveras kyld som avec, eller med is.", @base_spirit_id),
    ("Baja Päron Tequila & Pear Cream",             15.0, "Fruktig, mycket söt, gräddig smak med inslag av päron och vanilj. Serveras kyld som avec eller används som drinkingrediens.", @base_spirit_id),
    ("Bols Blue Curacao",                           21.0, "Fruktig, mycket söt, simmig smak med inslag av apelsin och citrusskal. Används som drinkingrediens.", @base_spirit_id),
    ("Bols Crème de Banana",                        17.0, "Mycket söt, simmig smak med påtaglig karaktär av banan, inslag av vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Cafetino Coffee Liqueur",                     17.0, "Kryddig, mycket söt smak med tydlig karaktär av espressokaffe, inslag av vanilj, nötter och mjölkchoklad. Serveras kyld som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Chambord Black Raspberry",                    16.5, "Bärig, mycket söt smak  med tydlig karaktär av hallon, inslag av skogsbär. Används som drinkingrediens.", @base_spirit_id),
    ("Cointreau",                                   40.0, "Söt smak med påtaglig karaktär av apelsin och citrusskal. Serveras kyld som avec, eller som drinkingrediens.", @base_spirit_id),
    ("Country Lane",                                17.0, "Gräddig, mycket söt smak med inslag av gräddkola och vanilj. Serveras med krossad is eller kyld som avec.", @base_spirit_id),
    ("Crème de Cassis de Bourgogne",                15.0, "Bärig, mycket söt, simmig smak med påtaglig karaktär av svarta vinbär, inslag av gräs. Används som drinkingrediens, exempelvis Kir Royal.", @base_spirit_id),
    ("De Kuyper Apricot Brandy",                    24.0, "Fruktig, söt, något syrlig smak med tydlig karaktär av aprikos, inslag av mandel. Används som drinkingrediens.", @base_spirit_id),
    ("Disaronno Originale",                         28.0, "Simmig, mycket söt smak med tydlig karaktär av mandel, inslag av nötter och örter. Serveras kyld till desserter av frukt eller glass, som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Dooley's",                                    17.0, "Gräddig, mycket söt smak med tydlig karaktär av smörkola, inslag av mjölkchoklad och vanilj. Serveras med is som avec.", @base_spirit_id),
    ("Dragon Blood",                                50.0, "Kryddig smak med inslag av granatäpple, hallon, peppar och kanel. Serveras kyld.", @base_spirit_id),
    ("Drambuie",                                    40.0, "Kryddig, mycket söt, simmig smak med inslag av ljunghonung, aprikoser, kandisocker och örter. Ton av whisky. Serveras kyld som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Fireball Cinnamon & Whisky Liqueur",          33.0, "Mycket söt, kryddig smak med hetta och tydlig karaktär av kanel, inslag av ingefära och apelsin. Serveras med krossad is.", @base_spirit_id),
    ("Fishshot",                                    30.0, "Söt, bitter smak med inslag av mentol, eukalyptus och lakrits. Serveras rumstempererad eller kyld som digestif.", @base_spirit_id),
    ("Frangelico",                                  20.0, "Söt smak med tydlig karaktär av hasselnötter, inslag av vanilj. Serveras kyld som avec.", @base_spirit_id),
    ("Ga-Jol Orginal Granatäpple",                  30.0, "Söt, simmig smak med tydlig karaktär av lakrits, inslag av granatäpple. Serveras kyld som snaps.", @base_spirit_id),
    ("Galliano Vanilla",                            30.0, "Kryddig, mycket söt, simmig smak med tydlig karaktär av vanilj, inslag av smörkola och anis. Används som drinkingrediens.", @base_spirit_id),
    ("Grand Marnier Rouge",                         40.0, "Nyanserad, kryddig, söt smak med inslag av apelsin, örter, farinsocker och vanilj. Ton av cognac. Serveras kyld som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Hot n'Sweet Tyrkisk Peber",                   32.0, "Kryddig, söt smak med liten hetta och tydlig karaktär av salmiak och turkisk pepparkaramell. Serveras kyld.", @base_spirit_id),
    ("Hpnotiq",                                     17.0, "Fruktig, söt, mycket syrlig smak med inslag av passionsfrukt, ananas och grapefrukt. Används som drinkingrediens, eller serveras med krossad is.", @base_spirit_id),
    ("Jack Daniel's Tennessee Honey",               35.0, "Mycket söt, kryddig smak med inslag av honung, kanel, sultanarussin, nötter och apelsinmarmelad. Serveras kyld som avec.", @base_spirit_id),
    ("Jägermeister",                                35.0, "Kryddig, något bitter, söt smak med inslag av lakritsrot, torkade örter, kanel, ingefära och pomerans. Serveras med krossad is.", @base_spirit_id),
    ("Kahlúa",                                      20.0, "Mycket söt, simmig smak med tydlig karaktär av kaffe, inslag av smörkola, lakrits och vanilj. Serveras kyld som avec, eller som drinkingrediens.", @base_spirit_id),
    ("Kirsch Likör",                                17.0, "Bärig, söt smak med tydlig karaktär av körsbär, inslag av mandel. Serveras kyld till desserter av frukt eller glass, som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Lapponia Hjortron",                           21.0, "Aningen simmig, mycket söt smak med påtaglig karaktär av mogna hjortron. Serveras kyld till desserter av frukt eller glass, som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Lejonet & Björnen Glasslikör Rocky Road",     15.0, "Gräddig, mycket söt smak med inslag av choklad, smörkola, nötter och vanilj. Serveras kyld, eller med is, som avec.", @base_spirit_id),
    ("Lejonet & Björnen Glasslikör Texas Fudge",    15.0, "Gräddig, mycket söt smak med inslag av nougat, kola, jordnötter och vanilj. Serveras kyld som avec, eller med is.", @base_spirit_id),
    ("Licor 43",                                    31.0, "Aningen kryddig, mycket söt, simmig smak med tydlig karaktär av vanilj, inslag av tropisk frukt. Serveras kyld, eller används som drinkingrediens.", @base_spirit_id),
    ("Limoncello di Capri",                         30.0, "Söt, fruktig smak med tydlig karaktär av citron, inslag av citrusskal och örter. Serveras väl kyld, eller används som drinkingrediens.", @base_spirit_id),
    ("Malibu",                                      21.0, "Söt smak med påtaglig karaktär av kokos, inslag av nötter och vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Merrys White Chocolate Irish Cream Liqueur",  17.0, "Simmig, mycket söt smak med tydlig karaktär av vit choklad, inslag av vanilj. Serveras kyld som avec.", @base_spirit_id),
    ("Midori",                                      20.0, "Söt smak med tydlig karaktär av melon, inslag av banan och vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Minttu Black Mint",                           35.0, "Kryddig, söt, simmig smak med tydlig karaktär av salmiak, inslag av pepparmynta. Används som drinkingrediens.", @base_spirit_id),
    ("Minttu Choco Mint",                           35.0, "Mycket söt smak med tydlig karaktär av mintkola och choklad. Serveras kyld.", @base_spirit_id),
    ("Minttu Peppermint",                           35.0, "Simmig, mycket söt smak med tydlig karaktär av pepparmynta. Serveras kyld eller används som drinkingrediens.", @base_spirit_id),
    ("Minttu Pear",                                 35.0, "Kryddig, mycket söt smak med tydlig karaktär av pepparmynta, inslag av päron. Serveras kyld.", @base_spirit_id),
    ("Molinari Sambuca Extra",                      40.0, "Simmig, mycket söt, kryddig smak med tydlig karaktär av stjärnanis, inslag av svartpeppar. Serveras kyld, eller som drinkingrediens.", @base_spirit_id),
    ("Passoã Passion Drink",                        17.0, "Söt, fruktig smak med inslag av passionsfrukt och blodgrapefrukt. Serveras kyld som drinkingrediens.", @base_spirit_id),
    ("Peachtree",                                   20.0, "Söt, fruktig smak med tydlig karaktär av persika. Används som drinkingrediens.", @base_spirit_id),
    ("Pisang Ambon",                                20.0, "Mycket söt, simmig smak med tydlig karaktär av banan, inslag av skumgodis och örter. Används som drinkingrediens.", @base_spirit_id),
    ("Prinz Rum Coconut",                           40.0, "Kryddig, söt smak med inslag av kokos, smörkola, arrak och vaniljfudge. Serveras kyld som avec.", @base_spirit_id),
    ("Rhuby Rhubarb Liqueur",                       20.0, "Fruktig, söt smak med tydlig karaktär av rabarber, inslag av citrus och vanilj. Serveras kyld.", @base_spirit_id),
    ("Sheridan's Original Double Liqueur",          15.5, "Mycket söt, simmig smak med tydlig karaktär av kaffe, gräddkola och choklad. Serveras kyld som avec.", @base_spirit_id),
    ("Shot 4.4 Hallon Lakrits",                     25.0, "Mycket söt smak med tydlig karaktär av lakrits och hallon. Serveras kyld, eller används som drinkingrediens.", @base_spirit_id),
    ("Sourz Apple",                                 15.0, "Fruktig, söt, mycket syrlig smak med tydlig karaktär av gröna äpplen. Används som drinkingrediens.", @base_spirit_id),
    ("Sourz Raspberry",                             15.0, "Söt, syrlig smak med tydlig karaktär av hallon, inslag av citron och vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Sourz Red Berry",                             15.0, "Bärig, söt, mycket syrlig smak med inslag av körsbär, mandel och citrus. Används som drinkingrediens.", @base_spirit_id),
    ("Southern Comfort",                            35.0, "Kryddig, fruktig, söt smak med inslag av apelsin, aprikos, ljust farinsocker och vanilj. Ton av whiskey. Serveras kyld som avec, eller som drinkingrediens.", @base_spirit_id),
    ("St Germain",                                  20.0, "Mycket söt, blommig smak med tydlig karaktär av fläder, inslag av citron, ananas, nektarin och örter. Används som drinkingrediens.", @base_spirit_id),
    ("Strega",                                      40.0, "Mycket söt, simmig smak med tydlig karaktär av örter, inslag av citrusskal, kryddor och vanilj. Serveras kyld, eller som drinkingrediens.", @base_spirit_id),
    ("Tegnér & Son Cream Liqueur",                  17.0, "Mycket söt och simmig smak med inslag av gräddkola, choklad, kex och vanilj. Serveras kyld som avec, eller med is.", @base_spirit_id),
    ("Tequila Rose Strawberry Cream",               15.0, "Bärig, gräddig, mycket söt smak med tydlig karaktär av jordgubbar och vanilj. Serveras kyld eller med krossad is.", @base_spirit_id),
    ("Tia Maria",                                   20.0, "Simmig, mycket söt smak med karaktär av kaffe, inslag av kakao, nötter och vanilj. Serveras kyld som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Valhalla",                                    35.0, "Kryddig, söt, något bitter smak med inslag av lakrits, anis, mynta, vanilj och honung. Serveras med krossad is.", @base_spirit_id),
    ("Vedrenne Liqueur de Curacao Verte",           25.0, "Fruktig, mycket söt smak med tydlig karaktär av apelsin, inslag av örter. Används som drinkingrediens.", @base_spirit_id),
    ("Xanté Poire au Cognac",                       38.0, "Fruktig, söt smak med tydlig karaktär av päron. Ton av cognac. Serveras kyld som avec eller används som drinkingrediens.", @base_spirit_id);

-- insert some data for brandy
set @base_spirit_id = 8;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Bardinet Napoleon French Brandy VSOP", 36.0, "Druvig smak med fatkaraktär, inslag av torkad frukt, nötter, halm och farinsocker. Serveras vid rumstemperatur som avec eller används som drinkingrediens.", @base_spirit_id),
    ("Eau-de-Vie **", 38.0, "Druvig smak med inslag av röda äpplen, farinsocker, apelsinskal och vanilj. Används som drinkingrediens.", @base_spirit_id),
    ("Soberano Gran Reserva 12", 38.0, "Kryddig, nyanserad smak med tydlig fatkaraktär, inslag av torkad frukt, choklad, hasselnötter, farinsocker och apelsin. Serveras rumstempererad som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("St-Rémy Authentic VSOP", 36.0, "Örtig smak med inslag av fat, vanilj och choklad. Serveras som avec, eller används som drinkingrediens.", @base_spirit_id),
    ("Tegnér & Son VSOP Family Reserve", 38.0, "Nyanserad, druvig smak med fatkaraktär, inslag av päron, torkad frukt, örter, vanilj och apelsin. Serveras rumstempererad som avec.", @base_spirit_id);

-- insert some data for bitters
set @base_spirit_id = 9;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Angostura Orange Bitters", 28.0, "Kryddig, bitter smak med inslag av apelsinskal och malört. Används som smaksättare eller drinkingrediens.", @base_spirit_id);

-- -- insert some data for red wine
-- set @base_spirit_id = 10;
-- insert into spirits
--     (name, abv, description, type_of_liqour)
-- values
--     ("", , "", @base_spirit_id),
--     ("", , "", @base_spirit_id);
--
-- -- insert some data for white wine
-- set @base_spirit_id = 11;
-- insert into spirits
--     (name, abv, description, type_of_liqour)
-- values
--     ("", , "", @base_spirit_id),
--     ("", , "", @base_spirit_id);

-- -- insert some data for fortified wine
-- set @base_spirit_id = 12;
-- insert into spirits
--     (name, abv, description, type_of_liqour)
-- values
--     ("", , "", @base_spirit_id),
--     ("", , "", @base_spirit_id);

-- -- insert some data for champagne
-- set @base_spirit_id = 13;
-- insert into spirits
--     (name, abv, description, type_of_liqour)
-- values
--     ("", , "", @base_spirit_id),
--     ("", , "", @base_spirit_id);

-- insert some data for cider
set @base_spirit_id = 14;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Boulard Cidre de Normandie Brut",             4.5, "Torr, ren, fruktig smak med tydlig äppelkaraktär. Serveras sval som sällskapsdryck eller till crêpes.", @base_spirit_id),
    ("Briska Ananas",                               4.5, "Mycket fruktig, söt smak med tydlig karaktär av ananas, inslag av apelsin. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Briska Blåbär& Hallon",                       4.5, "Mycket söt, bärig smak med inslag av blåbär, hallon och vanilj. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Briska Fläder",                               4.5, "Söt, blommig, fruktig smak med tydlig karaktär av fläder, inslag av gröna äpplen och citrus. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Briska Äppelcider med smak av Mango",         4.5, "Fruktig, mycket söt smak med tydlig karaktär av mango, inslag av röda äpplen och ananas. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Briska Päron",                                4.5, "Söt, fruktig smak med inslag av päron och vanilj.", @base_spirit_id),
    ("Bulmers Original Cider",                      4.5, "Fruktig smak med sötma och tydlig karaktär av äpplen, inslag av örter och honung. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk eller kyckling.", @base_spirit_id),
    ("Cidraie Cidre Blond",                         4.0, "Halvtorr, medelfyllig, fruktig, balanserad smak med viss längd och inslag av moget äpple. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Cidre Kerné Fruity",                          4.0, "Mycket fruktig smak med tydlig karaktär av röda äpplen, inslag av kanel och apelsinskal. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk eller kyckling.", @base_spirit_id),
    ("Crowmoor Pear Semi Dry",                      4.5, "Fruktig smak med tydlig karaktär av gula päron, inslag av honung och kryddor. Serveras vid 8-10°C som sällskapsdryck eller till rätter av kyckling eller fläskkött och vitmögelostar.", @base_spirit_id),
    ("Gaymer's Olde English Cyder",                 6.0, "Halvtorr, fruktig smak med tydlig karaktär av äpplen, inslag av citrus, nötter och halm. Serveras vid 8-10°C till rätter av ljust kött eller som sällskapsdryck.", @base_spirit_id),
    ("Gravendal Hallon Lime",                       4.5, "Bärig, söt smak med inslag av hallon och lime. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Hannas Cider Rosé",                           6.0, "Halvtorr, fruktig smak med inslag av rosor, päron, mango och kryddor.", @base_spirit_id),
    ("Hannas Peach Melba",                          4.5, "Söt, fruktig smak med inslag av persika, päron och vanilj.", @base_spirit_id),
    ("Herrljunga Cider Strawberry Vanilla",         4.5, "Söt smak med inslag av jordgubbe, vanilj och gelégodis. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Kiviks Äppelcider rosé med smak av jordgubb", 4.5, "Bärig smak med sötma, inslag av jordgubbar, hallon, äpple och vanilj. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Kiviks Skånsk Äppelcider",                    7.0, "Fruktig smak med inslag av gula äpplen, citrus, kanel och vanilj. Serveras vid 8-10°C som sällskapsdryck eller till rätter av kyckling eller fläskkött.", @base_spirit_id),
    ("Kopparberg Cider Naked Apple",                4.5, "Torr, fruktig smak med viss sötma, inslag av röda äpplen, citrus och vanilj. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Kopparberg Cider Svensk Guld Päron",          7.0, "Söt smak med tydligt inslag av pärongodis. Serveras vid 6-8°C som sällskapsdryck.", @base_spirit_id),
    ("Kopparberg Cider Svensk Guld Äpple",          7.0, "Söt smak med inslag av äpple, päron, tuttifrutti och skumbanan. Serveras vid 6-8°C som sällskapsdryck", @base_spirit_id),
    ("Lustgårdens Cider Torr Äpple",                4.5, "Fruktig smak med tydlig karaktär av röda äpplen, inslag av örter och honung. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk eller kyckling.", @base_spirit_id),
    ("Magners Irish Cider",                         4.5, "Halvtorr, fruktig smak med tydlig karaktär av röda äpplen, inslag av örter. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk eller kyckling.", @base_spirit_id),
    ("Premium Brand Klassiker Cider Peach",         7.0, "Lätt, halvtorr cider med smak av persika, litchifrukt och karambol. Lite kärv avslutning. Serveras vid 6-8°C som sällskapsdryck eller till lätt husmanskost.", @base_spirit_id),
    ("Rekorderlig Krusbär",                         4.5, "Söt smak med karaktär av krusbär. Serveras väl kyld som sällskapsdryck.", @base_spirit_id),
    ("Rekorderlig Päron",                           4.5, "Söt, fruktig, ren smak med tydligt inslag av päron och tuttifrutti. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Rekorderlig Skogsbär",                        4.5, "Söt, bärig smak med inslag av blåbär och geléhallon. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Rekorderlig Skogsbär Extra stark",            7.0, "Söt smak med ton av skogsbär och cassis. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Rekorderlig Strawberry-Lime",                 4.5, "Söt, fruktig smak med tydlig karaktär av färska jordgubbar. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Skepparp Flaskjäst Cider",                    6.0, "Fruktig smak med liten sötma och tydlig karaktär av äpplen, inslag av honung och citrus. Serveras vid 8-10°C som sällskapsdryck eller till rätter av fisk och ljust kött.", @base_spirit_id),
    ("Somersby Blackberry",                         4.5, "Söt, bärig smak med inslag av svarta vinbär, hallon och smultron. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Somersby Peach Cider",                        4.5, "Söt, fruktig smak med tydlig karaktär av persika, inslag av citrus. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Somersby Apple Cider Organic",                4.5, "Söt, fruktig smak med tydlig karaktär av röda äpplen, inslag av vanilj. Serveras vid 6-8°C som sällskapsdryck.", @base_spirit_id),
    ("Somersby Pear Cider",                         4.5, "Söt, fruktig smak med inslag av päron, melon och vanilj. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Somersby Sparkling Rosé",                     4.5, "Bärig smak med sötma, inslag av krusbär, röda vinbär och smultron. Serveras vid 8-10°C som sällskapsdryck.", @base_spirit_id),
    ("Strongbow",                                   5.0, "Torr, medelfyllig, lätt kolsyrad smak med frisk äppelton och viss sötma. Serveras vid 8-10°C till de flesta maträtter, med undantag för smakrika, mörka kötträtter. Passar särskilt bra till fläskkarre, skinkstek och t.ex. äppelfläsk. Serveras även som sällskapsdryck.", @base_spirit_id),
    ("Tr3 Apor Äppelcider",                         4.5, "Mycket fruktig, söt smak med tydlig karaktär av äpplen, inslag av honung och citrus. Serveras vid cirka 6°C som sällskapsdryck eller till desserter.", @base_spirit_id),
    ("Vikbo Cider Röd Rabarber",                    4.5, "Fruktig, söt smak med inslag av rabarber, smultron och vanilj. Serveras kyld som sällskapsdryck.", @base_spirit_id),
    ("Vikbo Cider Strawberry Blueberry",            4.5, "Mycket fruktig, söt smak med tydlig karaktär av jordgubbar, inslag av blåbär och vanilj. Serveras kyld som sällskapsdryck.", @base_spirit_id);

-- insert some data for beer
set @base_spirit_id = 15;
insert into spirits
    (name, abv, description, type_of_liqour)
values
    ("Arboga Mörk Lager",                           5.7, "Maltig, något rostad smak med inslag av mörk sirap, kavring, torkad frukt och pomerans. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk-, lamm- eller nötkött.", @base_spirit_id),
    ("Dugges Mörk Lager",                           5.8, "Maltig, något rostad smak med inslag av pumpernickel, mörk choklad, pomerans, honung och örter. Serveras vid 8-10°C till rätter av fläsk-, lamm- eller nötkött.", @base_spirit_id),
    ("Khartoum Stout",                              5.7, "Maltig, rostad smak med tydlig beska, inslag av kaffe, mörk choklad, kavring, tobak, svartpeppar och pomerans. Serveras vid cirka 10-12°C som sällskapsdryck, eller till rätter av mörkt kött.", @base_spirit_id),
    ("Krusovice Cerne",                             3.8, "Maltig, rostad smak med inslag av kaffe, rågbröd och mörk choklad. Serveras vid 10-12°C till smakrik husmanskost.", @base_spirit_id),
    ("Zeitgeist Black Lager",                       4.7, "Nyanserad, smakrik öl med rostad ton, inslag av kryddor,  pumpernickel, kaffe, soja och apelsinchoklad. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av lamm- eller nötkött.", @base_spirit_id),
    ("Störtebeker Schwarzbier",                     5.0, "Maltig, något rostad smak med inslag av kavring, torkad frukt, apelsinchoklad och kaffe. Serveras vid 8-10°C som sällskapsdryck, eller till rätter av fläsk-, lamm- eller nötkött.", @base_spirit_id),
    ("Staropramen Dark",                            4.4, "Maltig smak med inslag av knäck, surdegsbröd, choklad, kaffe och torkade aprikoser. Serveras vid 10-12°C till husmanskost.", @base_spirit_id),
    ("Ayinger Celebrator Doppelbock",               6.7, "Nyanserad, maltig smak med sötma, inslag av vörtbröd, torkad frukt, apelsin, farinsocker, nejlika och ingefära. Serveras vid 10-12°C till rätter av mörkt kött eller som sällskapsdryck.", @base_spirit_id),
    ("Leffe Brune",                                 6.5, "Nyanserad smak med viss sötma, inslag av torkad frukt, apelsinchoklad, sirapslimpa och farinsocker. Serveras vid 8-10°C som sällskapsdryck eller till rätter av lamm- och nötkött.", @base_spirit_id),
    ("Svart",                                       5.5, "Smakrik, maltig öl med påtaglig beska och rostad karaktär, inslag av kaffe, soja, pumpernickel, lakrits och mörk choklad. Serveras vid 10-12°C som sällskapsdryck, eller till rätter av vilt eller nötkött, eller till smakrika rätter med svamp.", @base_spirit_id),
    ("Plain Porter",                                5.0, "Nyanserad, maltig, något rostad smak med inslag av mörk choklad, tamarind, lakrits, kavring och pomerans. Serveras vid 14-16°C till mörkt kött.", @base_spirit_id),
    ("Wisby Stout",                                 5.0, "Maltig, nyanserad smak med inslag av torkad frukt, kavring, mörk sirap, kaffe, kakao och lakrits. Serveras vid 10-12°C till rätter av mörkt kött, eller till smakrika rätter med svamp.", @base_spirit_id),
    ("Yeti Imperial Stout",                         9.5, "Komplex, maltig smak med sötma, inslag av katrinplommon, soja, pumpernickel, mörk choklad, tamarind, tjära och kaffe. Serveras vid 10-12°C till rätter av mörkt kött, eller till chokladdesserter.", @base_spirit_id),
    ("St Peter's Cream Stout",                      6.5, "Komplex, rostad smak med liten sötma, inslag av kaffe, lakrits, tamarind, katrinplommon, mörk choklad och pumpernickel. Serveras vid 10°C som sällskapsdryck eller till smakrik husmanskost.", @base_spirit_id),
    ("Poppels Russian Imperial Stout",              9.5, "Maltig smak med sötma, inslag av pumpernickel, lakrits, russin, kaffe och mörk choklad. Serveras vid 12-14°C till rätter av mörkt kött.", @base_spirit_id),
    ("Guinness Extra Stout",                        5.0, "Smakrik, rostad öl med tydlig beska, inslag av kaffe, soja, pumpernickel, charkuterier, apelsinskal och lakrits. Serveras vid 14-16°C till smakrika rätter av mörkt kött eller till ostron.", @base_spirit_id),
    ("Guinness Draught",                            4.2, "Maltig, rostad smak inslag av charkuterier, lakrits, kaffe, mörkt bröd och pomerans. Innehåller gaspatron. Serveras väl kyld till smakrika rätter av mörkt kött.", @base_spirit_id),
    ("Sierra Nevada Porter",                        5.6, "Nyanserad, maltig smak med inslag av choklad, torkad frukt, pomerans, lönnsirap och mörkt bröd. Serveras vid 14-16°C till mörkt kött.", @base_spirit_id),
    ("Nya Carnegiebryggeriet Fridens Ale",          7.1, "Fruktig, humlearomatisk smak med tydlig beska, inslag av knäck, tallbarr, apelsin, ljus sirap, knäckebröd och aprikos. Serveras vid 8-10°C till smakrika rätter av mörkt kött, eller som sällskapsdryck.", @base_spirit_id),
    ("Clown Shoes Crunkle Sam",                     11.0, "Fruktig, nyanserad smak med sötma, inslag av aprikos, apelsinmarmelad, ljus sirap, rågbröd och honung. Serveras vid cirka 10°C som sällskapsdryck eller till rätter av mörkt kött.", @base_spirit_id),
    ("Nya Carnegiebryggeriet Hingstin Eko Stout",   5.9, "Nyanserad, rostad smak med inslag av katrinplommon, choklad, kaffe, pumpernickel, nötter och lakrits. Serveras vid 12-14°C till rätter av mörkt kött.", @base_spirit_id);
