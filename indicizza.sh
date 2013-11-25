#!/usr/bin/env sh
#
# mutek (2013)
# 
# <mutek@riseup.net>
#
# Indicizza in base al contenuto di incoming
#
#

. ./genThumb.sh
wait

mv incoming/*.png Covers/
wait

mv incoming/*.pdf PDF/
wait

mv incoming/*.mp3 AUDIO/
wait

mv model/body.html model/body.html.old
wait

for file in $(ls PDF | cut -d"." -f 1 | sort -r)
do

        echo $file
echo "<li><a href=\"http://mutek.github.io/LinuxJournal/PDF/"$file".pdf\"><img src=\"http://mutek.github.io/LinuxJournal/Covers/"$file".pdf.png\" style=\"max-width: 307px;\" alt=\"LinuxJournal numero "$file"\"></a><div><audio preload=\"auto\" src=\"http://mutek.github.io/LinuxJournal/AUDIO/"$file".mp3\" controls=\"controls\">audio non disponibile</audio></div>"$file"</li>" >> model/body.html
wait

done

# header
cat model/header.html > index.html
wait

#body
cat model/body.html >> index.html
wait

# footer
cat model/footer.html >> index.html
