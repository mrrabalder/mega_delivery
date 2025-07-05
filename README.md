# 📦 Mega Delivery

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
