#!/bin/zsh

declare -A icon_map

while read -r line; do
  if [[ "$line" =~ \"(.*)\"\s*\|\|\s*\"(.*)\" ]]; then
    IFS='|' read -A app_names <<< "${match[0]}"
    icon_result=""
  elif [[ "$line" =~ icon_result=\"(.*)\" ]]; then
    icon_result="${match[1]}"
    for app in "${app_names[@]}"; do
      app=$(echo "$app" | xargs) # trim spaces
      icon_map["$icon_result"]+="$app,"
    done
  fi
done < plugins/icon_map_fn.sh

echo "["

first=1
for icon in "${(@k)icon_map}"; do
  apps_csv=${icon_map[$icon]%?}
  IFS=',' read -A apps <<< "$apps_csv"

  [[ $first -eq 0 ]] && echo ","
  first=0

  echo "  {"
  echo "    \"iconName\": \"${icon}\","
  echo "    \"appNames\": ["
  for i in {1..${#apps[@]}}; do
    printf "      \"%s\"%s\n" "${apps[$i]}" $([[ $i -eq ${#apps[@]} ]] && echo "" || echo ",")
  done
  echo "    ]"
  echo -n "  }"
done

echo
echo "]"
