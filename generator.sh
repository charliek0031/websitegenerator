#!/bin/bash
clear

echo "This script is a CSS and HTML Div generator"
echo "So basically it asks a few questions and you answer them."
echo "The script makes use of a CSS grid layout and makes it W3 approved"
echo ""
echo "Charlie K, 2020. No copyright."
echo ""

# Asking questions on the header of the HTML
echo "The HTML part"
echo ""
echo "Set title"
read -p ": " title
echo ""
echo "Set language: en-US, en-GB, nl, etc"
read -p ": " language
echo ""
echo "Set description"
read -p ": " description
echo ""
echo "Add keywords separated, by, comma"
read -p ": " keywords
echo ""
echo "Set Author"
read -p ": " author
echo ""

# this part starts the CSS and ends the HTML part by asking for the names you want to use.
echo "Let's make the divs now by entering the div names"
echo "Example of input: header left content right footer"
echo "The order of names influences the order of the divs in the html and css files!"
read -p ": " divs
echo ""
echo "The CSS part"
echo ""

echo "Now use those names to create the grid to show the divs"
echo "Use 'single quotes' or \"double quotes\" to separate the grid layout as you always do"
echo "example: \"header header header\" \"left content right\" \"footer footer footer\""
read -p ": " grid
echo ""

echo "Let's create the COLUMN layout"
echo "Example: 1fr 1fr 1fr"
echo "Example: 100px 40px 50px"
read -p ": " csscols
echo ""

echo "Let's create the ROW layout"
echo "Example: 1fr 1fr 1fr"
echo "Example: 100px 40px 50px"
read -p ": " cssrows
echo ""

echo "When using this CSS generation script:"
echo "- Feel free to use #000 hex or rgb(0,0,0)"
echo "- Don't end with a semicolon ;;;"
echo ""

echo "Enter font color"
read -p ": " fgcolor
echo ""
echo "Enter background-color"
read -p ": " bgcolor
echo ""
echo "Enter font family"
read -p ": " fontfamily
echo ""
echo "Enter font size: You can use em, px, etc. Just state it as you would in css"
read -p ": " fontsize
echo ""
echo "Set margin"
read -p ": " margin
echo ""
echo "Set gap between divs"
echo "Example: 3px or 1em or 6pt"
read -p ": " gap
echo ""
echo "Will you use a background image? [yes/no]"
read -p ": " qbgimg
echo ""
echo "Set background image name."
echo ""
echo "write down the name and extension: image.jpb, etc"
read -p ": " yesbgimg

clear

# write to index.html

echo "<!DOCTYPE HTML>
<html lang=\"$language\">
<head>
<title>$title</title>
<meta charset=\"UTF-8\">
<meta name=\"description\" content=\"$description\">
<meta name=\"keywords\" content=\"$keywords\">
<meta name=\"author\" content=\"$author\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
<link rel=\"icon\" href=\"/favicon.ico\" type=\"image/x-icon\" />
<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"/favicon.ico\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"site.css\">
</head>
<body>

<div class=\"grid-container\">
" >> index.html
for word in $divs; do
   echo "<div class=\"$word\">$word</div>" >> index.html
done

echo "</div>
</body>
</html>" >> index.html

# Write to site.css

echo "html,body{
	color: $fgcolor;
	background-color: $bgcolor;
	font-family: $fontfamily;
	font-size: $fontsize;
	margin: $margin;" >> site.css
case $qbgimg in  
	yes) echo "background: url($yesbgimg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;" >> site.css;;
	no) echo "" ;;
esac
echo "}
.grid-container {
	display: grid;
	grid-template-columns: $csscols;
	grid-template-rows: $cssrows;
	gap: $gap;
	grid-template-areas: "$grid";
  }" >> site.css

for word in $divs; do
    echo ".$word{grid-area: $word; border: 1px solid rgb(0,0,0);}" >> site.css
done
