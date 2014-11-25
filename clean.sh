#!/bin/sh
cd Temp
cours=(*/)
PS3="which dir do you want? "
echo "There are ${#cours[@]} dirs";
select mat in "${cours[@]}";
	do echo "you selected ${mat}"'!';
	cd ${mat}
	cours=(*/)
	echo "There are ${#cours[@]} dirs";
	select cha in "${cours[@]}";
		do echo "you selected ${cha}"'!';
		cd ${cha}
		cours=(*.tex)
		echo "There are ${#cours[@]} files";
		select fil in "${cours[@]}";
			do echo "you selected ${fil}"'!';
			texi2pdf ${fil}
			rm ${fil:0:1}*.aux
			rm ${fil:0:1}*.log
			rm ${fil:0:1}*.fls
			rm ${fil:0:1}*.syn*
			mkdir ../../../${mat}
			mkdir ../../../${mat}${cha}
			mv ${fil:0:1}*.pdf ../../../${mat}${cha}
			mkdir ../../../Code_Source/${mat}
			mkdir ../../../Code_Source/${mat}${cha}
			cp ${fil:0:1}*.tex ../../../Code_Source/${mat}${cha}
			break;
		done
		break;
	done
	break;
done
