//
//  Deck.h
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
@property (strong, nonatomic) NSMutableArray *cards; // of Card
- (void) addCard:(Card *) card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;
@end
