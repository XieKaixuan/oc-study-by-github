//
//  PlayingCard.m
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;
- (NSString *) contents {
    NSArray *rankString = [PlayingCard rankString];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) validSuit {
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

+ (NSArray *) rankString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSInteger) maxRank {
    NSArray *rankString = [PlayingCard rankString];
    return [rankString count] - 1;
}

- (void) setRank:(NSInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

- (int) match: (NSArray *) otherCards {
    int score = 0;
    PlayingCard * otherCard = [otherCards firstObject];
    if ([otherCard.suit isEqualToString: self.suit]) {
        score = 1;
    } else if (otherCard.rank == self.rank ) {
        score = 4;
    }
    return score;
}

@end
