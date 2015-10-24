//
//  CardMatchingGame.h
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;
- (void) chooseCardAtIndex:(NSInteger) index;
- (Card*)cardAtIndex:(NSInteger) Index;
@property (nonatomic, readonly) NSInteger score;

@end
