#!/bin/sh
cd Temp
cours=([!i]*/)
for mat in ${cours[@]}; do
	echo ${mat}
	cd ${mat}
	cours=(*/)
	for cha in "${cours[@]}"; do
		echo " ${cha}"
		cd ${cha}
		cours=(*.tex)
		for fil in "${cours[@]}"; do
			echo "  ${fil}";
			texi2pdf ${fil} > /dev/null
			rm ${fil:0:1}*.aux 2> /dev/null
			rm ${fil:0:1}*.log 2> /dev/null
			rm ${fil:0:1}*.fls 2> /dev/null
			rm ${fil:0:1}*.syn* 2> /dev/null
			mkdir ../../../${mat} 2> /dev/null
			mkdir ../../../${mat}${cha} 2> /dev/null
			mv ${fil:0:1}*.pdf ../../../${mat}${cha}
			mkdir ../../../Code_Source/${mat} 2> /dev/null
			mkdir ../../../Code_Source/${mat}${cha} 2> /dev/null
			cp ${fil:0:1}*.tex ../../../Code_Source/${mat}${cha}
		done
		cd ../
	done
	cd ../
done
