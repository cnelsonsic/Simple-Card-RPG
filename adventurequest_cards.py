
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

class Card(object):
	def __init__(self, name, text, cardtype, tab=0, art=None):
		self.name = name
		self.text = text
		self.tab = tab
		self.cardtype = cardtype
		self.art = art
		
	def json_encode(self):
		return self.__dict__

CARDS = []
_ = CARDS.append

#List of cards goes here:
_(Card("Fireball", "Deals 2d6 damage to a creature.", INNATE, DAMAGE))
_(Card("Mana Regen", "Regenerates 1d4 mana every turn.", TRAIT))
_(Card("Sword", "Deals 2d6 damage.", EQUIPMENT, MAINHAND))

if __name__ == "__main__":
	import json
	with open('carddata.json', 'w') as f:
		f.write(json.dumps(CARDS, default=Card.json_encode))

