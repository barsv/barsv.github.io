---
layout: post
title: Virtual monitors on popos
date: 2023-12-17 13:49
---

У меня была жутка ебля в прошлые выходные с тем, чтобы сделать виртуальные мониторы на лаптопе с PopOS.

В итоге все решилось и я даже отписался об этом в дискорде immersed. Продублирую тут, чтобы потом самому проще было найти:

```
I got virtual monitors on PopOS on a System76 laptop with Intel. But the steps described in https://medium.com/@augustoicaro/5b24bf1c4421 for intel didn't work for me. If I select "intel" driver in 20-intel.conf, then in syslog I see the error that /usr/lib/x86_64-linux-gnu/dri/i965_dri.so  is missing and a few lines later it says "Failed to submit rendering commands (Invalid argument), disabling acceleration." As a result I can create virtual monitors but the performance is horrible and also artifacts appear on the screen quite often. Maybe I had to install some drivers. But I'm not sure if it's a good idea to interfere with what system76 is doing. As far as I understand they manage driver updates automatically, though maybe I'm wrong. 
If I replace "intel" driver with "modesetting" (I actually don't know what I'm doing but just tried) then I get "modeset(0): Option "VirtualHeads" is not used" in the logs and the virtual monitor is not created.
I also tried to follow the steps for evdi approach but had issues there too. When I did "sudo modprobe evdi initial_device_count=4" my system got unresponsive. Mouse cursor was moving but all GUI was freezed. I had to press Ctrl+Alt+F3 and restart gdm with "sudo systemctl restart gdm". In logs I found "MESA-LOADER: failed to open evdi: /usr/lib/dri/evdi_dri.so". Finally I got it working after I installed displaylink-driver following steps on this page: https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu Again I don't know what I was doing but it helped. One thing I want to note is that I'm not sure that building evdi from the main branch is a good idea. Usually it's better to use a stable branch. Though I tried to checkout tags/v1.14.1 and it didn't helped in my case.
```

Кстати, после этого мне эти виртуальные мониторы пригодились еще раз, чтобы использовать старый лаптоп как второй
монитор через https://deskreen.com/

После подключения патч кордом по LAN стало более менее. А по вайфай было совсем фигово с латенси. Хотя может это было
от того, что старый лаптоп не может по 5G вайфаю работать.