# 📦 ENKEL Delivery

Ett lättanvänt leveransuppdrag för FiveM där spelare får ett uppdrag från en NPC, hämtar ett paket från en plats och återvänder för att lämna det.

## 🛠 Funktioner
- NPC-interaktion för att starta uppdrag
- Hämtning och leverans av paket med prop
- Slumpmässiga leveransplatser
- Belöning i form av pengar eller items
- Stöd för `ox_lib` och `qb-core`
- Inställningar i `config.lua`
- Valbar blip för NPC på kartan

## ❗️Krav
- `qb-core`
- `ox_lib`
- `ox_target` (eller liknande interaktionssystem)
- Ett inventorysystem som stödjer `inventory:client:ItemBox`

## ⚙️ Installation
1. Klona eller ladda ner detta till din `resources`-mapp:
   ```bash
   git clone https://github.com/mrrabalder/mega_delivery.git
   ```

2. Lägg till i `server.cfg`:
   ```cfg
   ensure mega_delivery
   ```

3. Starta om servern – klart!


ENG

# 📦  Simple Delivery

A simple delivery mission for FiveM where players receive a mission from an NPC, pick up a package from a location, and return to drop it off.

## 🛠 Features
- NPC interaction to start quests
- Pick up and deliver packages with props
- Random delivery locations
- Reward in the form of money or items
- Support for `ox_lib` and `qb-core`
- Settings in `config.lua`
- Selectable blip for NPCs on the map

## ❗️Requirements
- `qb-core`
- `ox_lib`
- `ox_target` (or similar interaction system)
- An inventory system that supports `inventory:client:ItemBox`

## ⚙️ Installation
1. Clone or download this to your `resources` folder:
```bash
git clone https://github.com/mrrabalder/mega_delivery.git
```

2. Add to `server.cfg`:
```cfg
ensure mega_delivery
```

3. Restart the server – done!
