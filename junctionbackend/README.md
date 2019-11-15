#Junction backend

###How to run:
1. Install docker (instructions in the interwebs)
    2. `docker pull postgres`
    3. `docker run --name possu-postgres -p 9876:5432 -e POSTGRES_PASSWORD=pass -d postgres`

2. `psql -U postgres -p 9876 -h 0.0.0`
    1. Create database named "junction"
    2. Create user named "junction_man" with password "pass"
    3. Set "junction_man" as "junction" database owner

3. Go to project root and run `python manage.py migrate`
4. Run `python manage.py runserver`