#!/bin/sh

if [ -z "$INPUT" ]; then
  printf "Looking into /pgs directory\n"
  for sub in /pgs/*.sup; do
    printf "Converting $sub\n"
    LANGUAGE=$(echo "$sub" | cut -d. -f2)
    FILE=$(basename "$sub")
    dotnet /app/PgsToSrt.dll --tesseractdata /tessdata --tesseractlanguage "$LANGUAGE" --input /pgs/"$FILE"
  done
else
  dotnet /app/PgsToSrt.dll --tesseractdata /tessdata --tesseractlanguage "$LANGUAGE" --input "$INPUT" --output "$OUTPUT"
fi