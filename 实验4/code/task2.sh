#!/bin/bash
function Partition_age()
{
				age=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)
				sum=0
				below20=0
				bt20to30=0
				up30=0
				for N in $age
				do
								if [[ $N != 'Age' ]]
								then
												sum=$((sum+1))
												if [[ $N -lt 20 ]]
												then
																below20=$((below20+1))
												fi
												if [[ $N -ge 20 ]] && [[ $N -le 30 ]]
												then
																bt20to30=$((bt20to30+1))
												fi
												if [[ $N -gt 30 ]]
												then
																up30=$((up30+1))
												fi
								fi

				done
        rate1=$(awk 'BEGIN{printf "%.3f",'$below20*100/$sum'}')
	      rate2=$(awk 'BEGIN{printf "%.3f",'$bt20to30*100/$sum'}')
	      rate3=$(awk 'BEGIN{printf "%.3f",'$up30*100/$sum'}')

				echo "20岁以下的有:$below20 人,所占的比列为: $rate1%"
				echo "[20-30]岁的有:$bt20to30 人,所占比列为: $rate2%"
				echo "30岁以上的有:$up30 人,所占比例为: $rate3%"     


}


function Position_player()
{
				position=$(awk -F '\t' '{print $5}' worldcupplayerinfo.tsv)
				Goalie=0
				Defender=0
				Midfielder=0
				Forward=0
				sum1=0
				for M in $position
				do
								if [[ $M != 'Position' ]]
								then
												sum1=$((sum1+1))

												if [[ $M == 'Goalie' ]];
												then
																Goalie=$((Goalie+1))
												fi
												if [[ $M == 'Defender' || $M == 'Défenseur' ]];
												then
																Defender=$((Defender+1))
												fi
												if [[ $M == 'Midfielder' ]];
												then
																Midfielder=$((Midfielder+1))
												fi
												if [[ $M == 'Forward' ]];
												then
																Forward=$((Forward+1))
												fi
								fi
								done	
								rate1=$(awk 'BEGIN{printf "%.3f",'$Goalie*100/$sum1'}')
								rate2=$(awk 'BEGIN{printf "%.3f",'$Defender*100/$sum1'}')
                rate3=$(awk 'BEGIN{printf "%.3f",'$Midfielder*100/$sum1'}')
								rate4=$(awk 'BEGIN{printf "%.3f",'$Forward*100/$sum1'}')

								echo "Goalies:'$Goalie'人,所占比例:$rate1%"
								echo "Defender:'$Defender'人,所占比例:$rate2%"
								echo "Midfielder:'$Midfielder'人,所占比例:$rate3%"
								echo "Forward:'$Forward'人,所占比例:$rate4%"
				}



function Find_name()
{
				longest=0
				shortest=100
				namelength=$( awk -F '\t' '{print length($9)}' worldcupplayerinfo.tsv)
				for L in $namelength
				do 
								if [[ $L -gt $longest ]];
								then
												longest=$L
								fi
								if [[ $L -lt $shortest ]];
								then
												shortest=$L
								fi
				done
				echo "名字最短的球员是:$(awk -F '\t' '{if (length($9)=='$shortest') {print $9}}' worldcupplayerinfo.tsv
				),长度为：$shortest"
				echo "名字最长的球员是: $(awk -F '\t' '{if (length($9)=='$longest') {print $9}}' worldcupplayerinfo.tsv
				),长度为:$longest" 



}


function Find_age()
{
				age=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)

				oldest=0
				youngest=200
				for N in $age
				do
								if [[ $N != 'Age' ]];
								then
												if [[ $N -gt $oldest ]];
												then
																oldest=$N
												fi
												if [[ $N -lt $youngest ]];
												then
																youngest=$N
												fi

								fi

				done

				echo "年龄最大的球员是: "$(awk -F '\t' '{if ($6~/'$oldest'/) {print $9} }' worldcupplayerinfo.tsv) ",为 "$oldest "岁"
				echo "年龄最小的球员是: "$(awk -F '\t' '{if ($6~/'$youngest'/) {print $9} }' worldcupplayerinfo.tsv) ",为 "$youngest "岁"

}

function HelpManual()
{
				echo "Usage:bash task20.sh [OPTION...]"
				echo "Options:"
				echo "-a,--age            统计不同年龄区间范围的球员数量、百分比"
				echo "-p,--position       统计不同场上位置的球员数量、百分比"
				echo "-nl,--namelength    名字最长的球员,名字最短的球员"
				echo "as,--agesize        年龄最大的球员,年龄最小的球员"
				echo "h,--help            帮助信息"

}


while [ "$1" != "" ];do
				case "$1" in
								"-a" | "--age" )
												Partition_age "worldcupplayerinfo.tsv"
												shift ;;
								"-p" | "--position" )
												Position_player "worldcupplayerinfo.tsv"
												shift ;;
								"-nl" | "--namelength" )
												Find_name "worldcupplayerinfo.tsv"
												shift ;;
								"-as"	| "--agesize" )
												Find_age "worldcupplayerinfo.tsv"
												shift ;;			 
								"-h" | "--help" )
												HelpManual
												exit 0
				esac
done
