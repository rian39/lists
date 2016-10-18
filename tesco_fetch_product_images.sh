#!/bin/bash
cut -f11 $1|xargs wget -P $2 
cd $2
montage  -mode concatenate -tile 40x IDShot_90x90.jpg.* ../combined_images/$2.jpg
cd ..
eog combined_images/$2.jpg
