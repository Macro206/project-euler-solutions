//
//  MiscFunctions.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 06/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "MiscFunctions.h"


NSString * reverseString(NSString *string) {
    NSMutableString *reverseName = [NSMutableString stringWithString:@""];
    
    for (NSInteger i = string.length - 1; i >= 0; --i) {
        [reverseName appendString:[string substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return reverseName.copy;
}


NSArray * permutations(NSArray *initialArrangement) {
    
    NSMutableArray *remaining = initialArrangement.mutableCopy;
    NSMutableArray *workingCopy  = [NSMutableArray array];
    NSMutableArray *arrangements = [NSMutableArray array];
    
    __block void (^permute)(NSMutableArray *array) = ^(NSMutableArray *array) {
        if (array.count == 2) {
            [workingCopy addObjectsFromArray:array];
            [remaining removeAllObjects];
            
            [arrangements addObject:[workingCopy copy]];
            [workingCopy exchangeObjectAtIndex:(workingCopy.count-1) withObjectAtIndex:(workingCopy.count-2)];
            [arrangements addObject:[workingCopy copy]];
            [workingCopy exchangeObjectAtIndex:(workingCopy.count-1) withObjectAtIndex:(workingCopy.count-2)];
            
            [remaining addObject:[workingCopy lastObject]];
            [workingCopy removeLastObject];
            [remaining addObject:[workingCopy lastObject]];
            [workingCopy removeLastObject];
            
        }
        else {
            for (int i = 0; i < array.count; ++i) {
                NSString *item = remaining[i];
                
                [workingCopy addObject:item];
                [remaining removeObject:item];
                permute(remaining);
                [remaining addObject:item];
                [workingCopy removeObject:item];
                
                [remaining sortUsingComparator:^NSComparisonResult(NSString *item1, NSString *item2){return [item1 compare:item2];}];
            }
        }
    };
    
    permute(remaining);
    
    return arrangements.copy;
}


BOOL isPalindrome(NSString *string) {
    if (string.length < 2) return YES;
    
    NSInteger string2Index = (string.length % 2 == 0 ? (string.length/2) : ((string.length/2) + 1));
    
    NSString *string1 = [string substringToIndex: (string.length/2)];
    NSString *string2 = [string substringFromIndex: string2Index];
    NSString *string2Reverse = reverseString(string2);
    return [string1 isEqualToString:string2Reverse];
}