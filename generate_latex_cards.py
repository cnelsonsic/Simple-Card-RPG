
INNATETABS = 8
EQUIPTABS = 5

#Card Types:
from adventurequest_cards import TRAIT, INNATE, EQUIPMENT

import json
import re

from mako.template import Template

def clean_name(name):
	pattern = re.compile('[\W_]+')
	return pattern.sub('', name)

def generate_trait(name, bodytext, art):
	'''Generates a card with no tabs, but with a name and body text.'''
	return generate_card('template.mako', {'bottomtabs':False, 'righttabs':False, 
		'numtabs':None, 'activetab':0, 'name':name, 'body_text':bodytext, 'art':art})

def generate_innate(name, bodytext, art, tabnum):
	'''Generates a card with 8 tabs on the right, a name, body text and art.'''
	
	return generate_card('template.mako', {'bottomtabs':False, 'righttabs':True, 
		'numtabs':INNATETABS, 'activetab':tabnum, 'name':name, 'art':art, 'body_text':bodytext})

def generate_equipment(name, bodytext, art, tabnum):
	'''Generates a card with 5 tabs on the bottom, a name, body text and art.'''
	
	return generate_card('template.mako', {'bottomtabs':True, 'righttabs':False, 
		'numtabs':EQUIPTABS, 'activetab':tabnum, 'name':name, 'art':art, 'body_text':bodytext})

def generate_card(template, card_data):
	'''This function reads a given template and fills it with the given data. 
	This is returned as a string.'''
	return Template(filename=template).render(**card_data)

def main():
	with open("carddata.json", "r") as f:
		carddata = json.loads(f.read())
		
	for c in carddata:
		cleanname = clean_name(c['name'])
		
		with open("cards/%s.tex" % cleanname, "w") as f:
			if c['cardtype'] == EQUIPMENT:
				card = generate_equipment(c['name'], c['text'], c['art'], c['tab'])
			elif c['cardtype'] == INNATE:
				card = generate_innate(c['name'], c['text'], c['art'], c['tab'])
			elif c['cardtype'] == TRAIT:
				card = generate_trait(c['name'], c['text'], c['art'])
			else:
				card = generate_trait(c['name'], c['text'], c['art'])
				
			f.write(card)
		
if __name__ == "__main__":
	main()
