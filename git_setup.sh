echo "Type in your first and last name (no accent or special characters - e.g. 'ç'): "
read full_name

echo "Type in your email address (the one used for your GitHub account): "
read email

git config --global user.email "$email"
git config --global user.name "$full_name"

git add gitconfig
git commit --message "My user identity in the gitconfig"
git push origin master

echo "👌 Awesome, all set."
