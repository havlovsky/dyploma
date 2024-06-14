import os
import django
from colorama import Fore
from mysql.connector import connect
from mysql.connector.errors import Error, ProgrammingError

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings.settings')
django.setup()


def database_creations():
    bd_creation_connect = connect(host='127.0.0.1',
                                  port='3306',
                                  user='root',
                                  passwd='1111')

    bd_creation_cursor = bd_creation_connect.cursor(buffered=True)

    with open('database/Creating_a_database.sql', encoding='UTF-8') as file:
        creating_database_file_info = file.read()

    with open('database/Deleting_a_database.sql', encoding='UTF-8') as file:
        deleting_database_file_info = file.read()

    try:
        bd_creation_cursor.execute(creating_database_file_info)
    except Error:
        print(Fore.RED + f"Database already exists!\n" + Fore.YELLOW)

        bd_creation_cursor.execute(deleting_database_file_info)
        print(Fore.GREEN + "Database successfully deleted!\n" + Fore.YELLOW)
        bd_creation_cursor.execute(creating_database_file_info)
        print(Fore.GREEN + "Database Vintage_Moto_Hub_Database has been created!\n" + Fore.YELLOW)
    else:
        print(Fore.GREEN + "Database Vintage_Moto_Hub_Database has been created!\n" + Fore.YELLOW)


def database_migrations():
    files_list = os.listdir('application/migrations')

    for file in files_list:
        if file != '__init__.py' and file != '__pycache__':
            os.remove(f'application/migrations/{file}')
            print(Fore.CYAN + f'File {file} has been removed!' + Fore.YELLOW)
    print()

    os.system('python manage.py makemigrations')
    print(Fore.GREEN + f"\nMigration file created!\n" + Fore.BLUE)

    os.system('python manage.py migrate')
    print(Fore.GREEN + f"\nMigration successfully applied!\n")


def superuser_creations():
    from application.models import CustomUser
    from django.db.utils import IntegrityError, ProgrammingError

    superuser_info = {'username': 'admin',
                      'password': '1111',
                      'email': 'admin@gmail.ua',
                      'first_name': 'Артем',
                      'last_name': 'Адміністратор',
                      'image': 'images/user_images/admin.jpg'}

    try:
        CustomUser.objects.create_user(username=superuser_info.get('username'),
                                       password=superuser_info.get('password'),
                                       image=superuser_info.get('image'),
                                       email=superuser_info.get('email'),
                                       first_name=superuser_info.get('first_name'),
                                       last_name=superuser_info.get('last_name'),
                                       is_active=True,
                                       is_staff=True,
                                       is_superuser=True)

    except IntegrityError:
        print(Fore.RED + f"Username `{superuser_info.get('username')}` already exist!\n")
    except ProgrammingError:
        print(Fore.RED + f"Problem with database! Maybe it doesn't exist.\n")
    else:
        print(Fore.GREEN + f"Superuser profile `{superuser_info.get('username')}` has been created!\n")


def insert_information_info_db():
    db_already_exist_connect = connect(host='127.0.0.1',
                                       port='3306',
                                       user='root',
                                       passwd='1111',
                                       database='Vintage_Moto_Hub_Database')

    db_already_exist_cursor = db_already_exist_connect.cursor(buffered=True)

    with open('database/Inserting_data.sql', encoding='UTF-8') as file:
        file_data = file.read()

        queries = file_data.split("\n\n")
        for query in queries:
            table_name = ''
            for letter in query[38::]:
                if letter != ' ':
                    table_name += letter
                else:
                    break
            try:
                db_already_exist_cursor.execute(query)
                db_already_exist_connect.commit()
            except ProgrammingError:
                print(Fore.RED + "Inserting error!")
            else:
                print(Fore.MAGENTA + f"Successfully inserted data into `{table_name}` table!")


def creating_test_user():
    from application.models import CustomUser, FavoriteMotorcycles
    from django.db.utils import IntegrityError, ProgrammingError

    user_info = {'username': 'Artem',
                 'password': '1111',
                 'email': 'Artem@gmail.ua',
                 'first_name': 'Артем',
                 'last_name': 'Гавловський',
                 'image': 'images/user_images/Artem.jpg'}

    try:
        CustomUser.objects.create_user(username=user_info.get('username'),
                                       password=user_info.get('password'),
                                       image=user_info.get('image'),
                                       email=user_info.get('email'),
                                       first_name=user_info.get('first_name'),
                                       last_name=user_info.get('last_name'),
                                       is_active=True,
                                       is_staff=False,
                                       is_superuser=False)

    except IntegrityError:
        print(Fore.RED + f"\nUsername `{user_info.get('username')}` already exist!\n")
    except ProgrammingError:
        print(Fore.RED + f"\nProblem with database! Maybe it doesn't exist.\n")
    else:
        print(Fore.GREEN + f"\nUser profile `{user_info.get('username')}` has been created!\n")

    motorcycles_id_list = [1, 2, 4, 5]

    for motorcycle_id in motorcycles_id_list:
        favorite_motorcycles = FavoriteMotorcycles(user_id=2,
                                                   motorcycle_id=motorcycle_id)
        favorite_motorcycles.save()


if __name__ == '__main__':
    database_creations()
    database_migrations()
    superuser_creations()
    insert_information_info_db()
    creating_test_user()
