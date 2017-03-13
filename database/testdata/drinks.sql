-- purpose: Defines some test-data for the drinks table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-13

use albinre;

-- insert some drink data
insert into drinks
    (name, description, image_url, howto_json, spirits_json, mixers_json)
values
    ("Lolly", "The absolute classic. The drink of the CS chapter.", "http://placeholder.pics/svg/500/FF9100-FF0093/FFFFFF-000000/Lolly",
    -- how-to
    "[\"Do this, mate\", \"Then, that, bro\"]",
    -- spirits
    "[{\"base_spirit\": {\"id\": 1,\"name\": \"Gin\"},\"amount\": \"2 cl\"}, {\"base_spirit\": {\"id\": 2,\"name\": \"Vodka\"},\"amount\": \"2 cl\"}, {\"base_spirit\": {\"id\": 3,\"name\": \"Tequila\"},\"amount\": \"2 cl\"}, {\"base_spirit\": {\"id\": 5,\"name\": \"White rum\"},\"amount\": \"2 cl\"}, {\"base_spirit\": {\"id\": 16,\"name\": \"Triple sec\"},\"amount\": \"2 cl\"}]",
    -- mixers
    "[{\"mixer\":{\"id\": 52, \"name\": \"Citronsaft\"}, \"amount\": \"2 cl\"}, {\"mixer\": {\"id\": 96, \"name\": \"Sockerlag\"}, \"amount\": \"2 cl\"}, {\"mixer\": {\"id\": 1, \"name\": \"Coca Cola\"}}]");

-- insert some drink data
insert into drinks
    (name, description, image_url, howto_json, spirits_json, mixers_json)
values
    ("GT", "Klassisk drink som uppfanns av gamers spelandes Gran Turismo, därav namnet.", "http://placeholder.pics/svg/500/FF9100-FF0093/FFFFFF-000000/GT",
    -- how-to
    "[\"Häll upp din gin\", \"Släng ett öga på tonic-flaskan\", \"Redo att serveras\"]",
    -- spirits
    "[{\"base_spirit\": {\"id\": 1, \"name\": \"Gin\"}, \"amount\": \"6 cl\"}]",
    -- mixers
    "[{\"mixer\":{\"id\": 73, \"name\": \"Citron\"}, \"amount\": \"En skiva\"}, {\"mixer\": {\"id\": 74, \"name\": \"Lime\"}, \"amount\": \"1/4 pressad\"}, {\"mixer\": {\"id\": 45, \"name\": \"Tonic\"}}]");
