#!/bin/bash
echo "        ////    ///     ///      ////    ///       //     ///         ////////////    //////     /////////   /////////"
echo "      //   //   ///     ///    ///  ///  ///      ////    ///             ///       ///   ///    ///         ///"
echo "      ///       ///////////   ///   ///   ///    //////  ///              ///      ///  ///      ////////    ////////"
echo "        ///     ///     ///  ///    ///    ///  /// /// ///               ///     //////         ///         ///"
echo "     //  ///    ///     ///  ///   ///     /// ///  //////                ///    ///  ///        ///         ///"
echo "      ////      ///     ///    ////         ////    ////                  ///   ///    ///       /////////   /////////"

case $1 in
"-d")
dos () {

for dir in  *;
do
if [ -d "$dir" ] ; then
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|   "
done
if [ ! "$(ls -A "$dir")" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
dirs=`expr $dirs + 1`
echo "+---$dir" 
else
echo "+---$dir"
if cd "$dir" ; then
dos `expr "$1" + 1`
cd ..
dirs=`expr $dirs + 1`
fi
fi
fi
done
}
if [ $# != 0 ] ; then
cd "$2"
fi
dirs=0
dos 0
echo "Nombre total de répertoires = $dirs"
exit 0

;;
"-s")
simple () {

for dir in  *;
do
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|   "
done
if [ ! "$(ls -A "$dir")" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
else
echo "+---$dir"
if [ -d "$dir" ] ; then
dirs=`expr $dirs + 1`
if cd "$dir" ; then
simple `expr "$1" + 1`
cd ..
fi
else
fils=`expr $fils + 1`
fi
fi
done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
simple 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0


;;
"-c")
col () {

for dir in  *;
do
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|   "
done
if [ !  "$(ls -A "$dir")" ] ; then
printf "+---\e[00;34m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
printf "+---\e[00;35m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
elif [ -d "$dir" ] ; then
printf "+---\e[00;34m$dir\e[0;m\n";
dirs=`expr $dirs + 1`
if cd "$dir" ; then
col `expr "$1" + 1`
cd ..
fi
elif [ -f "$dir" ] ; then
printf "+---\e[00;33m$dir\e[0;m\n";
fils=`expr $fils + 1`
else
echo "+---$dir"
fils=`expr $fils + 1`
fi

done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
col 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0

;;
"-n")

echo "donner le niveaux"
read n
if [ $n -eq 1 ];then
premier () {
for dir in  *;
do
if [ ! "$(ls -A "$dir")" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
else
echo "+---$dir"
if [ -d "$dir" ] ; then

dirs=`expr $dirs + 1`

else
fils=`expr $fils + 1`
fi
fi
done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
premier 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0





else
niv () {
for dir in  *;
do
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|   "
done
if [ ! "$(ls -A "$dir")" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
echo "+---$dir" 
dirs=`expr $dirs + 1`
else
echo "+---$dir"
if [ -d "$dir" ] ; then
d=`expr $n - 1`
if [ $i -eq $d ];then
dirs=`expr $dirs + 1`
continue
fi
dirs=`expr $dirs + 1`
if cd "$dir" ; then
niv `expr "$1" + 1`
cd ..
fi
else
fils=`expr $fils + 1`
fi
fi
done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
niv 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0
fi

;;
"-nc")

echo "donner le niveaux"
read n


if [ $n -eq 1 ];then
search () {
for dir in  *;
do
if [ !  "$(ls -A "$dir")" ] ; then
printf "+---\e[00;34m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
printf "+---\e[00;35m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
elif [ -d "$dir" ] ; then
printf "+---\e[00;34m$dir\e[0;m\n";
dirs=`expr $dirs + 1`
elif [ -f "$dir" ] ; then
printf "+---\e[00;33m$dir\e[0;m\n";
fils=`expr $fils + 1`
else
echo "+---$dir"
fils=`expr $fils + 1`
fi
done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
search 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0



else
search () {
for dir in  *;
do
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|   "
done
if [ !  "$(ls -A "$dir")" ] ; then
printf "+---\e[00;34m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
printf "+---\e[00;35m$dir\e[0;m\n"; 
dirs=`expr $dirs + 1`
elif [ -d "$dir" ] ; then


d=`expr $n - 1`
if [ $i -eq $d ];then
dirs=`expr $dirs + 1`
printf "+---\e[00;34m$dir\e[0;m\n";
continue
fi


printf "+---\e[00;34m$dir\e[0;m\n";
dirs=`expr $dirs + 1`
if cd "$dir" ; then
search `expr "$1" + 1`
cd ..
fi
elif [ -f "$dir" ] ; then
printf "+---\e[00;33m$dir\e[0;m\n";
fils=`expr $fils + 1`
else
echo "+---$dir"
fils=`expr $fils + 1`
fi

done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
search 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0
fi
;;
"-a")


av () {

for dir in  *;
do
i=0
while [ $i != "$1" ]
do
i=`expr $i + 1`
echo -n "|    "
done
if [ !  "$(ls -A "$dir")" ] ; then
printf "+---\e[00;36m 📁 $dir\e[0;m\n";
dirs=`expr $dirs + 1`
continue
fi
if [ -L "$dir" ] ; then
printf "+---\e[00;36m 📁 $dir\e[0;m\n";
dirs=`expr $dirs + 1`
elif [ -d "$dir" ] ; then
printf "+---\e[00;36m 📁 $dir\e[0;m\n";
dirs=`expr $dirs + 1`
if cd "$dir" ; then
av `expr "$1" + 1`
cd ..
fi
elif [ "${dir##*.}" = "mp3" ] || [ "${dir##*.}" = "wav" ] || [ "${dir##*.}" = "mid" ] ; then
printf "+---\e[00;33m 📼  $dir\e[0;m\n";
fils=`expr $fils + 1`

elif [ "${dir##*.}" = "mp4" ] || [ "${dir##*.}" = "wmv" ] || [ "${dir##*.}" = "mov" ] ; then
printf "+---\e[00;33m 🎞  $dir\e[0;m\n";
fils=`expr $fils + 1`


elif [ "${dir##*.}" = "jpg" ] || [ "${dir##*.}" = "jpge" ] || [ "${dir##*.}" = "gif" ] || [ "${dir##*.}" = "png" ] ; then
printf "+---\e[00;33m 🖼  $dir\e[0;m\n";
fils=`expr $fils + 1`
elif [ -f "$dir" ] ; then
printf "+---\e[00;33m 📚 $dir\e[0;m\n";
fils=`expr $fils + 1`
else
printf "+---\e[00;33m 📚 $dir\e[0;m\n";
fils=`expr $fils + 1`
fi

done
}
if [ $# != 0 ] ; then
cd "$2"
fi
fils=0
dirs=0
av 0
echo "Nombre total de répertoires = $dirs"
echo "Nombre total de ficheiers = $fils"
exit 0






;;
*)
exit 0
;;
esac

