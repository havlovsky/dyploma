insert into vintage_moto_hub_database.moto_hub_information (moto_hub_name, phone_number, email, facebook, instagram, linkedin, address, google_map, working_days_schedule, saturday_schedule, sunday_schedule) values
('VintageMotoHub', '+380930930933', 'artem.havlovskyy@gmail.com', 'https://www.facebook.com/profile.php?id=100007458990688', 'https://www.instagram.com/gas_theater?igsh=MWRpNGdqbDl1Y3hs', 'https://www.linkedin.com/', 'Львів, вул. Коновальця 23', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2568.8928366121268!2d23.738293499999997!3d49.9195862!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473b2188094b52e3%3A0xa52f615c5d27f0e8!2z0LLRg9C70LjRhtGPINCa0L7QvdC-0LLQsNC70YzRhtGPLCAyMywg0IbQstCw0L3Qvi3QpNGA0LDQvdC60L7QstC1LCDQm9GM0LLRltCy0YHRjNC60LAg0L7QsdC70LDRgdGC0YwsIDgxMDcx!5e0!3m2!1suk!2sua!4v1716293490064!5m2!1suk!2sua', 'понеділок-п’ятниця: вихідні', 'субота: 10.00-18.00', 'неділя: 10.00-17.00');

insert into vintage_moto_hub_database.motorcycle_brands (brand_name, brand_image, moto_hub_id) values
('BMW', 'images/motorcycle_brand_images/BMW.png', 1),
('Harley-Davidson', 'images/motorcycle_brand_images/Harley_Davidson.jpg', 1),
('Husqvarna', 'images/motorcycle_brand_images/Husqvarna.jpg', 1),
('Triumph', 'images/motorcycle_brand_images/Triumph.png', 1),
('BSA', 'images/motorcycle_brand_images/BSA.png', 1),
('Indian', 'images/motorcycle_brand_images/Indian.jpg', 1);

insert into vintage_moto_hub_database.motorcycles (motorcycle_brand_id, motorcycle_model, model_years_of_production, engine_capacity, engine_type, engine_hp, cooling_system_type, number_of_gears, fuel_tank_capacity, weight, motorcycle_image, motorcycle_description) values
(1, 'R 50S', '1960-1962', '494 см3', 'Чотиритактний, двоциліндровий горизонтально оппозитний', '35 к.с.', 'повітряне', 4, '10 л.', '198 кг.', 'images/motorcycle_images/R_50S.jpg', 'BMW R50 S - це класичний мотоцикл, що випускався німецькою компанією BMW у 1960-х роках. Він є частиною легендарної лінійки R-серії, відомої своїм надійним виконанням, високою якістю та відмінними характеристиками. 
Мотоцикл має високу колекційну цінність завдяки своїй рідкісності та історичному значенню. Це один з тих мотоциклів, які втілюють дух своєї епохи, представляючи технологічні досягнення та дизайн середини 20-го століття.'),
(1, 'R 75', '1941-1946', '745 см3', 'Двоциліндровий опозитний (боксерний)', '26 к.с.', 'повітряне', '4', '24 л.', '405 кг.', 'images/motorcycle_images/R_75.jpg', 'BMW R75 — це військовий мотоцикл, який вироблявся компанією BMW під час Другої світової війни. Він був відомий своєю надійністю, витривалістю і здатністю працювати у важких умовах. Цей мотоцикл став одним із символів німецьких збройних сил і використовувався в різних військових операціях.
BMW R75 був розроблений у відповідь на вимогу німецької армії створити надійний і універсальний мотоцикл з коляскою для військового використання. Виробництво розпочалося в 1941 році і тривало до 1946 року. R75 широко використовувався у Північній Африці, Східній Європі та інших театрах воєнних дій.'),
(1, 'R 90S', '1973-1976', '898 м3', 'Двоциліндровий боксерний', '67 к.с.', 'повітряне', '5', '24 л.', '210', 'images/motorcycle_images/R_90S.jpg', 'BMW R90S — це культовий мотоцикл, випущений компанією BMW у період з 1973 по 1976 рік. Він став символом спортивних мотоциклів того часу і досі залишається одним із найпопулярніших класичних мотоциклів серед колекціонерів та шанувальників бренду.
BMW R90S був створений, щоб конкурувати з потужними японськими мотоциклами, які почали домінувати на ринку в 1970-х роках. Він став однією з перших моделей BMW, яка активно брала участь у гонках, що значно підвищило репутацію бренду серед спортивних мотоциклів.
R90S — це не просто мотоцикл, а символ цілої епохи у світі мотоциклів. Його поєднання потужності, інноваційного дизайну та високих технічних характеристик зробило його іконою, яка залишається популярною і сьогодні. Цей мотоцикл досі цінується колекціонерами та шанувальниками класичних мотоциклів за його унікальний стиль і видатну історію.'),
(2, 'WLA Liberator', '1940-1952', '739.4 см3', 'V-подібний двоциліндровий чотиритактний', '25 к.с.', 'повітряне', '3', '12.87 л.', '261 кг.', 'images/motorcycle_images/WLA_Liberator.jpg', 'Harley-Davidson WLA, відомий також як "Liberator", є військовим мотоциклом, який вироблявся компанією Harley-Davidson під час Другої світової війни. Цей мотоцикл був спеціально розроблений для використання армією США та її союзниками. Однією з його ключових особливостей є двигун, який забезпечував надійність і достатню потужність для виконання військових завдань.
Harley-Davidson почала виробництво WLA у 1940 році у відповідь на запит армії США. Назва "WLA" розшифровується як "W" — серія двигунів, "L" — низька компресія (Low compression), і "A" — Армія (Army).
Harley-Davidson WLA Liberator став одним із символів американської військової техніки Другої світової війни. Завдяки своїй надійності, простоті обслуговування та багатофункціональності, він став важливим інструментом для армії. Його спадщина продовжує жити серед колекціонерів та мотоциклістів, які цінують історію та якість цих легендарних машин.'),
(2, 'Fat Boy', '1990-до тепер', '1340 см3', 'V-подібний двоциліндровий', '48 к.с.', 'повітряне', '5', '18.9 л.', '313 кг.', 'images/motorcycle_images/Fat_Boy.jpg', 'Harley-Davidson Fat Boy — один з найвідоміших мотоциклів у кінематографі, завдяки своїй появі у фільмі "Термінатор 2: Судний день" (1991). Мотоцикл, на якому їздив Термінатор у виконанні Арнольда Шварценеггера, став іконою і символом цієї кінокласики.
Harley-Davidson Fat Boy зіграв важливу роль у фільмі. У сцені втечі Джона Коннора від Т-1000, Термінатор використовує Fat Boy, щоб врятувати хлопчика. Епічна гонитва, що включала стрибок мотоцикла з мосту у дренажну канаву, стала однією з найбільш пам''ятних сцен у кіноісторії.
Harley-Davidson Fat Boy з "Термінатора 2" став не тільки важливою частиною кінематографічної спадщини, але й залишив свій слід у культурі мотоциклів. Його поява у фільмі допомогла закріпити репутацію Harley-Davidson як виробника потужних і стильних мотоциклів, здатних справити враження як на дорозі, так і на великому екрані.'),
(2, 'V-Rod', '2001-до тепер', '1131 см3', 'Revolution V-Twin', '115 к.с.', 'рідинне', '5', '15.7 л.', '305 кг.', 'images/motorcycle_images/V_Rod.jpg', 'Harley-Davidson V-Rod — це лінійка мотоциклів, яка була представлена компанією Harley-Davidson у 2001 році. Модель V-Rod відрізняється від традиційних мотоциклів Harley-Davidson своїм інноваційним дизайном та високопродуктивним двигуном, розробленим у співпраці з Porsche.
Harley-Davidson V-Rod став революційним мотоциклом у лінійці Harley-Davidson, завдяки своєму інноваційному підходу до дизайну та інженерії. Цей мотоцикл поєднує у собі найкращі риси спортивних і крейсерських мотоциклів, забезпечуючи унікальний досвід водіння і відмінні характеристики на дорозі.'),
(2, 'Knucklehead', '1936-1947', '1000 см3', 'V-подібний', '35 к.с.', 'повітряне', '4', '13 л.', '255 кг.', 'images/motorcycle_images/Knucklehead.jpg', 'Harley-Davidson Knucklehead - це легендарний мотоцикл, виробництво якого тривало з 1936 по 1947 рік. Він отримав свою назву завдяки характерним формам головок циліндрів, що нагадують кісточки пальців (knuckles).
Harley-Davidson Knucklehead став символом американського мотоциклетного промислу та культури середини XX століття. Він заклав основу для майбутніх моделей Harley-Davidson і залишається шанованим серед мотоциклістів та колекціонерів. Його дизайн та технічні нововведення продовжують впливати на мотоциклетний дизайн до сьогодні.'),
(2, 'XR 750', '1970-1985', '748 см3', 'V-подібний двоциліндровий', '82 к.с.', 'повітряне', '4', '9.5 л.', '134 кг.', 'images/motorcycle_images/XR_750.jpg', 'Harley-Davidson XR-750 — це легендарний гоночний мотоцикл, який вважається одним із найуспішніших у світі плоских трекових гонок. Створений у 1970 році, цей мотоцикл здобув величезну популярність завдяки своїм видатним характеристикам, надійності та успіхам у змаганнях.
Harley-Davidson XR-750 був розроблений як відповідь на нові правила Американської асоціації мотоциклістів (AMA), які обмежували об''єм двигуна для гоночних мотоциклів з верхнім розташуванням клапанів до 750 кубічних сантиметрів. Мотоцикл швидко став домінуючим на трекових гонках завдяки своїм передовим технічним рішенням та інноваціям.'),
(3, 'CR 400', '1970-1989', '396 см3', 'Одноциліндровий, двотактний', '40 к.с.', 'повітряне', '4', '13.5 л.', '105 кг.', 'images/motorcycle_images/CR_400.jpg', 'Husqvarna CR 400 — це культовий мотоцикл, який відіграв значну роль в історії мотокросу. Він став відомим у 1970-х роках і здобув популярність серед ентузіастів завдяки своїм високим характеристикам і успіхам у змаганнях.
Husqvarna CR 400 став відомим завдяки своєму виступу в численних змаганнях і перемогам у чемпіонатах світу з мотокросу. Мотоцикли цієї моделі використовували багато відомих гонщиків, включаючи таких легенд, як Малькольм Сміт та Білл Нілсон.
Мотоцикл є одним із найзнаменитіших в історії мотокросу. Він залишив значний слід завдяки своїм видатним характеристикам, успіхам у змаганнях і впливу на розвиток мотокросу як виду спорту. Навіть сьогодні, мотоцикли Husqvarna цієї серії залишаються популярними серед колекціонерів та шанувальників класичних мотоспортів.'),
(3, 'Silverpilen', '1955-1965', '175 см3', 'Одноциліндровий двотактний', '75 кг.', 'повітряне', '4', '9 л.', '75 кг.', 'images/motorcycle_images/Silverpilen.jpg', 'Husqvarna Silverpilen, що в перекладі означає "Срібна стріла", є однією з найвідоміших та культових моделей Husqvarna. Випускалася з 1955 по 1965 рік, ця модель стала справжньою іконою серед мотоциклів того часу завдяки своїм інноваційним технічним рішенням та естетичному дизайну.
Husqvarna Silverpilen стала символом 1950-х та 1960-х років, завоювавши серця багатьох мотоциклістів своєю надійністю, простотою у використанні та чудовою динамікою. Вона зіграла важливу роль у популяризації мотоциклів Husqvarna в усьому світі.
Husqvarna Silverpilen - це не просто мотоцикл, це частина історії мотоциклетної культури. Вона поєднала у собі інноваційні технічні рішення, легкість і надійність, завдяки чому стала іконою свого часу. Навіть сьогодні Silverpilen залишається бажаним експонатом для колекціонерів та шанувальників вінтажних мотоциклів.'),
(3, 'Model 30', '1929-1939', '500 см3', 'Одноциліндровий чотиритактний', '12 к.с.', 'повітряне', '1', '8 л.', '130 кг.', 'images/motorcycle_images/Model_30.jpg', 'Husqvarna Model 30 є однією з ранніх моделей мотоциклів, що випускалися компанією Husqvarna в 1930-х роках. Ця модель знаменита своєю інноваційністю та надійністю, що зробило її популярною серед мотоциклістів того часу.
Husqvarna Model 30 стала однією з тих моделей, що заклали основу для майбутнього успіху компанії Husqvarna в мотоциклетному спорті та на ринку. Вона зіграла важливу роль у формуванні репутації бренду як виробника надійних і високоякісних мотоциклів.
Husqvarna Model 30 - це важлива частина історії мотоциклетної індустрії, яка продемонструвала інноваційний підхід до конструкції і виробництва мотоциклів у 1930-х роках. Ця модель залишається значущою для колекціонерів та істориків мотоциклетного спорту завдяки своїм технічним характеристикам та впливу на розвиток мотоциклетної техніки.'),
(4, 'Desert Sled', '1956–1973', '649 см3', 'Двоциліндровий рядний', '50 к.с.', 'повітряне', '6', '15 л.', '166 кг.', 'images/motorcycle_images/Desert_Sled.jpg', 'Triumph Desert Sled — це мотоцикл, який асоціюється з епохою, коли пригоди в пустелі та змагання по бездоріжжю були на піку популярності. Хоча сам бренд Triumph не випускав модель з назвою Desert Sled, цей термін використовується для опису мотоциклів, модифікованих для їзди в пустельних умовах. В основному це стосується мотоциклів, які використовувались у 1960-х і 1970-х роках в Каліфорнії та інших пустельних регіонах.
Triumph Desert Sled є символом епохи пустельних гонок і пригод на мотоциклах. Ці мотоцикли втілювали дух свободи, пригод і технічної майстерності, оскільки гонщики модифікували свої байки для найскладніших умов. Сьогодні вони залишаються іконою мотоспорту та надихають сучасні моделі, які продовжують традицію пригодницьких мотоциклів.'),
(4, 'Bonneville T120', '1959-1974', '1200 см3', 'Двоциліндровий з відділеною конструкцією картера', '80 к.с.', 'повітряне', '6', '14.5 л.', '224 кг.', 'images/motorcycle_images/Triumph_Bonneville_T120.jpg', 'Triumph Bonneville T120 - це класичний мотоцикл, який відзначається елегантним дизайном і високою продуктивністю.
Загалом, Triumph Bonneville T120 є потужним, елегантним і надійним мотоциклом, який продовжує традиції легендарної лінійки Bonneville і залишається популярним серед мотоциклістів будь-якого рівня досвіду.'),
(4, 'Thunderbird', '1949 - до тепер', '1597 см3', 'ШестициліндровиЙ з рядним розміщенням поршнів', '85 к.с.', 'повітряне', '6', '22 л.', '339 кг.', 'images/motorcycle_images/Thunderbird.jpg', 'Triumph Thunderbird - це серія круїзерських мотоциклів від британського виробника Triumph Motorcycles. Перша модель була випущена в 1949 році, а остання - у 2017 році. Thunderbird відомий своїм вражаючим дизайном, потужним двигуном і високим рівнем комфорту. Це популярний вибір для тих, хто цінує відмінні характеристики і стильне вигляду.
Triumph Thunderbird - це ікона круїзерських мотоциклів, яка поєднує в собі класичний стиль, потужний двигун і комфортну їзду.
Загалом, Triumph Thunderbird - це мотоцикл з вражаючим зовнішнім виглядом, потужним двигуном і високим рівнем комфорту, який залишається популярним серед мотоциклістів, які цінують класичний круїзерський стиль і надійність на дорозі.'),
(4, 'Speed Twin', '1937 - до тепер', '498 см3', 'Чотиритактний, паралельний', '40 к.с.', 'повітряне', '4', '14 л.', '220 кг.', 'images/motorcycle_images/Speed_Twin.jpg', 'Триумф Speed Twin - це легендарний мотоцикл, що був вперше представлений у 1937 році. Цей мотоцикл став одним з найбільш впливових і успішних моделей у історії мотоциклів.
Triumph Speed Twin завоював шанувальників по всьому світу завдяки своєму харизматичному вигляду та вражаючим характеристикам.
У всіх своїх ітераціях Triumph Speed Twin залишався символом вишуканості, сили та стилю, що зробило його одним з найпопулярніших мотоциклів у своєму класі.'),
(5, 'Gold Star', '1938-1963', '348 см3', 'Одноциліндровий, чотиритактний', '30 к.с.', 'повітряне', '4', '15 л.', '170 кг.', 'images/motorcycle_images/Gold_Star.jpg', 'BSA Gold Star — це легендарний британський мотоцикл, який випускався компанією Birmingham Small Arms Company (BSA) у період з кінця 1930-х до початку 1960-х років. Ця модель здобула репутацію завдяки своїм високим характеристикам і успіхам у змаганнях.
BSA Gold Star з''явився в 1938 році і швидко завоював популярність серед мотогонщиків і ентузіастів. Назва "Gold Star" була взята на честь нагороди, яку отримали мотоцикли BSA, встановивши рекорди швидкості на треках.
Мотоцикл є символом епохи, коли мотоцикли були більше ніж просто транспортними засобами; вони були інструментами для пригод і спортивних досягнень. Його спадщина продовжує жити, надихаючи нові покоління мотолюбителів.'),
(5, 'A10 Super Rocket', '1959-1962', '646 см3', 'Двоциліндровий з паралельним розташуванням циліндрів', '40 к.с.', 'повітряне', '4', '15 л.', '180 кг.', 'images/motorcycle_images/A10_Super_Rocket.jpg', 'BSA A10 Super Rocket - це класичний вінтажний мотоцикл, що був вироблений британською компанією Birmingham Small Arms Company (BSA) з кінця 1950-х до середини 1960-х років. Він входив у лінійку моделей A10, яка була відома своєю потужністю і швидкістю.
Цей мотоцикл вважався відмінним вибором для тих, хто цінував швидкість, потужність і класичний стиль. Він залишається популярним серед колекціонерів і ентузіастів вінтажних мотоциклів до сьогоднішнього дня.'),
(6, 'Chief', '1922-1953', '1000 см3', 'V-твін з паралельною конфігурацією циліндрів', '50 к.с.', 'повітряне', '5', '19 л.', '318 кг.', 'images/motorcycle_images/Indian_Chief.jpg', 'Indian Chief - це іконічний мотоцикл, що відзначається своїм величним дизайном, потужними характеристиками та багатою історією. Ця модель вироблялася компанією Indian Motorcycle Company і стала однією з найвпливовіших у світі мотоциклетної індустрії.
Indian Chief продовжує залишатися одним з найпопулярніших та шанованих мотоциклів у світі, завдяки своєму вражаючому дизайну, потужним характеристикам і багатій історії.'),
(6, 'Scout', '1920-1949', '740 см3', 'V-твін', '25 к.с.', 'повітряна', '5', '12.5 л.', '204 кг.', 'images/motorcycle_images/Scout.jpg', 'Indian Scout 1949 - це культова модель мотоцикла, яка вироблялася компанією Indian Motorcycle Company. Вона входить до легендарної лінійки Indian Scout і визнана своїм елегантним дизайном та потужними характеристиками.
Indian Scout 1949 - це символ вільної духу мотоциклетної культури і досі викликає захоплення своїм характерним дизайном і надійністю.'),
(6, 'Four', '1928-1942', '1260 см3', 'Чотирьохциліндровий', '40 к.с.', 'повітряна', '4', '19 л.', '272 кн.', 'images/motorcycle_images/Four.jpg', 'Indian Scout 1949 - це культова модель мотоцикла, яка вироблялася компанією Indian Motorcycle Company. Вона входить до легендарної лінійки Indian Scout і визнана своїм елегантним дизайном та потужними характеристиками.
Indian Four був легендарним мотоциклом, який вироблявся компанією Indian Motorcycle з 1928 по 1942 рік. Він був відомий своїм потужним чотиривалковим двигуном, великою місткістю і класичним дизайном. Indian Four був одним з найпрестижніших мотоциклів свого часу і завдяки своїй вишуканій естетиці та високій продуктивності він здобув шану багатьох мотоциклетних ентузіастів та колекціонерів по всьому світу.
Indian Scout 1949 - це символ вільної духу мотоциклетної культури і досі викликає захоплення своїм характерним дизайном і надійністю.');