//
//  Solutions3.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 09/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "Solutions3.h"

void problem50() {
    NSArray *primes = generatePrimes(1000000);
    
    long long lim = 1000000;
    long long maxLength = 0;
    long long maxPrime  = 0;
    
    for (int i = 0; i < (primes.count-1); ++i) {
        long long total = [primes[i] longLongValue];
        if (total > lim) break;
        
        for (int j = (i+1); j < primes.count; ++j) {
            total += [primes[j] longLongValue];
            if (total > lim) break;
            if (isPrime(total)) {
                if ((j - i + 1) > maxLength) {
                    maxLength = (j - i + 1);
                    maxPrime  = total;
                }
            }
        }
    }
    
    printf("Problem 50: %lli\n", maxPrime);
}


void problem51() {
    NSArray *primes = generatePrimes(1000000);
    
    NSArray * (^repeatedIndices)(NSNumber *number) = ^NSArray *(NSNumber *number) {
        NSMutableArray *indices = [NSMutableArray array];
        
        NSString *numberString = [number stringValue];
        
        int *digitsTried = calloc(10, sizeof(int));
        
        for (int i = 0; i < numberString.length; ++i) {
            int digit = [[numberString substringWithRange:NSMakeRange(i, 1)] intValue];
            if (digitsTried[digit] == 1) continue;
            
            NSMutableArray *currentIndices = [NSMutableArray array];
            
            for (int j = i; j < numberString.length; ++j) {
                if ([[numberString substringWithRange:NSMakeRange(j, 1)] intValue] == digit) {
                    [currentIndices addObject:[NSNumber numberWithInt:j]];
                    digitsTried[digit] = 1;
                }
            }
            
            [indices addObject:currentIndices.copy];
        }
        
        free(digitsTried);
        
        return indices.copy;
    };
    
    
    for (NSNumber *prime in primes) {
        NSArray *repeatedI = repeatedIndices(prime);
        
        for (NSArray *indexArray in repeatedI) {
            int seriesSize = 0;
            
            int minN = [[[NSString stringWithFormat:@"%i", [prime intValue]] substringWithRange:NSMakeRange([indexArray[0] intValue], 1)] intValue];
            
            for (int n = minN; n <= 9; ++n) {
                NSMutableString *numberString = [[prime stringValue] mutableCopy];
                
                for (int i = 0; i < indexArray.count; ++i) {
                    int index = [indexArray[i] intValue];
                    [numberString replaceCharactersInRange:NSMakeRange(index, 1) withString:[NSString stringWithFormat:@"%i", n]];
                }
                
                if (isPrime([numberString intValue])) ++seriesSize;
            }
            
            if (seriesSize == 8) {
                printf("Problem 51: %i\n", [prime intValue]);
                return;
            }
        }
    }
}


void problem52() {
    
    BOOL (^isPermutation)(long long a, long long b) = ^BOOL(long long a, long long b) {
        NSString *aString = [NSString stringWithFormat:@"%lli", a];
        NSString *bString = [NSString stringWithFormat:@"%lli", b];
        
        if (aString.length != bString.length) return NO;
        
        int *aDigits = calloc(10, sizeof(int));
        int *bDigits = calloc(10, sizeof(int));
        
        for (int i = 0; i < aString.length; ++i) {
            int aDigit = [[aString substringWithRange:NSMakeRange(i, 1)] intValue];
            int bDigit = [[bString substringWithRange:NSMakeRange(i, 1)] intValue];
            aDigits[aDigit] = aDigits[aDigit] + 1;
            bDigits[bDigit] = bDigits[bDigit] + 1;
        }
        
        for (int i = 0; i < 10; ++i) {
            if (aDigits[i] != bDigits[i]) return NO;
        }
        
        free(aDigits);
        free(bDigits);
        
        return YES;
    };
    
    
    for (long long multiplier = 10; multiplier <= 1000000; multiplier *= 10) {
        for (long long n = (10*multiplier); n < (20*multiplier); ++n) {
            
            BOOL isAnswer = YES;
            
            for (long long m = 1; m <= 6; ++m) {
                if (!isPermutation(n, m*n)) isAnswer = NO;
            }
            
            if (isAnswer) {
                printf("Problem 52: %lli\n", n);
                return;
            }
        }
    }
    
}


