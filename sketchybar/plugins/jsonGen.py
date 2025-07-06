import json
from collections import defaultdict

icon_map = defaultdict(list)
current_apps = []

with open("plugins/icon_map_fn.sh") as f:
    for line in f:
        line = line.strip()

        # Match case line
        if line.startswith('"') and "|" in line:
            parts = [app.strip().strip('"') for app in line.split("|")]
            current_apps = parts

        # Match icon_result line
        elif line.startswith("icon_result="):
            icon = line.split("=", 1)[1].strip().strip('"')
            for app in current_apps:
                icon_map[icon].append(app)
            current_apps = []

# Build output JSON array
result = []
for icon, apps in icon_map.items():
    result.append({
        "iconName": icon,
        "appNames": sorted(list(set(apps)))
    })

# Output to file
output_path = "/Users/mahib/.config/sketchybar/aerospace-app-font.json"
with open(output_path, "w") as out:
    json.dump(result, out, indent=2)

print(f"✅ JSON written to {output_path}")
