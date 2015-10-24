//
//  Deck.m
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void) addCard:(Card *) card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}
- (void) addCard:(Card *)card {
    [self.cards addObject:card];
}

- (Card *) drawRandomCard {
    Card * randCard = [[Card alloc] init];
    unsigned index = arc4random() % [self.cards count];
    randCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    return randCard;
}

@end
