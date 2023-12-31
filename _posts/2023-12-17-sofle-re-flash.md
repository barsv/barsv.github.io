---
layout: post
title: Sofle keyboard re-flash
date: 2023-12-17 11:47
---

Спустя неделю активного использования sofle keyboard я созрел для внесения изменений в раскладку.

Вообще, моя мысль изначально была попытаться адаптироваться к существующим настройкам просто из соображений, чтобы
помучить себя. Немного бдсм. Чтобы новые нейроны начали шевелиться в голове.

Но лед тронулся. Пока я решил сделать несущественные изменения, чтобы облегчить кейсы, когда одна рука занята.

Например, если в правой руке мышь, а надо нажать пробел или бекспейс, то не хочется тянуться до правой половины 
клавиатуры. Поэтому я добавил эти две кнопки в нижний слой, заменив тильду и таб.

Аналогично в верхнем слое я заменил бекспейс на эскейп и пустую кнопку под ним на энтер, чтобы можно было нажимать их,
когда в левой руке кружка чая.

Не обошлось без небольших трудностей. Для начала пришлось найти где редактировать раскладку. Я начал искать в 
~/qmk_firmware/keyboards/sofle/rev1/. На этом этапе пришлось осознать, что есть клавиатура и есть кеймап. При прошивке
в команде `qmk flash` клавиатура указывается в ключе -kb, а кеймап в ключе -km. Например, у меня:

```
qmk flash -kb sofle/rev1 -km default -e CONVERT_TO=elite_pi
```

Дальше надо найти где этот кеймап лежит. Как оказалось искать надо было в
 ~/qmk_firmware/keyboards/sofle/keymaps/default/, т.к. на уровень выше от директории rev1.

Замена кнопок не вызвала затруднений, однако, проблема возникла с прошивкой. Я не знал, что клавиатуру надо переводить
в режим загрузки. При выполнении команды qmk flash процесс зависал с сообщением 'waiting for drive to deploy'.

К счастью у меня получилось сообразить в чем дело. Еще при первой прошивке (две недели назад) я обратил внимание, что
при подключении клавиатуры она распозналась как USB устройство, а точнее даже наверное как юсб флешка. Это совпало с 
'drive' в сообщении от qmk, поэтому я догадался, что надо как-то сделать так, чтобы клавиатура опять распозналась как
флешка. Начал искать сначала по ключевым словам RP2040, но потом додумался добавить слово Frood, которое отпечатано на 
плате и попал на сайт 42keebs, где я собственно ее покупал: 
https://42keebs.eu/shop/parts/controllers/frood-rp2040-pro-micro-controller/

Там уже до меня дошло, что у меня видимо какая-то особенная улучшенная версия и возможно у меня переход в режим прошивки
будет отличаться. Но и этого для меня оказалось мыло. Там было написано, что надо зажать кнопку BOOT и нажать RESET.

Сейчас вот только я уже понял, что это кнопки не на плате клавиатуры, а на маленькой плате с контроллером.

В итоге, я обошелся без этого, т.к. я вспомнил, что когда разглядывал расположение кнопок на верхнем слое, то там была
 кнопка ресет. Я попробовал нажал ее, и клавиатура сразу распозналась как USB устройство и прошилась без проблем.