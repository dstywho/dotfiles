for file in "$@"
do
  filename=${file##*/}
  if [[ "$filename" != "." && "$filename" != ".." && "$filename" != ".git"  && "$filename" != ".ssh" ]] ; then
    echo rm -rf ~/$filename
    echo ln -s $PWD/$file ~/$filename
    echo ""
    rm -rf ~/$filename
    ln -s $PWD/$file ~/$filename
  fi
done
