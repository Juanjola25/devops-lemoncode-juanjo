#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "> Se necesitan únicamente dos parámetros para ejecutar este script"
  exit 1
fi

# Parámetros
URL="$1"
PALABRA="$2"

FICHERO="pagina.html"

# Descargar la web
curl -s "$URL" -o "$FICHERO"

# Buscar ocurrencias
OCURRENCIAS=$(grep -oi "$PALABRA" "$FICHERO" | wc -l)

if [ "$OCURRENCIAS" -eq 0 ]; then

  echo "> No se ha encontrado la palabra \"$PALABRA\""

else

  # Obtener primera línea
  LINEA=$(grep -ni "$PALABRA" "$FICHERO" | head -n 1 | cut -d: -f1)

  if [ "$OCURRENCIAS" -eq 1 ]; then

    echo "> La palabra \"$PALABRA\" aparece 1 vez"
    echo "> Aparece únicamente en la línea $LINEA"

  else

    echo "> La palabra \"$PALABRA\" aparece $OCURRENCIAS veces"
    echo "> Aparece por primera vez en la línea $LINEA"

  fi

fi
