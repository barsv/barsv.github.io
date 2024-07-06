---
layout: post
title: Github actions versions deprecation
date: 2024-07-06 01:03:00
---

давно не писал в блог. сделал запись и нифига не опубликовалось. пришлось лезть разбираться.

в github actions в логах сборки нашел ошибку:

```
Deprecation notice: v1, v2, and v3 of the artifact actions
The following artifacts were uploaded using a version of actions/upload-artifact that is scheduled for deprecation: "github-pages".
Please update your workflow to use v4 of the artifact actions.
Learn more: https://github.blog/changelog/2024-04-16-deprecation-notice-v3-of-the-artifact-actions/
```

вроде понятно, что надо версии обновить где-то. но где... я не специалист по джекилу и не хочу им становиться.

решение - поиском "github-pages" нашел, что версии в файле .github/workflows/jekyll-gh-pages.yml

следующий вопрос: на что обновлять версии??? разбираться ведь не охото.

решение - шнашел пример ямл файла и просто списал оттуда номера версий.

пример ямл файла взял тут: https://github.com/actions/starter-workflows/blob/main/pages/jekyll-gh-pages.yml

бинго. все опять работает.