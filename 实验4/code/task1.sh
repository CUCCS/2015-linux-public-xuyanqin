#!bin/bash

# --help 
function helpmanual {
				echo "Usage:	bash task_1.sh [options]"
				echo "the options:"
				echo "-d,	Type in the directory of pictures that you want to operate"
				echo "-j,	Image quality compression for jpeg format pictures"
				echo "-c,	The compression resolution of jpeg/png/svg format images is maintained on the premise of keeping the original aspect ratio."
				echo "-w	Adding custom text watermark to the picture"
				echo "-p	Add File Name Prefix"
				echo "-s	Add file name suffix"
				echo "-cv	To convert png/svg to jpeg files"
				echo "-h	Get help informaition"
}

#
function JPGCompress {                                                                                                                 
        [ -d "output" ] || mkdir output
				for img in "$1"*.jpg; do
								fullname=$(basename "$img")
								filename="${fullname%.*}"
								convert "$img" -quality "$2"% ./output/"$filename"
				done

				
}


function CompressResolution {
				[ -d "output1" ] || mkdir output1
				imgs=($(find "$1" -regex '.*\.jpg\|.svg\|.*\.png'))
				for img in "${imgs[@]}"; do
								fullname=$(basename "$img")
								filename=$(echo "$fullname" | cut -d . -f1)
								extension=$(echo "$fullname" | cut -d . -f2)
								
								convert "$img" -resize "$2" ./output1/"$filename"."$extension" 
				done
}

function addwatermark {
				[ -d "output2" ] || mkdir output2
			  imgs=($(find "$1" -regex  '.*\.jpg\|.*\.svg\|.*\.png'))
				for img in "${imgs[@]}"; do
								fullname=$(basename "$img")
								filename=$(echo "$fullname" | cut -d . -f1)
								extension=$(echo "$fullname" | cut -d . -f2)
								# 图像宽度
								width=$(identify -format %w "$img")
								# 使用composite指令添加水印
								convert -background '#0008' -fill red -gravity center \
												-size "${width}"x30 caption:"$2" "$img" +swap -gravity south \
												-composite ./output2/"$filename"."$extension"
				done


}
function addPrefix {
				[ -d "output3" ] || mkdir output3;
				for img in "$1"*.*; do
								fullname=$(basename "$img")
								filename=$(echo "$fullname" | cut -d . -f1)
								extension=$(echo "$fullname" | cut -d . -f2)
								cp "$img" ./output3/"$2""$fullname"."$extension"
				done
}
function addSuffix {
				[ -d "output4" ] || mkdir output4;
				for img in "$1"*.*; do
								fullname=$(basename "$img")
								filename=$(echo "$fullname" | cut -d . -f1)
								extension=$(echo "$fullname" | cut -d . -f2)
								cp "$img" ./output4/"$filename""$2"."$extension"
				done
}


function CvtoJPG {
				[ -d "output5" ] || mkdir output5
				imgs=($(find "$1" -regex '.*\.svg\|.*\.png'))
				for img in "${imgs[@]}";do	
								fullname=$(basename "$img")
								filename=$(echo "$fullname" | cut -d . -f1)
								convert "$img" ./output5/"$filename"".jpg"
				done
}



dir=""

if [[ "$#" -lt 1 ]]; then
				echo "You need to input something"
else 
				while [[ "$#" -ne 0 ]]; do
								case "$1" in
												"-d")
																dir="$2"
																shift 2
																;;

												"-j")
																if [[ "$2" != '' ]]; then 
																				JPGCompress "$dir" "$2"
																				shift 2
																else 
																				echo "You need to put in a quality parameter"
																fi
																;;

												"-c")
																if [[ "$2" != '' ]]; then 
																				CompressResolution "$dir" "$2"
																				shift 2
																else 
																				echo "You need to put in a resize rate"
																fi
																;;

												"-w")
																if [[ "$2" != '' ]]; then 
																				addwatermark "$dir" "$2"
																				shift 2
																else 
																				echo "You need to input a string to be embeded into pictures"
																fi
																;;

												"-p")
																if [[ "$2" != '' ]]; then 
																				addPrefix "$dir" "$2"
																				shift 2
																else 
																				echo "You need to input a prefix"
																fi
																;;

												"-s")
																if [[ "$2" != '' ]]; then 
																				addSuffix "$dir" "$2"
																				shift 2
																else 
																				echo "You need to input a suffix"
																fi
																;;

												"-cv")
																CvtoJPG "$dir"
																shift
																;;

												"-h")
																helpmanual
																shift
																;;
								esac
				done
 fi
