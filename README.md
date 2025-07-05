# 📦 Mega Delivery

Ett lättanvänt leveransuppdrag för FiveM där spelare får ett uppdrag från en NPC, hämtar ett paket från en slumpad plats och levererar tillbaka det för att få en belöning i form av pengar eller items.

## ✨ Funktioner
- NPC-interaktion med `ox_target` (eller annat system)
- Uppdrag i tre steg: starta → hämta → leverera tillbaka
- Slumpmässiga leveransplatser
- Belöning i form av pengar eller items
- Stöd för `ox_lib` och `qb-core`
- Valbar blip för NPC via `config.lua`
- Fullt konfigurerbart

## 🧰 Krav
- `qb-core`
- `ox_lib`
- `ox_target` eller annat interaktionssystem
- Ett inventorysystem som stödjer `inventory:client:ItemBox` (t.ex. lj-inventory, qb-inventory, ox_inventory)

## ⚙️ Installation
1. Klona eller ladda ner detta till din `resources`-mapp:
   ```bash
   git clone https://github.com/mrrabalder/mega_delivery.git
   ```

2. Lägg till i `server.cfg`:
   ```
   ensure mega_delivery
   ```

3. Se till att alla beroenden är installerade och konfigurerade.

4. Restarta servern – klart!

## 🔧 Konfiguration
Konfiguration sker i `config.lua`, där du kan justera:
- NPC-modell och position
- Platser för hämtning och leverans
- Typ av belöning (pengar, item, slumpad)
- Belopp/item och hur ofta det ges
- Visa eller gömma blip på kartan
