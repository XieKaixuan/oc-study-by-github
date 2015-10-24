//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuit]) {
            for (NSInteger rank  = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
