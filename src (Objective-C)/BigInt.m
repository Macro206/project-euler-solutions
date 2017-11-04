//
//  BigInt.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 01/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "BigInt.h"

@interface BigInt ()

@property (strong, nonatomic) NSMutableArray *chunks;
@property (strong, nonatomic) NSMutableArray *carry;

@end

@implementation BigInt

@synthesize chunks, carry, debugFlag, chunkSize;

- (id)initWithString:(NSString *)numberString
{
    return [self initWithString:numberString andChunkSize:DEFAULT_CHUNK_SIZE];
}

- (id)initWithString:(NSString *)numberString andChunkSize:(int)theChunkSize
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    chunkSize = theChunkSize;
    
    chunks = [NSMutableArray array];
    carry  = [NSMutableArray array];
    
    NSMutableString *workingString = numberString.mutableCopy;
    
    while (workingString.length > chunkSize) {
        NSInteger index = workingString.length-chunkSize;
        NSString *chunkString = [workingString substringFromIndex:index];
        [chunks addObject:chunkString];
        [carry  addObject:@"0"];
        [workingString deleteCharactersInRange:NSMakeRange(index, chunkSize)];
    }
    
    if (workingString.length > 0) {
        [chunks addObject:workingString.copy];
        [carry  addObject:@"0"];
    }
    
    return self;
}

- (BOOL)isGreaterThan:(BigInt *)otherInt
{
    if      (self.chunks.count > otherInt.chunks.count) return YES;
    else if (self.chunks.count < otherInt.chunks.count) return NO;
    else {
        if ([self.chunks.lastObject longLongValue] > [otherInt.chunks.lastObject longLongValue]) {
            return YES;
        }
        else {
            return NO;
        }
    }
    
}

- (BigInt *)add:(BigInt *)otherInt
{
    BigInt *greaterInt;
    BigInt *smallerInt;
    
    if ([self isGreaterThan:otherInt]) {
        greaterInt = self;
        smallerInt = otherInt;
    }
    else {
        smallerInt = self;
        greaterInt = otherInt;
    }
    
    BigInt *answerInt = greaterInt.copy;
    
    for (int i = 0; i < smallerInt.chunks.count; ++i) {
        long long n_1 = [smallerInt.chunks[i] longLongValue];
        long long n_2 = [answerInt.chunks[i]  longLongValue];
        long long n_answer = n_1 + n_2;
        
        NSString *numberString = [NSString stringWithFormat:@"%lli", n_answer];
        if (numberString.length <= chunkSize) {
            answerInt.chunks[i] = numberString;
        }
        else {
            answerInt.chunks[i] = [numberString substringFromIndex:(numberString.length-chunkSize)];
            NSString *digits = [numberString substringWithRange:NSMakeRange(0, numberString.length-chunkSize)];
            if (i == answerInt.chunks.count-1) {
                [answerInt.chunks addObject:digits];
                [answerInt.carry  addObject:@"0"];
                break;
            }
            else {
                answerInt.carry[i+1] = digits;
            }
        }
    }
    
    for (int i = 0; i < answerInt.chunks.count; ++i) {
        long long chunkValue = [answerInt.chunks[i] longLongValue];
        long long carryValue = [answerInt.carry[i]  longLongValue];
        
        chunkValue += carryValue;
        NSString *numberString = [NSString stringWithFormat:@"%lli", chunkValue];
        
        answerInt.chunks[i] = numberString;
        answerInt.carry[i]  = @"0";
    }
    
    if (debugFlag) {
        for (int i = 0; i < answerInt.chunks.count; ++i) {
            if ([answerInt.chunks[i] length] > chunkSize) {
                NSLog(@"Error: chunk overflow");
            }
        }
    }
    
    return answerInt;
}

- (BigInt *)multiply:(int)n
{
    BigInt *answerInt = self.copy;
    
    for (int i = 0; i < self.chunks.count; ++i) {
        long long n_answer = [self.chunks[i] longLongValue] * n;
        
        NSString *numberString = [NSString stringWithFormat:@"%lli", n_answer];
        if (numberString.length <= chunkSize) {
            answerInt.chunks[i] = numberString;
        }
        else {
            answerInt.chunks[i] = [numberString substringFromIndex:(numberString.length-chunkSize)];
            NSString *digits = [numberString substringWithRange:NSMakeRange(0, numberString.length-chunkSize)];
            if (i == answerInt.chunks.count-1) {
                [answerInt.chunks addObject:digits];
                [answerInt.carry  addObject:@"0"];
                break;
            }
            else {
                answerInt.carry[i+1] = digits;
            }
        }
    }
    
    for (int i = 0; i < answerInt.chunks.count; ++i) {
        long long chunkValue = [answerInt.chunks[i] longLongValue];
        long long carryValue = [answerInt.carry[i]  longLongValue];
        
        chunkValue += carryValue;
        NSString *numberString = [NSString stringWithFormat:@"%lli", chunkValue];
        
        answerInt.chunks[i] = numberString;
        answerInt.carry[i]  = @"0";
    }
    
    if (debugFlag) {
        for (int i = 0; i < answerInt.chunks.count; ++i) {
            if ([answerInt.chunks[i] length] > chunkSize) {
                NSLog(@"Error: chunk overflow");
            }
        }
    }
    
    return answerInt;
}

- (void)print
{
    for (NSInteger i = (chunks.count - 1); i >= 0; --i) {
        printf("%lli", [chunks[i] longLongValue]);
        if (i != 0) {
            printf("-");
        }
    }
    printf("\n");
}

- (NSInteger)numberOfDigits
{
    NSMutableString *stringRepresentation = [NSMutableString string];
    
    for (NSInteger i = (chunks.count - 1); i >= 0; --i) {
        if (i == chunks.count - 1) [stringRepresentation appendFormat:   @"%lli", [chunks[i] longLongValue]];
        else                       [stringRepresentation appendFormat:@"%017lli", [chunks[i] longLongValue]];
    }
    
    return stringRepresentation.length;
}

- (NSString *)stringRepresentation
{
    NSMutableString *stringRepresentation = [NSMutableString string];
    
    for (NSInteger i = (chunks.count - 1); i >= 0; --i) {
        if (i == chunks.count - 1) [stringRepresentation appendFormat:   @"%lli", [chunks[i] longLongValue]];
        else                       [stringRepresentation appendFormat:@"%017lli", [chunks[i] longLongValue]];
    }
    
    return stringRepresentation;
}

- (long long)digitSum
{
    long long sum = 0;
    
    for (NSString *chunk in chunks) {
        for (int i = 0; i < chunk.length; ++i) {
            sum += [[chunk substringWithRange:NSMakeRange(i, 1)] longLongValue];
        }
    }
    
    return sum;
}

- (id)copy
{
    BigInt *copy = [[BigInt alloc] init];
    copy.chunks = [NSMutableArray array];
    copy.carry  = [NSMutableArray array];
    
    copy.chunkSize = self.chunkSize;
    
    for (int i = 0; i < self.chunks.count; ++i) {
        [copy.chunks addObject:[(NSString *)self.chunks[i] copy]];
        [copy.carry  addObject:[(NSString *)self.carry[i]  copy]];
    }
    
    return copy;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self.copy;
}

- (void)dealloc
{
    [chunks removeAllObjects];
    [carry  removeAllObjects];
    
    chunks = nil;
    carry  = nil;
}

@end
