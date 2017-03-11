-- purpose: Defines some test-data for the drinks table
-- author:  Albin Remnestål (albinre@kth.se)
-- date:    2017-03-11

use albinre;

-- insert some drink data
insert into drinks
    (name, description, image_url, howto_json, spirits_json, mixers_json)
values
    ("Lolly", "The absolute classic. The drink of the CS chapter.", "http://placeholder.pics/svg/500/FF9100-FF0093/FFFFFF-000000/Lolly",
    -- how-to
    "[
        'Do this, mate',
        'Then, that, bro'
    ]",
    -- spirits
    "[
        {
            base_spirit_id: 1,
            amount: '2 cl'
        },
        {
            base_spirit_id: 2,
            amount: '2 cl'
        },
        {
            base_spirit_id: 3,
            amount: '2 cl'
        },
        {
            base_spirit_id: 5,
            amount: '2 cl'
        },
        {
            base_spirit_id: 16,
            amount: '2 cl'
        }
    ]",
    -- mixers
    "[
        {
            mixer_id: 79,
            amount: '2 cl'
        },
        {
            mixer_id: 75,
            amount: '2 cl'
        },
        {
            mixer_id: 1
        }
    ]");

-- insert some drink data
insert into drinks
    (name, description, image_url, howto_json, spirits_json, mixers_json)
values
    ("GT", "Klassisk drink som uppfanns av gamers spelandes Gran Turismo, därav namnet.", "http://placeholder.pics/svg/500/FF9100-FF0093/FFFFFF-000000/GT",
    -- how-to
    "[
        'Häll upp din gin',
        'Släng ett öga på tonic-flaskan',
        'Redo att serveras'
    ]",
    -- spirits
    "[
        {
            base_spirit_id: 1,
            amount: '6 cl'
        }
    ]",
    -- mixers
    "[
        {
            mixer_id: 66,
            amount: 'En skiva'
        },
        {
            mixer_id: 67,
            amount: 'En fjärdedel (pressad)'
        },
        {
            mixer_id: 23
        }
    ]");
