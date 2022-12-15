insert into customer_type (id, title)
values (1, 'basic'), (2, 'premium'), (3, 'vip');

insert into mortgage_type (id, title)
values (
    1, 'Аннуитетный'
), (
    2, 'Дифференциированный'
);

insert into role (id, title)
values (
    1, 'Банкир'
), (
    2, 'Финансовый аналитик'
), (
    3, 'Специалист по инвестициям'
), (
    4, 'Кредитный эксперт'
), (
    5, 'Специалист по клирингу'
), (
    6, 'Аудитор'
), (
    7, 'Бухгалтер'
), (
    8, 'Операционист'
), (
    9, 'Менеджер по работе с клиентами'
), (
    10, 'Кассир'
);

insert into customer (id, l_name, f_name, address, mobile_number)
values (
    1, 'Лебедева', 'Марьям', '931939, Свердловская область, город Домодедово, пер. Ленина, 83', '7(495)520-85-67'
), (
    2, 'Попов', 'Сергей', '551157, Калужская область, город Егорьевск, въезд 1905 года, 94', '7(495)873-27-27'
), (
    3, 'Симонова', 'Полина', '202149, Амурская область, город Дмитров, наб. Балканская, 07', '7(495)433-21-79'
), (
    4, 'Грачев', 'Роман', '602121, Амурская область, город Егорьевск, спуск Славы, 00', '7(495)660-78-26'
), (
    5, 'Волкова', 'Ева', '816471, Брянская область, город Люберцы, наб. Балканская, 13', '7(495)473-93-15'
), (
    6, 'Мельникова', 'Арина', '864383, Томская область, город Ногинск, шоссе Ломоносова, 55', '7(495)895-52-27'
), (
    7, 'Литвинов', 'Платон', '268138, Тамбовская область, город Серебряные Пруды, пр. Будапештсткая, 46', '7(495)619-88-83'
), (
    8, 'Зайцева', 'Алиса', '002536, Смоленская область, город Озёры, бульвар Гагарина, 44', '7(495)533-45-98'
), (
    9, 'Макаров', 'Федор', '963700, Белгородская область, город Домодедово, спуск Гоголя, 57', '7(495)729-13-43'
), (
    10, 'Зайцев', 'Мирон', '989907, Ульяновская область, город Коломна, наб. Сталина, 97', '7(495)498-61-53'
);

insert into employee (id, role_id, l_name, f_name, address, mobile_number)
values (
    1, 1, 'Болдырева', 'Алиса', '964473, Мурманская область, город Видное, пр. Косиора, 97', '7(495)698-09-33'
), (
    2, 2, 'Смирнов', 'Илья', '518278, Калужская область, город Раменское, шоссе Космонавтов, 31', '7(495)701-32-16'
), (
    3, 3, 'Потапов', 'Константин', '788902, Иркутская область, город Павловский Посад, пр. Космонавтов, 35', '7(495)255-03-01'
), (
    4, 4, 'Царев', 'Михаил', '784410, Челябинская область, город Озёры, пл. Бухарестская, 36', '7(495)579-94-29'
), (
    5, 5, 'Морозов', 'Никита', '863369, Ленинградская область, город Красногорск, пл. Ладыгина, 61', '7(495)282-21-62'
), (
    6, 5, 'Мельникова', 'Ева', '875303, Курганская область, город Раменское, ул. Славы, 21', '7(495)632-95-96'
), (
    7, 5, 'Корнилова', 'Валерия', '560214, Мурманская область, город Одинцово, пл. Бухарестская, 12', '7(495)518-82-96'
), (
    8, 5, 'Григорьев', 'Илья', '711520, Ленинградская область, город Павловский Посад, ул. Гагарина, 72', '7(495)768-29-73'
), (
    9, 5, 'Краснов', 'Артем', '226387, Тульская область, город Талдом, бульвар Чехова, 80', '7(495)563-72-57'
), (
    10, 6, 'Багданова', 'Анастасия', '158657, Липецкая область, город Балашиха, пр. Ладыгина, 20', '7(495)999-49-53'
), (
    11, 7, 'Исаева', 'Александра', '582878, Московская область, город Луховицы, пер. Чехова, 96', '7(495)311-01-40'
), (
    12, 8, 'Яковлев', 'Даниил', '895362, Ярославская область, город Сергиев Посад, пер. Ленина, 92', '7(495)644-90-28'
), (
    13, 9, 'Иванов', 'Степан', '283572, Ульяновская область, город Лотошино, ул. 1905 года, 05', '7(495)562-31-44'
), (
    14, 9, 'Колосов', 'Александр', '021128, Мурманская область, город Мытищи, въезд Домодедовская, 30', '7(495)339-34-76'
), (
    15, 9, 'Давыдова', 'Ева', '437387, Томская область, город Луховицы, шоссе Сталина, 64', '7(495)887-93-76'
), (
    16, 10, 'Цветкова', 'Ева', '090309, Псковская область, город Наро-Фоминск, пр. Сталина, 81', '7(495)219-33-78'
);

insert into account (id, customer_id)
values (
    1, 1
);