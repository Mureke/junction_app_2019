#Junction backend

###How to run:
1. Install docker (instructions in the interwebs)
    2. `docker pull mdillon/postgis`
    3. `docker run --name possu-postgres -p 9876:5432 -e POSTGRES_PASSWORD=pass -d mdillon/postgis`

2. `psql -U postgres -p 9876 -h 0.0.0`
    2. Create user named "junction_man" with password "pass"
        `CREATE USER junction_man` and `ALTER USER junction_man WITH password 'pass'`
    1. Create database named "junction"
        `CREATE DATABASE junction WITH OWNER junction_man`
    3. Set "junction_man" as "junction" database owner
    4. `Alter role junction_man SUPERUSER`

3. `sudo apt-get install binutils libproj-dev gdal-bin` 
3. Go to project root and run `python manage.py migrate`
4. Run `python manage.py runserver`