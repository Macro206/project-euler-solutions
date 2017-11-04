//
//  Solutions2.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 03/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "Solutions2.h"

void problem30() {
    
    int answer = 0;
    
    for (int n = 2; n < 1000000; ++n) {
        NSString *numberString = [NSString stringWithFormat:@"%i", n];
        int value = 0;
        for (int i = 0; i < numberString.length; ++i) {
            int digit = [[numberString substringWithRange:NSMakeRange(i, 1)] intValue];
            value += pow(digit, 5);
        }
        
        if (value == n) answer += n;
    }
    
    printf("Problem 30: %i\n", answer);
}


void problem31() {
    
    // Coins: 1p, 2p, 5p, 10p, 20p, 50p, £1.
    // Trying to achieve £2.
    
    int *coins = calloc(7, sizeof(int)); coins[0] = 1; coins[1] = 2; coins[2] = 5; coins[3] = 10; coins[4] = 20; coins[5] = 50; coins[6] = 100;
    
    __block int combinations = 0;
    __block int runningTotal = 0;
    
    __block void (^tryCoin)(int i) = ^(int i) {
        
        for (int n = 0; (runningTotal + (n*coins[i])) <= 200; ++n) {
            runningTotal += (n*coins[i]);
            if (i == 6) {if (runningTotal == 200) ++combinations;}
            else tryCoin(i+1);
            runningTotal -= (n*coins[i]);
        }
        
    };
    
    tryCoin(0);
    
    ++combinations; // One £2 coin
    
    printf("Problem 31: %i\n", combinations);
}


void problem32() {
    
    NSMutableArray *products = [NSMutableArray array];
    
    int productsSum = 0;
    
    for (int a = 2; a <= 9876; ++a) {
        for (int b = 1; (a*b) <= 9876; ++b) {
            int product = a * b;
            NSString *productString = [NSString stringWithFormat:@"%i%i%i", a, b, product];
            NSNumber *productNumber = [NSNumber numberWithInt:product];
            int *digitsUsed = calloc(9, sizeof(int));
            BOOL shouldContinue = YES;
            
            for (int i = 0; i < productString.length; ++i) {
                int digit = [[productString substringWithRange:NSMakeRange(i, 1)] intValue];
                if (digitsUsed[digit-1] == 1) shouldContinue = NO;
                else digitsUsed[digit-1] = 1;
            }
            
            if (shouldContinue) {
                BOOL isPandigital = YES;
                for (int j = 0; j < 9; ++j) {
                    if (digitsUsed[j] == 0) isPandigital = NO;
                }
                if (isPandigital && ![products containsObject:productNumber]) {
                    [products addObject:productNumber];
                }
            }
            
            free(digitsUsed);
        }
    }
    
    for (NSNumber *number in products) {
        productsSum += [number intValue];
    }
    
    printf("Problem 32: %i\n", productsSum);
}


void problem33() {
    int masterNumerator   = 1;
    int masterDenominator = 1;
    
    for (int n = 1; n < 99; ++n) {
        for (int d = n; d < 99; ++d) {
            Fraction fraction = {n, d};
            Fraction simplifiedFraction = simplifyFraction(fraction);
            Fraction newFraction;
            
            int n1 = n/10; int n2 = n%10;
            int d1 = d/10; int d2 = d%10;
            
            if (n1 == 0 || n2 == 0 || d1 == 0 || d2 == 0) continue;
            
            if (n1 != 0) {
                if (n1 == d1) {
                    newFraction.numerator = n2; newFraction.denominator = d2;
                    if (fractionsAreEquivalent(simplifiedFraction, newFraction) && fraction.numerator != fraction.denominator) {masterNumerator *= n; masterDenominator *= d;}
                }
                if (n1 == d2) {
                    newFraction.numerator = n2; newFraction.denominator = d1;
                    if (fractionsAreEquivalent(simplifiedFraction, newFraction) && fraction.numerator != fraction.denominator) {masterNumerator *= n; masterDenominator *= d;}
                }
            }
            if (d1 != 0) {
                if (n2 == d1) {
                    newFraction.numerator = n1; newFraction.denominator = d2;
                    if (fractionsAreEquivalent(simplifiedFraction, newFraction) && fraction.numerator != fraction.denominator) {masterNumerator *= n; masterDenominator *= d;}
                }
                if (n2 == d2) {
                    newFraction.numerator = n1; newFraction.denominator = d1;
                    if (fractionsAreEquivalent(simplifiedFraction, newFraction) && fraction.numerator != fraction.denominator) {masterNumerator *= n; masterDenominator *= d;}
                }
            }
        }
    }
    
    Fraction masterFraction; masterFraction.numerator = masterNumerator; masterFraction.denominator = masterDenominator;
    
    Fraction answerFraction = simplifyFraction(masterFraction);
    
    printf("Problem 33: %lli\n", answerFraction.denominator);
}


