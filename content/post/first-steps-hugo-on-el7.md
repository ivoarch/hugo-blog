+++
date = "2017-03-01T14:27:44+01:00"
title = "Първи стъпки с Hugo"

+++

[Hugo](https://gohugo.io/) е много бърз и лесен за използване генератор на статични уеб сайтове, написан с помощта на [golang](https://golang.org/). В този пост ще ви покажа как можете да разположите или хостнете вашият блог с Hugo в [github-pages](https://pages.github.com/). Нека да започнем!

## Инсталиране на зависимости

Преди да инсталираме Hugo, е нужно да инсталираме следните зависимости .

Под RHEL/CentOS 7.x , става по следният начин .

```
$ sudo yum install go git
```

Инсталираме Hugo като изпълним всичките команди по-долу .

```
$ export GOPATH=$HOME/go
$ go get -v github.com/spf13/hugo
$ echo "\nexport GOPATH=~/go\nexport PATH=\$PATH:~/go/bin" >> ~/.zshrc
```

Сега е време да тестваме инсталацията, изпълнете `$ hugo version` . Ако всичко е наред продължаваме със следващата стъпка .

## Създаване на сайт

```
$ hugo new site ~/my-site-name
```

**Забележка:** Заменете `my-site-name` със желаното име зa сайта .

## Инсталиране на теми

За съжаление Hugo не разполага с тема по подразбиране, и след създаване на сайта ни трябва сами да инсталираме такава . Това става лесно, избираме си тема според това което ни харесва от това хранилище <http://themes.gohugo.io/> . След като, сме избрали тема я изтегляме в директорията `~/my-site-name/themes` на нашият сайт .

Ето така:

```
$ cd ~/my-site-name/themes
$ git clone https://github.com/rakuishi/hugo-zen
```

**Забележка:** Общите конфигурации се правят от файлът `config.toml` в директорията на сайта ни.

## Създаване на първи пост

```
$ hugo new post/My-First-Post.md 
/home/ivo/my-site-name/content/post/My-First-Post.md created
```

## Тестване на сайта
Портът по подразбиране за тестовият сървър, който Hugo използва за преглед на промените които правим в уеб сайта е `1313`. Така, че имаме нужда да конфигурираме защитната стена, да осигури достъп до нашия сайт .

Отваряме терминалът и правим следните настройки:

Ако използваме Firewalld.

```
$ sudo firewall-cmd --zone=public --add-port=1313/tcp
```

Ако използваме Iptables.

```
$ sudo iptables -I INPUT -p tcp --dport 1313 -j ACCEPT
```

Стартираме Hugo сървърът .

```
$ hugo server -t hugo-zen -w
```

**Забележка:** Използваме `-t` опция за да посочим тема която искаме да използваме за нашият сайт .

Посетете вашият сайт от браузъра <http://localhost:1313> .

## Създаваме github хранилище

Трябва да отидем в Github и да създадем хранилище `username.github.io` за да хостнем генерирания статичен сайт . 

## Генериране на сайта

Вече създадохме хранилището за хостване на сайта ни , сега от главната директория на сайта `my-site-name` изпълнете `$ hugo -d ../username.github.io` . Това ще генерира сайта вътре в нова директория `username.github.io` на нашият `$HOME` на потребителя .

**Забележка:** username е нашето потребителско име в github .

```
$ hugo -d ../ivoarch.github.io
Started building sites ...
Built site for language en:
0 draft content
0 future content
0 expired content
1 regular pages created
2 other pages created
0 non-page files copied
0 paginator pages created
0 tags created
0 categories created
total in 11 ms

$ tree ivoarch.github.io
ivoarch.github.io
|-- css
|   |-- custom.css
|   |-- normalize.css
|   `-- skeleton.css
|-- images
|   `-- profile.jpg
|-- index.html
|-- index.xml
|-- post
|   |-- My-First-Post
|   |   `-- index.html
|   |-- index.html
|   `-- index.xml
`-- sitemap.xml

```

## Хостване на сайт

Отиваме в директорията на хранилището което преди малко създадохме .

```
$ cd ivoarch.github.io
$ echo "# ivoarch.github.io" >> README.md
$ git init
$ git add .
$ git commit -m "first commit"
$ git remote add origin https://github.com/ivoarch/ivoarch.github.io.git
$ git push -u origin master
```

## Крайния резултат

Можете да го намерите на адрес <https://ivoarch.github.io> .

