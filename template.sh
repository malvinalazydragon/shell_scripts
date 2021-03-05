#! /bin/bash
name="$1.$2"

while [ -n "$1" ]
do
    case $2 in
    "py")
        echo -ne "#! /usr/bin/python3\n" > $name
        chmod 754 $name
    ;;

    "sh")
        echo -ne "#! /bin/bash\n" > $name
        chmod 754 $name
    ;;

    "desktop")
        echo -ne \
"\
[Desktop Entry]
Name=
Icon=
Path=
Exec=
Categories=
Category=\
" > $name
    chmod 754 $name
    ;;

    "pas")
        mkdir $1; cd $1
        cat /home/$USER/Documents/git/BASH/.nibba > B.sh
        chmod 754 B.sh
        mkdir src
        touch notes.txt src/main.pas
    ;;

    esac

    shift
    shift
done