void problem34() {
    
    long long sum = 0;
    
    for (long long n = 3; n < 100000; ++n) {
        NSString *numberString = [NSString stringWithFormat:@"%lli", n];
        long long factorialSum = 0;
        for (int i = 0; i < numberString.length; ++i) {
            int digit = [[numberString substringWithRange:NSMakeRange(i, 1)] intValue];
            factorialSum += factorial(digit);
        }
        
        if (factorialSum == n) sum += factorialSum;
    }
    
    printf("Problem 34: %lli\n", sum);
}


void problem35() {
    
    int answer = 0;
    
    for (int n = 1; n < 1000000; ++n) {
        if (isPrime(n)) {
            if (n < 10) {
                ++answer;
                continue;
            }
            NSString *primeString = [NSString stringWithFormat:@"%i", n];
            NSMutableArray *digits = [NSMutableArray array];
            for (int i = 0; i < primeString.length; ++i) {
                [digits addObject:[primeString substringWithRange:NSMakeRange(i, 1)]];
            }
            
            BOOL isCircular = YES;
            for (int c = 0; c < (primeString.length-1); ++c) {
                NSString *digit = [digits lastObject];
                [digits removeLastObject];
                [digits insertObject:digit atIndex:0];
                NSMutableString *newString = [NSMutableString stringWithString:@""];
                for (int i = 0; i < primeString.length; ++i) {
                    [newString appendString:digits[i]];
                }
                int newValue = [newString intValue];
                if (!isPrime(newValue)) isCircular = NO;
            }
            
            if (isCircular) ++answer;
        }
    }
    
    printf("Problem 35: %i\n", answer);
}


void problem36() {
    
    int sum = 0;
    
    for (int n = 1; n < 1000000; ++n) {
        NSString *decimalString = [NSString stringWithFormat:@"%i", n];
        NSMutableString *binaryString = [NSMutableString stringWithString:@""];
        
        int m = n;
        
        while (m > 0) {
            int r = m % 2;
            [binaryString insertString:[NSString stringWithFormat:@"%i", r] atIndex:0];
            m /= 2;
        }
        
        int palindromeCount = 0;
        
        NSString *string1 = [decimalString substringToIndex:  (decimalString.length/2)];
        NSString *string2 = [decimalString substringFromIndex:(decimalString.length % 2 == 0 ? (decimalString.length/2) : (decimalString.length/2)+1)];
        if ([string1 isEqualToString:reverseString(string2)]) ++palindromeCount;
        
        string1 = [binaryString substringToIndex:  (binaryString.length/2)];
        string2 = [binaryString substringFromIndex:(binaryString.length % 2 == 0 ? (binaryString.length/2) : (binaryString.length/2)+1)];
        if ([string1 isEqualToString:reverseString(string2)]) ++palindromeCount;
        
        if (palindromeCount == 2) sum += n;
    }
    
    printf("Problem 36: %i\n", sum);
}


