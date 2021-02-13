#! /bin/bash
name="$1.$2"

while [ -n "$1" ]
do
    case $2 in
    "py")
        echo -ne "#! /usr/bin/python3\n" > $name
    ;;

    "sh")
        echo -ne "#! /bin/bash\n" > $name
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
    ;;

    esac
    chmod 754 $name

    shift
    shift
done
