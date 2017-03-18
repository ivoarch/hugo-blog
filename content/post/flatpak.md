+++
date = "2017-03-18"
title = "Как да инсталираме Flatpak в StotinkaOS 7.x"
tags = ["flatpak", "stotinkaos"]
+++

## Какво е Flatpak ?
[Flatpak](http://flatpak.org/) е технология от ново поколение за изграждане и инсталиране на десктоп приложения.
Тази нова технология позволява едно и също приложение да бъде инсталирано на различни Linux дистрибуции, включващи различни версии и всичко това с помощта на само един пакет. 


## Първи стъпки

### Инсталиране на Flatpak

Преди да можете да инсталирате приложения с Flatpak, трябва първо да го инсталирате . От съвсем скоро Flatpak е наличен и за [StotinkaOS](https://www.stotinkaos.net/) 7.x от хранилището StotinkaOS-Flatpak .

Тъй като хранилището не е включено по подразбиране, ще трябва собствено ръчно да си го добавим , това става по следният начин от линията на команди .

```
$ cd /etc/yum.conf.d/
$ sudo wget https://www.stotinkaos.net/stotinkaOS/repo/7/Flatpak/stotinka0S-Flatpak.repo 
```

Веднъж добавено , за да инсталирате Flatpak :

```
$ sudo yum install flatpak
```

**Забележка:** За други дистрибуции погледнете [тук](http://flatpak.org/getting.html) .

### Добавяне на хранилище

Пример (GNOME-stable):

#### Инсталиране на GNOME runtimes хранилище

```
$ flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo
```

За повече информация и детайли посетете тази страница [1] http://flatpak.org/runtimes.html#gnome .

#### Инсталиране на GNOME apps хранилище

```
$ flatpak remote-add gnome-apps https://sdk.gnome.org/gnome-apps.flatpakrepo
```

След което за да изкараме списък на всички приложения от хранилището .

```
$ flatpak remote-ls gnome-apps
```

За да инсталираме приложение от списъка .

Пример gnome-maps 

```
$ flatpak install gnome-apps org.gnome.Maps stable
```

За да стартирате приложението .

```
$ flatpak run org.gnome.Maps
```

Някои други приложения като (pitivi, skype, Blender...) за Flatpak може да намерите [тук](http://flatpak.org/apps.html) .