void problem53() {
    
    BOOL (^isBeyondLimit)(int n, int r) = ^BOOL(int n, int r) {
        if (r == 0 || r == n) return NO;
        
        int n_r = n-r;
        
        int denominatorMax = (r >  n_r ? r : n_r);
        int denominatorMin = (r <= n_r ? r : n_r);
        
        int factorSize = n - denominatorMax;
        
        int *numeratorFactors = calloc(factorSize, sizeof(int));
        
        for (int i = 0; i < factorSize; ++i) {
            numeratorFactors[i] = denominatorMax + i + 1;
        }
        
        int *denominatorFactors = calloc(denominatorMin, sizeof(int));
        
        for (int i = 0; i < denominatorMin; ++i) {
            denominatorFactors[i] = i + 1;
        }
        
        for (int i = 0; i < factorSize; ++i) {
            for (int j = 0; j < denominatorMin; ++j) {
                for (int f = 2; f <= denominatorFactors[j]; ++f) {
                    if (numeratorFactors[i] % f == 0 && denominatorFactors[j] % f == 0) {
                        numeratorFactors[i]   /= f;
                        denominatorFactors[j] /= f;
                    }
                }
            }
        }
        
        long long numerator = 1;
        long long denominator = 1;
        
        int lim = (factorSize > denominatorMin ? factorSize : denominatorMin);
        
        for (int i = 0; i < lim; ++i) {
            if (i < factorSize)     numerator   *= numeratorFactors[i];
            if (i < denominatorMin) denominator *= denominatorFactors[i];
            
            if ((numerator/denominator) > 1000000) return YES;
        }
        
        return NO;
    };
    
    
    int answer = 0;
    
    for (int n = 1; n <= 100; ++n) {
        for (int r = 0; r <= n; ++r) {
            
            if (isBeyondLimit(n,r)) ++answer;
            
        }
    }
    
    printf("Problem 53: %i\n", answer);
}


