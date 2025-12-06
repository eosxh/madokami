#!/usr/bin/env bash

WALLDIR="/home/max/.config/hypr/wallpapers/nord"

# swww servisini başlat (hata varsa gizle)
swww init 2>/dev/null

# Rastgele bir duvar kağıdı seç
WALL=$(find "$WALLDIR" -type f | shuf -n 1)

# Duvar kağıdını uygula ve soldan sağa kayma animasyonu ekle
swww img "$WALL" --transition-type=slide --transition-direction=right --transition-step=90 --transition-fps=60
