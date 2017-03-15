#!/bin/bash

set -x

# Re-create database tables
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "tables.sql"

# Add base spirits
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/base_spirits.sql"

# Add spirits
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/spirits.sql"

# Add mixers
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/mixers.sql"

# Add drinks
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/drinks.sql"

# Add events
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/events.sql"

# Add inventory spirits
mysql --host=mysql-vt2016.csc.kth.se "albinre" < "testdata/inventory_spirits.sql"
