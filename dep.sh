mkdocs gh-deploy

git add .
git commit -m "$(date +"%Y/%m/%d %H:%M:%S") $1"
git push origin master
