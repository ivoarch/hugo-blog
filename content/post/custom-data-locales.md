+++
date = "2017-03-04T17:07:56+01:00"
title = "Добавяне на Българска локализация за дата в Hugo"
slug = ""
tags = ["hugo"]
+++


Ако съм разбрал добре, [Golang](https://golang.org/) все още не разполага с подкрепа за интернационализиране на локали . По тази причина, първоначално не можах да намеря някаква проста опция за задаването на Българска локализация за датата на блогът ми (генериран с Hugo разбира се 😎 ) . 
По-късно обаче се оказа ,че имало някакво решение , даже описано и в самият сайт [1] <http://gohugo.io/tutorials/create-a-multilingual-site/> . В сайта примера е даден за Френски език, за това ще дам един за Български тук в моят блог, който е леко променен на този от сайта  .

Ето как става .

## Създаване на data файл

Създайте data файл в главната директория на вашият сайт/блог , нещо такова `data/meseci.yaml` .

```
$ cd my-site-name
$ mkdir data
$ cd data
$ touch meseci.yaml
```

Поставете следният текст, съдържащ имената на всички месеци .

```
1: "януари"
2: "февруари"
3: "март"
4: "април"
5: "май"
6: "юни"
7: "юли"
8: "август"
9: "септември"
10: "октомври"
11: "ноември"
12: "декември"
```

## Редактиране на шаблони от темата

Редактирайте шаблоните на темата която ползвате за вашият сайт/блог .

themes/hugo-zen/layouts/_default/list.html 

```diff
{{ range .Data.Pages }}
 		<article itemscope itemtype="http://schema.org/Blog">
 			<h2 class="entry-title" itemprop="headline"><a href="{{ .RelPermalink }}">{{ .Title }}{{ if .Draft }} #Draft{{ end }}</a></h2>
-			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02" }}">{{ .Date.Format "January 02, 2006" }}</time></span>
+			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" | safeHTML }}">
+  {{ .Date.Day }} {{ index $.Site.Data.meseci (printf "%d" .Date.Month) }}, {{ .Date.Year }}</time></span>
 		</article>
 {{ end }}
 	</main>
 
-{{ partial "footer.html" . }}
+{{ partial "footer.html" . }}
```

themes/hugo-zen/layouts/index.html

```diff
{{ range (where .Data.Pages ".Params.hidefromhome" "!=" "true") }}
 		<article itemscope itemtype="http://schema.org/Blog">
 			<h2 class="entry-title" itemprop="headline"><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
-			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02" }}">{{ .Date.Format "January 02, 2006" }}</time></span>
+			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" | safeHTML }}">
+  {{ .Date.Day }} {{ index $.Site.Data.meseci (printf "%d" .Date.Month) }}, {{ .Date.Year }} </time></span>
 		</article>
 {{ end }}
 	</main>
```

themes/hugo-zen/layouts/_default/single.html 

```diff
<main role="main">
 		<article itemscope itemtype="http://schema.org/BlogPosting">
 			<h1 class="entry-title" itemprop="headline">{{ .Title }}</h1>
-			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02" }}">{{ .Date.Format "January 02, 2006" }}</time></span>
+			<span class="entry-meta"><time itemprop="datePublished" datetime="{{ .Date.Format "2006-01-02T15:04:05Z07:00" | safeHTML }}">
+  {{ .Date.Day }} {{ index $.Site.Data.meseci (printf "%d" .Date.Month) }}, {{ .Date.Year }}</time></span>
 			<section itemprop="entry-text">
 				{{ .Content }}
 				<br>
```
