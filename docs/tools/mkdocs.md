---
title: MkDocs
date: 2019-09-16
---
# MkDocs
> [https://hackmd.io/pNxCxfHMTYm-GrJ1oc4ITA?view](https://hackmd.io/pNxCxfHMTYm-GrJ1oc4ITA?view)
## 基本介紹

根據[官網](https://www.mkdocs.org/)介紹，MkDocs是個用於project documentation的static site generator，並且強調快速、簡單，文件使用`markdown`撰寫，設定檔使用`YAML`，並且可以使用[主題](https://www.mkdocs.org/user-guide/styling-your-docs/#built-in-themes)等高度自訂化。

* 使用 [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
	* `pip install mkdocs-material`

```bash
mkdocs --version    # Check the path
cd ..../theme       # the ... replace with the path see above
git clone https://github.com/squidfunk/mkdocs-material.git
ln -s mkdocs-material/material material
```

## 安裝

* <del>用package manager安裝</del>，或是自已build

```
$ brew install mkdocs
```

!!!danger
	用`pip`安裝即可，若使用package manager安裝則後續會遇到目錄問題 <br>
	<https://github.com/squidfunk/mkdocs-material/issues/52>

<https://www.mkdocs.org/#installation>

## 基本使用

* 新建專案

```
$ mkdocs new <project name>
INFO    -  Creating project directory: docs
INFO    -  Writing config file: docs/mkdocs.yml
INFO    -  Writing initial docs: docs/docs/index.md
```

`mkdocs`會產生你指定的目錄及底下的檔案，而之後要往你的docs加東西就往這個目錄新建檔案。

* 測試

```
$ mkdocs serve
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 190915 00:07:57 server:292] Serving on http://127.0.0.1:8000
```

訪問[http://127.0.0.1:8000](http://127.0.0.1:8000)看到以下畫面便完成新`mkdocs`專案建立

![test site](https://i.imgur.com/boO6GZw.png)

## 部署

* 在`mkdocs.yml`加入`repo_name`跟`repo_url`

```
repo_name: roy4801/docs.roy4801.tw
repo_url: https://github.com/roy4801/docs.roy4801.tw
```

* 執行`mkdocs gh-deploy`
    * site會deploy在`gh-page`分支

> Github page: 在`docs/`底下加入`CNAME`可以自訂domain

### 使用 github-action 自動部署

使用 [mhausenblas/mkdocs-deploy-gh-pages](https://github.com/marketplace/actions/deploy-mkdocs) 偵測 push 時自動部署到 `gh-page` 分支

新增檔案 `.github/workflows/deploy.yml` 如下，其中的 `GITHUB_TOKEN` 會自動產生
```yaml
name: Publish docs via GitHub Pages
on:
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy docs
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main
        uses: actions/checkout@v2

      - name: Deploy docs
        uses: mhausenblas/mkdocs-deploy-gh-pages@master
        # Or use mhausenblas/mkdocs-deploy-gh-pages@nomaterial to build without the mkdocs-material theme
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          CUSTOM_DOMAIN: docs.roy4801.tw
          CONFIG_FILE: mkdocs.yml
          EXTRA_PACKAGES: build-base
          # GITHUB_DOMAIN: github.myenterprise.com
          REQUIREMENTS: requirements.txt
```

## 參考

* [MkDocsPlus](https://github.com/bwmarrin/MkDocsPlus)

* <https://github.com/ctf-wiki/ctf-wiki/blob/master/mkdocs-zh.yml>

* <https://squidfunk.github.io/mkdocs-material/extensions/pymdown/>
