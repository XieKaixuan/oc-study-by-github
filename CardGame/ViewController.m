//
//  ViewController.m
//  CardGame
//
//  Created by INCUBECN on 5/31/15.
//  Copyright (c) 2015 INCUBECN. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreForLabel;
@end

@implementation ViewController

- (CardMatchingGame *) game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardsButton count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}
                         
                         
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchCardsAction:(UIButton *)sender {
    int chosenButtonIndex = [self.cardsButton indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    int buttonNum = [self updateUI];
    if (buttonNum <= 2) {
        [self gameover];
    }
    NSLog(@"ChosenButtonIndex: %d", chosenButtonIndex);
}

- (int) updateUI {
    int buttonNum = 0;
    for (UIButton *button in self.cardsButton) {
        unsigned long cardButtonIndex = [self.cardsButton indexOfObject:button];
        Card * card = [self.game cardAtIndex:cardButtonIndex];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
        self.scoreForLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        if (button.enabled) {
            buttonNum++;
        }
        NSLog(@"Button:%lu,title:%@,image:%@,chose:%d",cardButtonIndex, [self titleForCard:card], [self backgroundImageForCard:card], card.isChosen);
    }
    return buttonNum;
}

- (void) gameover {
    for (UIButton *button in self.cardsButton) {
        unsigned long cardButtonIndex = [self.cardsButton indexOfObject:button];
        Card * card = [self.game cardAtIndex:cardButtonIndex];
        [button setTitle:[card contents] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"front"] forState:UIControlStateNormal];
        button.enabled = NO; //disable all buttoms.
        self.scoreForLabel.text = [NSString stringWithFormat:@"Game Over:::::::Score: %ld", (long)self.game.score];
        [self.scoreForLabel setBackgroundColor: [UIColor blueColor]];
    }
}

- (NSString *) titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
//    NSLog(@"contents %@", card.contents);
//    return card.contents;
}

- (UIImage *)backgroundImageForCard: (Card *) card {
    return [UIImage imageNamed: card.isChosen ? @"front" : @"background" ];
//    return [UIImage imageNamed:@"front"];
    
}

@end
