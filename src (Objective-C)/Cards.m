//
//  Cards.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 21/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "Cards.h"

#include "poker_defs.h"

#include "inlines/eval.h"
#include "inlines/eval_low.h"

Card convertCode(NSString *code) {
    Card newCard;
    
    char char1 = [code characterAtIndex:0];
    char char2 = [code characterAtIndex:1];
    
    switch (char1) {
        case 'T':
            newCard.value = 10;
            break;
        
        case 'J':
            newCard.value = 11;
            break;
            
        case 'Q':
            newCard.value = 12;
            break;
            
        case 'K':
            newCard.value = 13;
            break;
            
        case 'A':
            newCard.value = 14;
            break;
            
        default:
            newCard.value = char1 - 48;
            break;
    }
    
    switch (char2) {
        case 'H':
            newCard.suit = Hearts;
            break;
            
        case 'S':
            newCard.suit = Spades;
            break;
            
        case 'D':
            newCard.suit = Diamonds;
            break;
            
        case 'C':
            newCard.suit = Clubs;
            break;
            
        default:
            break;
    }
    
    return newCard;
}


int evaluateHand(NSArray *hand) {
    CardMask cards;
    
    CardMask_RESET(cards);
    
    int i, c, n = 0;
    
    for (i = 0; i < 5; ++i) {
        char *cardString = [hand[i] cStringUsingEncoding:NSUTF8StringEncoding];
        Deck_stringToCard(cardString, &c);
        if (!CardMask_CARD_IS_SET(cards, c)) {
            CardMask_SET(cards, c);
            ++n;
        };
    }
    
    return Hand_EVAL_N(cards, n);
}

