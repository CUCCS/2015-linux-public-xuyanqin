#!/bin/bash

function sourcehost
{
				topHost=$(awk -F '\t' '{a[$1]++} END {for(i in a) {print a[i],i}}' "$1" | sort -nr -k1 |head -n 100)
				echo "$topHost"
}

function sourceip
{
				topIP=$(awk -F '\t' '{a[$1]++} END {for(i in a) {print a[i],i}}' "$1" | egrep "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}"| sort -nr -k1 |head -n 100)
				echo "$topIP"
}
function urltop
{
				topUrl=$(awk -F '\t' '{a[$5]++} END {for(i in a) {print a[i],i}}' "$1" | sort -nr -k1 |head -n 100)
				echo "$topUrl"
}

function response
{
				res_num=$(sed -e '1d' "$1" | awk -F '\t' '{a[$6]++;b++} END {for(i in a) {print i,a[i],a[i]/b*100 "%"}}' | column -t)
				echo "$res_num"	
}



function four_xxxcode
{
				code=$(awk -F '\t' '{print $6}' "$1" | egrep "^4[[:digit:]]{2}" | sort -u )
				for i in $code ; do 
								top=$(awk -F '\t' '{ if($6=="'$i'") {count[$5]++}} END { for(c in count) {print count[c],c}}' "$1"|sort -nr -k1 | head -n 10)
								echo "$top" 
				done
}
function url_host
{
				top=$(awk -F '\t' '{if($5=="'$2'") {count[$1]++}} END {for(c in count) {print count[c],c}}' "$1" |sort -nr -k1 |head -n 10)
				echo "$top"
}

function helpmanual
{       echo "usage: task3.sh [OPTION...]"
				echo ""
				echo " -sh)  统计访问来源主机TOP 100和分别对应出现的总次数"
				echo " -si)  统计访问来源主机TOP 100 IP和分别对应出现的总次数"
				echo " -u)   统计最频繁被访问的URL TOP 100"
				echo " -r)  统计不同响应状态码的出现次数和对应百分比"
				echo " -un)  分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
				echo " -uh <url>)  给定URL输出TOP 100访问来源主机"
				echo " -h)  帮助信息"

}

while [ "$1" != "" ]; do
				case $1 in
								-sh )                    sourcehost "web_log.tsv"
												exit
												;;
								-si )                    sourceip "web_log.tsv"
												exit
												;;
								-u )                    urltop "web_log.tsv"
												exit
												;;
								-r )                    response "web_log.tsv"
												exit
												;;
								-un )                    four_xxxcode "web_log.tsv"
												exit
												;;
								-uh )                    url_host "web_log.tsv" "$2"
												exit
												;;
								-h  )                    helpmanual
												exit
												;;
				esac
done
