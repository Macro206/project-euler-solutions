//
//  BigInt.h
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 01/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_CHUNK_SIZE 17


@interface BigInt : NSObject <NSCopying>

@property (nonatomic) BOOL debugFlag;
@property (nonatomic) int  chunkSize;

- (id)initWithString:(NSString *)numberString;
- (id)initWithString:(NSString *)numberString andChunkSize:(int)theChunkSize;


- (BOOL)isGreaterThan:(BigInt *)otherInt;

- (BigInt *)add:(BigInt *)otherInt;
- (BigInt *)multiply:(int)n;

- (void)print;
- (NSInteger)numberOfDigits;
- (NSString *)stringRepresentation;
- (long long)digitSum;

@end
