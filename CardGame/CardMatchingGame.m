//
//  CardMatchingGame.m
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck {
    self = [super init];
    if (self) {
        for (int i = 0; i<count; i++) {
            [self.cards addObject:[deck drawRandomCard]];
        }
    }
    return self;
}

- (Card*)cardAtIndex:(NSInteger) Index {
    return self.cards[Index];
}

static const int BONUS_SCORE = 4;
static const int PENALTY_SCORE = 1;

- (void) chooseCardAtIndex:(NSInteger) index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card * otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore*BONUS_SCORE;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= PENALTY_SCORE;
                        otherCard.chosen = NO;
                    }
                    break; // only 2 choice
                }
            }
            self.score -= PENALTY_SCORE;
            card.chosen = YES;
        }
    }
    NSLog(@"A: index:%lu,chose:%d",index, card.isChosen);
}


@end
