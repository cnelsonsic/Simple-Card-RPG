
from card import Card

#Card Types:
TRAIT = 0
INNATE = 1
EQUIPMENT = 2

#Equipment Tabs:
MAINHAND = 0
OFFHAND = 1
ARMOR = 2
HELM = 3
TRINKET = 4

#Innate Tabs:
DAMAGE = 0
SUPPORT = 1

#List of cards goes here:
Card("Fireball", "Deals 2d6 damage to a creature.", INNATE, DAMAGE)
Card("Mana Regen", "Regenerates 1d4 mana every turn.", TRAIT)
Card("Sword", "Deals 2d6 damage.", EQUIPMENT, MAINHAND)

if __name__ == "__main__":
    import json
    with open('carddata.json', 'w') as f:
        f.write(json.dumps(Card.cards, default=Card.json_encode))

