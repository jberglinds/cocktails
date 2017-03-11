-- purpose: Defines some test-data for the mixers table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-11

use albinre;

-- insert some data for soda mixers
insert into mixers
    (name, description)
values
    ("Coca-cola",                       "Obs! Ej coke"),
    ("Coca-cola Zero",                  ""),
    ("Coca-cola Light",                 ""),
    ("Coca-cola Vanilla",               ""),
    ("Dr.Pepper",                       "Albins labbdryck of choice");
    ("Dr.Pepper Zero",                  "");
    ("Dr.Pepper Cherry",                "");
    ("Fanta Orange",                    ""),
    ("Fanta Exotic",                    "Ser ofta Aron med en sån här"),
    ("Fanta Wildberries",               ""),
    ("Fanta Strawberry & Kiwi",         ""),
    ("Fanta Lemon",                     ""),
    ("Fanta Shokata",                   "Varför är den ens blå?"),
    ("Fentimans Curiosity Cola",        "Jonathans favorit"),
    ("Fentimans CherryTree Cola",       ""),
    ("Fentimans Victorian Lemonade",    ""),
    ("Nygårda Apelsin",                 ""),
    ("Nygårda Apelsin Light",           ""),
    ("Nygårda Blåbärssoda",             ""),
    ("Nygårda Cola",                    ""),
    ("Nygårda Cola Light",              ""),
    ("Nygårda Fruktsoda",               ""),
    ("Nygårda Hallonsoda",              ""),
    ("Nygårda Päronsoda",               ""),
    ("Nygårda Smultronsoda",            ""),
    ("Nygårda Sockerdricka",            ""),
    ("7up",                             ""),
    ("7up Cherry",                      ""),
    ("Pepsi Cola",                      ""),
    ("Pepsi Max",                       ""),
    ("Orangina",                        ""),
    ("Orangina Red Orange",             ""),
    ("Sprite",                          ""),
    ("Mountain Dew",                    ""),
    ("A&W Root Beer",                   ""),
    ("Orange Crush",                    ""),
    ("Jolt Cola",                       "r.i.p."),
    ("Zingo",                           "");

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

-- insert some data for garnish
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
    ("Körsbär", ""),
    ("Sockerlag", ""),
    ("Salt", ""),
    ("Geléhjärtan", ""),
    ("Geléhallon", "");

-- insert some data for uncategorized ingredients
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
