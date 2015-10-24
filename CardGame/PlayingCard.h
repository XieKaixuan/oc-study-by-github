//
//  PlayingCard.h
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
+ (NSArray *) validSuit;
+ (NSInteger) maxRank;
@end
