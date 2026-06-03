#!/bin/bash

# URL fija del ejercicio
URL="https://www.abt-sportsline.es/"

# Palabra a buscar (parámetro)
if [ -z "$1" ]; then
  echo "Uso: $0 palabra"
  exit 1
fi

PALABRA="$1"
FICHERO="pagina.html"

# Descargar la web
curl -s "$URL" -o "$FICHERO"

# Buscar ocurrencias (sin distinguir mayúsculas/minúsculas)
OCURRENCIAS=$(grep -oi "$PALABRA" "$FICHERO" | wc -l)

if [ "$OCURRENCIAS" -eq 0 ]; then
  echo "> No se ha encontrado la palabra \"$PALABRA\""
else
  echo "> La palabra \"$PALABRA\" aparece $OCURRENCIAS veces"

  # Primera aparición con número de línea
  LINEA=$(grep -ni "$PALABRA" "$FICHERO" | head -n 1 | cut -d: -f1)

  echo "> Aparece por primera vez en la línea $LINEA"
fi