void problem37() {
    
    int sum = 0;
    
    for (int n = 10; n < 1000000; ++n) {
        if (!isPrime(n)) continue;
        
        BOOL isTruncatable = YES;
        
        NSString *primeString = [NSString stringWithFormat:@"%i", n];
        
        for (int i = 1; i < primeString.length; ++i) {
            int newNumber = [[primeString substringFromIndex:i] intValue];
            if (!isPrime(newNumber)) isTruncatable = NO;
        }
        
        for (int len = (int)(primeString.length-1); len > 0; --len) {
            int newNumber = [[primeString substringWithRange:NSMakeRange(0, len)] intValue];
            if (!isPrime(newNumber)) isTruncatable = NO;
        }
        
        if (isTruncatable) sum += n;
    }
    
    printf("Problem 37: %i\n", sum);
}


void problem38() {
    
    long long maxN = 0;
    
    for (long long n = 9; n < 10000; ++n) {
        
        NSMutableString *productString = [NSMutableString stringWithString:@""];
        
        for (long long c = 1; c <= 9; ++c) {
            long long product = n*c;
            [productString appendString:[NSString stringWithFormat:@"%lli", product]];
            if (productString.length == 9) {
                int *digitsUsed = calloc(9, sizeof(int));
                BOOL shouldContinue = YES;
                
                for (int i = 0; i < productString.length; ++i) {
                    int digit = [[productString substringWithRange:NSMakeRange(i, 1)] intValue];
                    if (digitsUsed[digit-1] == 1) shouldContinue = NO;
                    else digitsUsed[digit-1] = 1;
                }
                
                if (shouldContinue) {
                    BOOL isPandigital = YES;
                    for (int j = 0; j < 9; ++j) {
                        if (digitsUsed[j] == 0) isPandigital = NO;
                    }
                    if (isPandigital) {
                        long long currentN = [productString longLongValue];
                        if (currentN > maxN) {
                            maxN = currentN;
                        }
                    }
                }
                
                free(digitsUsed);
                break;
            }
            else if (productString.length > 9) break;
        }
        
    }
    
    printf("Problem 38: %lli\n", maxN);
}


void problem39() {
    
    int maxP = 0;
    int maxCount = 0;
    
    for (int p = 3; p <= 1000; ++p) {
        int count = 0;
        
        for (int b = 1; b < (p-2); ++b) {
            for (int a = 1; a <= b; ++a) {
                int c = p - a - b;
                if (c < 0) continue;
                if ((a*a) + (b*b) == (c*c)) ++count;
            }
        }
        
        if (count > maxCount) {
            maxP = p;
            maxCount = count;
        }
    }
    
    printf("Problem 39: %i\n", maxP);
}


void problem40() {
    
    NSMutableString *constantString = [NSMutableString stringWithString:@"0."];
    
    int n = 1;
    
    long long answer = 1;
    
    while (constantString.length <= 1000001) {
        [constantString appendFormat:@"%i", n];
        ++n;
    }
    
    for (int i = 1; i <= 1000000; i *= 10) {
        answer *= [[constantString substringWithRange:NSMakeRange(i+1, 1)] longLongValue];
    }
    
    printf("Problem 40: %lli\n", answer);
}


void problem41() {
    
    long long maxN = 0;
    
    for (long long n = 2; n < 10000000; ++n) {
        if (!isPrime(n)) {
            continue;
        }
        if (isPandigital(n)) {
            if (n > maxN) {
                maxN = n;
            }
        }
    }
    
    printf("Problem 41: %lli\n", maxN);
}


