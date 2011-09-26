
class Card(object):
    cards = []
    def __init__(self, name, text, cardtype, tab=0, art=None):
        Card.cards.append(self)
        self.name = name
        self.text = text
        self.tab = tab
        self.cardtype = cardtype
        self.art = art

        
    def json_encode(self):
        return self.__dict__


