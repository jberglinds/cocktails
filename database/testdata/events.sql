-- purpose: Defines some test-data for the events table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-13

use albinre;

-- insert some event data
insert into events
    (name, description, passphrase, start_date)
values
    ("Gamlingpub", "Massa gamlingar kommer på pub", "bättreförr", "2017-03-01 17:17:17"),
    ("Tentapub: Gladiator", "WOOHOO hoppas iZettlen funkar den här gången", "tärningenärkastad", "2017-03-18 19:00:00"),
    ("Torsdagspub: hipstertrams", "Räkna med att pingisbordet är framme", "#pub", "2017-03-30 19:00:00"),
    ("Mottagningstack", "Pontus har rakat sig", "dominera", "2017-10-21 18:00:00");