void problem42() {
    
    NSMutableString *rawString = [NSMutableString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/p042_words.txt" encoding:NSUTF8StringEncoding error:nil];
    [rawString replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    [rawString replaceCharactersInRange:NSMakeRange(rawString.length-1, 1) withString:@""];
    NSArray *words = [rawString componentsSeparatedByString:@"\",\""];
    
    int answer = 0;
    
    for (NSString *word in words) {
        int totalValue = 0;
        for (int i = 0; i < word.length; ++i) {
            int val = [word characterAtIndex:i] - 64;
            totalValue += val;
        }
        
        int triangleNumber = 0;
        
        for (int n = 1; n < 100; ++n) {
            triangleNumber += n;
            if (totalValue == triangleNumber) {
                ++answer;
                break;
            }
            else if (totalValue < triangleNumber) {
                break;
            }
        }
    }
    
    printf("Problem 42: %i\n", answer);
}


void problem43() {
    
    long long sum = 0;
    
    int primesArray[7] = {2, 3, 5, 7, 11, 13, 17};
    
    NSArray *initialArrangement  = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    NSArray *arrangements = permutations(initialArrangement);
    
    for (NSArray *arrangement in arrangements) {
        BOOL success = YES;
        
        for (int i = 1; i <= (arrangement.count-3); ++i) {
            NSMutableString *numberString = [NSMutableString stringWithString:@""];
            for (int j = 0; j <= 2; ++j) {
                [numberString appendString:arrangement[i+j]];
            }
            int value = [numberString intValue];
            
            if (value % primesArray[i-1] != 0) {
                success = NO;
                break;
            }
        }
        
        if (success) {
            NSMutableString *arrangementString = [NSMutableString stringWithString:@""];
            for (int i = 0; i < arrangement.count; ++i) {
                [arrangementString appendString:arrangement[i]];
            }
            sum += [arrangementString longLongValue];
        }
    }
    
    printf("Problem 43: %lli\n", sum);
}


void problem44() {
    
    long long minD = 10000000;
    
    for (long long n = 1; n < 5000; ++n) {
        for (long long m = 1; m <= n; ++m) {
            long long p1 = n*((3*n)-1)/2;
            long long p2 = m*((3*m)-1)/2;
            
            long long s = p1 + p2;
            long long d = p1 - p2;
            d = llabs(d);
            
            if (isPentagonal(s) && isPentagonal(d)) {
                long long D = llabs(p1-p2);
                if (D < minD) minD = D;
            }
        }
    }
    
    printf("Problem 44: %lli\n", minD);
}


void problem45() {
    
    long long answer = 0;
    
    long long triangularNumber = 0;
    
    for (long long n = 1; n < 1000000; ++n) {
        triangularNumber += n;
        
        if (isPentagonal(triangularNumber) && isHexagonal(triangularNumber)) answer = triangularNumber;
    }
    
    printf("Problem 45: %lli\n", answer);
}


void problem46() {
    
    long long answer = 0;
    
    NSMutableArray *primes = [NSMutableArray array];
    
    for (int n = 1; n <= 10000; ++n) {
        if (isPrime(n)) [primes addObject:[NSNumber numberWithLongLong:n]];
    }
    
    for (long long n = 2; n <= 10000; ++n) {
        if (n % 2 == 0 || isPrime(n)) continue;
        
        BOOL found = NO;
        
        for (long long i = 0; i < primes.count; ++i) {
            long long prime = [primes[i] intValue];
            for (long long s = 1; s < 1000; ++s) {
                long long value = prime + (2*(s*s));
                if (value > n) break;
                else if (value == n) found = YES;
            }
            if (found) break;
        }
        
        if (!found) {
            answer = n;
            break;
        }
    }
    
    printf("Problem 46: %lli\n", answer);
}


void problem47() {
    
    NSArray *primes = generatePrimes(200000);
    
    int problemSize = 4;
    
    int (^primeFact)(long long n) = ^int(long long n) {
        int factorCount = 0;
        
        long long workingCopy = n;
        
        for (int i = 0; i < primes.count; ++i) {
            long long prime = [primes[i] longLongValue];
            BOOL isDivisible = NO;
            while (workingCopy % prime == 0) {
                isDivisible = YES;
                workingCopy /= prime;
            }
            if (isDivisible) {
                ++factorCount;
                if (factorCount > problemSize) return 0;
                if (workingCopy == 1) break;
            }
        }
        
        return factorCount;
    };
    
    for (int n1 = 2; n1 < 200000; ++n1) {
        int n2 = n1+1;
        int n3 = n1+2;
        int n4 = n1+3;
        
        int n1Factors = primeFact(n1);
        if (n1Factors != problemSize) continue;
        int n2Factors = primeFact(n2);
        if (n2Factors != problemSize) continue;
        int n3Factors = primeFact(n3);
        if (n3Factors != problemSize) continue;
        int n4Factors = primeFact(n4);
        if (n4Factors != problemSize) continue;
        
        printf("Problem 47: %i\n", n1);
        break;
    }
}


void problem48() {
    
    NSInteger chunkSize = 10;
    
    NSString *totalChunk = @"0";
    
    for (long long n = 1; n <= 1000; ++n) {
        NSString *workingChunk = @"1";
        
        for (long long p = 1; p <= n; ++p) {
            long long previousVal = [workingChunk longLongValue];
            long long newVal = n * previousVal;
            workingChunk = [NSString stringWithFormat:@"%lli", newVal];
            if (workingChunk.length > chunkSize) {
                workingChunk = [workingChunk substringFromIndex:workingChunk.length-chunkSize];
            }
        }
        
        long long previousTotal = [totalChunk longLongValue];
        long long workingChunkVal = [workingChunk longLongValue];
        
        long long newVal = previousTotal + workingChunkVal;
        
        totalChunk = [NSString stringWithFormat:@"%lli", newVal];
        if (totalChunk.length > chunkSize) {
            totalChunk = [totalChunk substringFromIndex:totalChunk.length-chunkSize];
        }
    }
    
    printf("Problem 48: %lli\n", [totalChunk longLongValue]);
}


void problem49() {
    NSArray *primes = generatePrimes(10000);
    
    NSString *answerString = @"";
    
    BOOL (^isPermutation)(NSString *string1, NSString *string2) = ^BOOL(NSString *string1, NSString *string2) {
        BOOL result = YES;
        
        NSMutableArray *primeDigits = [NSMutableArray array];
        for (int a = 0; a < string1.length; ++a) {
            [primeDigits addObject:[string1 substringWithRange:NSMakeRange(a, 1)]];
        }
        
        for (int b = 0; b < string2.length; ++b) {
            NSString *digit = [string2 substringWithRange:NSMakeRange(b, 1)];
            if ([primeDigits containsObject:digit]) {
                int index = 0;
                for (int i = 0; i < primeDigits.count; ++i) {
                    if ([primeDigits[i] isEqualToString:digit]) index = i;
                }
                [primeDigits removeObjectAtIndex:index];
            }
            else result = NO;
        }
        
        if (primeDigits.count > 0) result = NO;
        
        return result;
    };
    
    for (int i = 0; i < (primes.count-2); ++i) {
        if ([primes[i] longLongValue] < 1000) continue;
        for (int j = i+1; j < (primes.count-1); ++j) {
            if ([primes[j] longLongValue] < 1000) continue;
            
            NSString *prime1String = [NSString stringWithFormat:@"%lli", [primes[i] longLongValue]];
            NSString *prime2String = [NSString stringWithFormat:@"%lli", [primes[j] longLongValue]];
            
            if (isPermutation(prime1String, prime2String)) {
                long long difference = [primes[j] longLongValue] - [primes[i] longLongValue];
                long long newPrime = [primes[j] longLongValue] + difference;
                if (isPrime(newPrime)) {
                    NSString *prime3String = [NSString stringWithFormat:@"%lli", newPrime];
                    if (isPermutation(prime1String, prime3String) && [primes[i] longLongValue] != 1487) {
                        answerString = [NSString stringWithFormat:@"%@%@%@", prime1String, prime2String, prime3String];
                    }
                }
            }
        }
    }
    
    printf("Problem 49: %s\n", [answerString cStringUsingEncoding:NSUTF8StringEncoding]);
}
