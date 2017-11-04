//
//  Cards.h
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 21/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Hearts, Spades, Diamonds, Clubs} Suit;

typedef struct {
    int  value;
    Suit suit;
} Card;


typedef Card PokerHand[5];


Card convertCode(NSString *code);

int evaluateHand(NSArray *hand);