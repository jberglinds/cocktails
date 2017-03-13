-- purpose: Defines some test-data for the mixers table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-11

use albinre;

-- insert some data for soda mixers
insert into mixers
    (name, description)
values
    ("Coca Cola",                               "Obs! Ej coke"),
    ("Coca Cola Zero",                          ""),
    ("Coca Cola Light",                         ""),
    ("Coca Cola Vanilla",                       ""),
    ("Dr.Pepper",                               "Albins labbdryck of choice"),
    ("Dr.Pepper Zero",                          ""),
    ("Dr.Pepper Cherry",                        ""),
    ("Fanta Orange",                            ""),
    ("Fanta Exotic",                            "Ser ofta Aron med en sån här"),
    ("Fanta Wildberries",                       ""),
    ("Fanta Strawberry & Kiwi",                 ""),
    ("Fanta Lemon",                             ""),
    ("Fanta Shokata",                           "Varför är den ens blå?"),
    ("Fentimans Curiosity Cola",                "Jonathans favorit"),
    ("Fentimans Traditional Ginger Beer",       ""),
    ("Fentimans Rose Lemonade",                 ""),
    ("Fentimans Sparkling Lime & Jasmine",      ""),
    ("Fentimans Wild English Elderflower",      ""),
    ("Fentimans Mandarin & Seville Jigger",     ""),
    ("Fentimans Victorian Lemonade",            ""),
    ("Fentimans Cherry Cola",                   ""),
    ("Fentimans Lemon Shandy",                  ""),
    ("Fentimans Tonic Water",                   ""),
    ("Nygårda Apelsin",                         ""),
    ("Nygårda Apelsin Light",                   ""),
    ("Nygårda Blåbärssoda",                     ""),
    ("Nygårda Cola",                            ""),
    ("Nygårda Cola Light",                      ""),
    ("Nygårda Fruktsoda",                       ""),
    ("Nygårda Hallonsoda",                      ""),
    ("Nygårda Päronsoda",                       ""),
    ("Nygårda Smultronsoda",                    ""),
    ("Nygårda Sockerdricka",                    ""),
    ("7up",                                     ""),
    ("7up Cherry",                              ""),
    ("Pepsi Cola",                              ""),
    ("Pepsi Max",                               ""),
    ("Orangina",                                ""),
    ("Orangina Red Orange",                     ""),
    ("Sprite",                                  ""),
    ("Zingo",                                   ""),
    ("Mountain Dew",                            ""),
    ("A&W Root Beer",                           ""),
    ("Jolt Cola",                               "r.i.p."),
    ("Tonic",                                   "");

-- insert some data for juices
insert into mixers
    (name, description)
values
    ("Apelsinjuice", ""),
    ("Äppeljuice", ""),
    ("Ananasjuice", ""),
    ("Passionsfruktsjuice", ""),
    ("Mangojuice", ""),
    ("Guanabanajuice", ""),
    ("Citronsaft", ""),
    ("Limesaft", ""),
    ("Blåbärssoppa", ""),
    ("Nyponsoppa", "");

-- insert some data for energy drinks
insert into mixers
    (name, description)
values
    ("Red Bull Energy Drink",           "Ger dig vingar"),
    ("Monster Energy Drink",            "Obs! Passar till jäger"),
    ("Rockstar Zero Carb Energy Drink", "0 kalorier, du får ingen energi");

-- insert some data for fruit
insert into mixers
    (name, description)
values
    ("Apelsin", ""),
    ("Blodapelsin", ""),
    ("Äpple", ""),
    ("Päron", ""),
    ("Banan", ""),
    ("Mango", ""),
    ("Kiwi", ""),
    ("Vindruvor", ""),
    ("Kokos", ""),
    ("Persika", ""),
    ("Paraguayo", ""),
    ("Plommon", ""),
    ("Cantaloupe", ""),
    ("Guanabana", ""),
    ("Citron", ""),
    ("Lime", ""),
    ("Ananas", ""),
    ("Passionsfrukt", ""),
    ("Jordgubb", ""),
    ("Hallon", ""),
    ("Blåbär", ""),
    ("Björnbär", ""),
    ("Körsbär", "");

-- insert some data for cordials
insert into mixers
    (name, description)
    values
    ("Rose's Lime", ""),
    ("Rose's Lemon", ""),
    ("Rose's Apricot", ""),
    ("Rose's Blue Curacao", ""),
    ("Rose's Grenadine", ""),
    ("Rose's Elderflower", ""),
    ("Rose's Strawberry", "");

-- insert some data for uncategorized ingredients
insert into mixers
    (name, description)
values
    ("Isbitar", ""),
    ("Krossad is", ""),
    ("Mjölk", ""),
    ("Kokosmjölk", ""),
    ("Salt", ""),
    ("Geléhjärtan", ""),
    ("Geléhallon", ""),
    ("Sockerlag", "");