void problem54() {
    
    // Solved using external poker library.
    
    int totalWins = 0;
    
    NSArray *handPairStrings = [[NSString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/p054_poker.txt" encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    
    for (NSString *string in handPairStrings) {
        NSArray *cards = [string componentsSeparatedByString:@" "];
        NSArray *player1Cards = [cards subarrayWithRange:NSMakeRange(0, 5)];
        NSArray *player2Cards = [cards subarrayWithRange:NSMakeRange(5, 5)];
        
        if (evaluateHand(player1Cards) > evaluateHand(player2Cards)) ++totalWins;
    }
    
    printf("Problem 54: %i\n", totalWins);
}


void problem55() {
    
    BigInt * (^sumOfReverse)(BigInt *n) = ^BigInt *(BigInt *n) {
        NSString *reverse = reverseString([n stringRepresentation]);
        BigInt *reverseInt = [[BigInt alloc] initWithString:reverse];
        
        return [reverseInt add:n];
    };
    
    int answer = 0;
    
    for (int n = 1; n < 10000; ++n) {
        BigInt *nInt = [[BigInt alloc] initWithString:[NSString stringWithFormat:@"%i", n]];
        
        BOOL isLychrelNumber = YES;
        
        for (int c = 1; c < 50; ++c) {
            nInt = sumOfReverse(nInt);
            if (isPalindrome([nInt stringRepresentation])) {
                isLychrelNumber = NO;
                break;
            }
        }
        
        if (isLychrelNumber) ++answer;
    }
    
    printf("Problem 55: %i\n", answer);
}


void problem56() {
    
    long long maxSum = 0;
    
    for (int a = 1; a < 100; ++a) {
        for (int b = 1; b < 100; ++b) {
            BigInt *result = [[BigInt alloc] initWithString:@"1" andChunkSize:16];
            
            for (int c = 1; c <= b; ++c) {
                result = [result multiply:a];
            }
            
            long long sum = [result digitSum];
            
            if (sum > maxSum) maxSum = sum;
        }
    }
    
    printf("Problem 56: %lli\n", maxSum);
}


void problem57() {
    
    int answer = 0;
    
    for (int iterations = 1; iterations <= 1000; ++iterations) {
        mpq_t two;
        mpq_init(two);
        mpq_set_si(two, 2, 1);
        
        mpq_t cumulativeSum;
        mpq_init(cumulativeSum);
        
        mpq_set(cumulativeSum, two);
        
        for (int c = 1; c <= (iterations-1); ++c) {
            mpq_t reciprocal;
            mpq_init(reciprocal);
            mpq_inv(reciprocal, cumulativeSum);
            mpq_add(cumulativeSum, two, reciprocal);
            mpq_clear(reciprocal);
        }
        
        mpq_t reciprocal;
        mpq_init(reciprocal);
        mpq_inv(reciprocal, cumulativeSum);
        
        mpq_t one;
        mpq_init(one);
        mpq_set_si(one, 1, 1);
        
        mpq_add(cumulativeSum, one, reciprocal);
        
        mpq_clears(reciprocal, one, two, NULL);
        
        char *string = calloc(1000, sizeof(char));
        gmp_sprintf(string, "%Qd", cumulativeSum);
        
        NSArray<NSString *> *fractionStrings = [[NSString stringWithCString:string encoding:NSUTF8StringEncoding] componentsSeparatedByString:@"/"];
        
        if (fractionStrings[0].length > fractionStrings[1].length) {
            ++answer;
        }
        
        mpq_clear(cumulativeSum);
    }
    
    printf("Problem 57: %i\n", answer);
}


void problem58() {
    
    NSMutableArray *diagonalValues = [NSMutableArray array];
    
    long long size = 100001;
    
    long double count = 0;
    long double total = 0;
    
    long long layer = 3;
    for (long long n = 1; n <= pow(size, 2); n += (layer-1)) {
        
        [diagonalValues addObject:[NSNumber numberWithLongLong:n]];
        
        if (n == pow(layer, 2)) {
            layer += 2;
            for (NSNumber *value in diagonalValues) {
                if (isPrime([value longLongValue])) ++count;
                ++total;
            }
            
            [diagonalValues removeAllObjects];
            
            long double ratio = count/total;
            
            if (ratio < 0.1) {
                printf("Problem 58: %lli\n", (layer-2));
                return;
            }
        }
    }
    
}


void problem59() {
    
    NSString *codesString = [NSString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/p059_cipher.txt" encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *codes = [codesString componentsSeparatedByString:@","];
    
    NSArray *groupedCodes = @[[NSMutableArray array], [NSMutableArray array], [NSMutableArray array]];
    
    for (int i = 0; i < codes.count; ++i) {
        int index = i % 3;
        
        [groupedCodes[index] addObject:codes[i]];
    }
    
    NSArray *groupedCodeFrequencies = @[[NSMutableArray array], [NSMutableArray array], [NSMutableArray array]];
    
    for (int n = 0; n < 3; ++n) {
        for (int i = 0; i < 128; ++i) {
            [groupedCodeFrequencies[n] addObject:[NSNumber numberWithInt:0]];
        }
    }
    
    for (int n = 0; n < 3; ++n) {
        for (int i = 0; i < [groupedCodes[n] count]; ++i) {
            int index = [groupedCodes[n][i] intValue];
            int val = [groupedCodeFrequencies[n][index] intValue] + 1;
            groupedCodeFrequencies[n][index] = [NSNumber numberWithInt:val];
        }
    }
    
    NSMutableArray *maxCodes = [NSMutableArray array];
    
    for (int n = 0; n < 3; ++n) {
        int maxFrequency = 0;
        int maxCode = 0;
        for (int i = 0; i < 128; ++i) {
            int val = [groupedCodeFrequencies[n][i] intValue];
            if (val > maxFrequency) {
                maxFrequency = val;
                maxCode = i;
            }
        }
        
        [maxCodes addObject:[NSNumber numberWithInt:maxCode]];
    }
    
    NSMutableString *key = [NSMutableString stringWithString:@""];
    
    for (int n = 0; n < 3; ++n) {
        for (int c = 'a'; c <= 'z'; ++c) {
            int val = [maxCodes[n] intValue];
            
            if ((val ^ c) == ' ') {
                [key appendFormat:@"%c", c];
            }
        }
    }
    
    NSMutableString *messageString = [NSMutableString stringWithString:@""];
    
    for (int i = 0; i < codes.count; ++i) {
        int code = [codes[i] intValue];
        int index = i % (key.length);
        int keyVal = [key characterAtIndex:index];
        
        char nextChar = code ^ keyVal;
        
        [messageString appendFormat:@"%c", nextChar];
    }
    
    long long sum = 0;
    
    for (int i = 0; i < messageString.length; ++i) {
        sum += [messageString characterAtIndex:i];
    }
    
    printf("Problem 59: %lli\n", sum);
}


void problem60() {
    
    NSArray *primes = generatePrimes(9000);
    
    int setSize = 5;
    
    NSMutableArray *set = [NSMutableArray array];
    
    NSMutableArray *possibleSets = [NSMutableArray array];
    
    __block void (^combinations)(int i, int startIndex) = ^(int i, int startIndex) {
        if (set.count <= i) [set addObject:[NSNumber numberWithInt:0]];
        
        for (int index = startIndex; index < (primes.count - setSize + i + 1); ++index) {
            set[i] = primes[index];
            
            if (set.count > 1) {
                BOOL satisfiesConstraints = YES;
                
                for (int j = 0; j < i; ++j) {
                    long long testVal = [[NSString stringWithFormat:@"%i%i", [set[i] intValue], [set[j] intValue]] longLongValue];
                    if (!isPrime(testVal)) {
                        satisfiesConstraints = NO;
                        break;
                    }
                    testVal = [[NSString stringWithFormat:@"%i%i", [set[j] intValue], [set[i] intValue]] longLongValue];
                    if (!isPrime(testVal)) {
                        satisfiesConstraints = NO;
                        break;
                    }
                }
                
                if (!satisfiesConstraints) continue;
            }
            
            if (set.count == setSize) [possibleSets addObject:set.copy];
            else combinations(i + 1, index + 1);
        }
        
        [set removeLastObject];
    };
    
    
    combinations(0, 0);
    
    int minSum = 1000000;
    
    NSArray *answerSet;
    
    for (NSArray *possibleSet in possibleSets) {
        int sum = 0;
        
        for (int i = 0; i < setSize; ++i) {
            sum += [possibleSet[i] intValue];
        }
        
        if (sum < minSum) {
            minSum = sum;
            answerSet = possibleSet;
        }
    }
    
    printf("Problem 60: %i\n", minSum);
}