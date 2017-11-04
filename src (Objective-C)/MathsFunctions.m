//
//  MathsFunctions.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 02/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "MathsFunctions.h"


BOOL isPrime(long long n) {
    if (n <= 0) return NO;
    if (n == 1) return NO;
    if (n == 2) return YES;
    
    BOOL result = YES;
    
    for (int i = 3; i <= sqrtl(n); i += 2) {
        if (n % i == 0) {
            result = NO;
            break;
        }
    }
    
    return result;
}

NSArray * primeNumbers() {
    NSString *fileString = [NSString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/primes.txt" encoding:NSUTF8StringEncoding error:nil];
    NSArray *primeStrings = [fileString componentsSeparatedByString:@", "];
    
    NSMutableArray *primes = [NSMutableArray array];
    
    for (NSString *string in primeStrings) {
        long long value = [string longLongValue];
        [primes addObject:[NSNumber numberWithLongLong:value]];
    }
    
    return primes.copy;
}

NSArray * primeNumbers_10000() {
    NSString *fileString = [NSString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/primes_10000.txt" encoding:NSUTF8StringEncoding error:nil];
    NSArray *primeStrings = [fileString componentsSeparatedByString:@", "];
    
    NSMutableArray *primes = [NSMutableArray array];
    
    for (NSString *string in primeStrings) {
        long long value = [string longLongValue];
        [primes addObject:[NSNumber numberWithLongLong:value]];
    }
    
    return primes.copy;
}

NSArray * generatePrimes(long long n) {
    long long *integers = calloc((n-1), sizeof(long long));
    
    NSMutableArray *primes = [NSMutableArray array];
    
    for (long long i = 2; i <= n; ++i) {
        integers[i-2] = i;
    }
    
    for (int i = 0; i < (n-1); ++i) {
        if (integers[i] == 0) continue;
        long long val = integers[i];
        for (int j = 0; (i+(j*val)) < (n-1); ++j) {
            integers[i+(j*val)] = 0;
        }
        [primes addObject:[NSNumber numberWithLongLong:val]];
    }
    
    free(integers);
    
    return primes.mutableCopy;
}

NSString * primeFactorisation(long long a, long long b) {
    NSArray *primes = generatePrimes(a);
    
    long long n = a;
    
    NSMutableString *primeFactorisation = [NSMutableString stringWithString:@""];
    
    long long lastFactor = 1;
    long long factorCount = 0;
    
    while (n != 1) {
        for (int i = 0; i < primes.count && n >= [primes[i] longLongValue]; ++i) {
            long long factor = [primes[i] longLongValue];
            
            if (n % factor == 0) {
                if (lastFactor == 1) {
                    lastFactor = factor;
                    factorCount = 1;
                    [primeFactorisation appendFormat:@"%lli", factor];
                    n /= factor;
                }
                else if (factor != lastFactor) {
                    [primeFactorisation appendFormat:@"^%llix", (b*factorCount)];
                    lastFactor = factor;
                    factorCount = 1;
                    [primeFactorisation appendFormat:@"%lli", factor];
                    n /= factor;
                }
                else {
                    n /= factor;
                    ++factorCount;
                }
                
                break;
            }
        }
    }
    
    [primeFactorisation appendFormat:@"^%lli", (b*factorCount)];
    
    return primeFactorisation.copy;
}

NSArray * primeFactors(long long n) {
    NSMutableArray *factors = [NSMutableArray array];
    NSString *factorisation = primeFactorisation(n, 1);
    NSArray *factorPairs = [factorisation componentsSeparatedByString:@"x"];
    
    for (NSString *factor in factorPairs) {
        NSArray *pair = [factor componentsSeparatedByString:@"^"];
        long long value = [pair[0] longLongValue];
        long long power = [pair[1] longLongValue];
        
        for (int i = 0; i < power; ++i) {
            [factors addObject:[NSNumber numberWithLongLong:value]];
        }
    }
    
    return factors.copy;
}


long long factorial(long long n) {
    long long answer = 1;
    
    for (long long c = 1; c <= n; ++c) {
        answer *= c;
    }
    
    return answer;
}


BOOL isPandigital(long long n) {
    NSString *numberString = [NSString stringWithFormat:@"%lli", n];
    
    NSInteger len = numberString.length;
    
    if (len > 9) return NO;
    
    BOOL isPandigital = NO;
    
    int *digitsUsed = calloc(len, sizeof(int));
    BOOL shouldContinue = YES;
    
    for (int i = 0; i < len; ++i) {
        int digit = [[numberString substringWithRange:NSMakeRange(i, 1)] intValue];
        if (digit > len) {
            free(digitsUsed);
            return NO;
        }
        if (digitsUsed[digit-1] == 1) shouldContinue = NO;
        else digitsUsed[digit-1] = 1;
    }
    
    if (shouldContinue) {
        isPandigital = YES;
        for (int j = 0; j < len; ++j) {
            if (digitsUsed[j] == 0) isPandigital = NO;
        }
    }
    
    free(digitsUsed);
    
    return isPandigital;
}

BOOL isPentagonal(long long n) {
    BOOL result = NO;
    
    double a = 1.5, b = -0.5, c = -n;
    
    double discriminant = (pow(b, 2) - (4*a*c));
    
    if (discriminant >= 0) {
        double solution1 = (-b + sqrt(discriminant))/(2*a);
        double solution2 = (-b - sqrt(discriminant))/(2*a);
        
        if ((solution1 > 0 && floor(solution1) == solution1) ||  (solution2 > 0 && floor(solution2) == solution2)) result = YES;
    }
    
    return result;
}

BOOL isHexagonal(long long n) {
    BOOL result = NO;
    
    double a = 2, b = -1, c = -n;
    
    double discriminant = (pow(b, 2) - (4*a*c));
    
    if (discriminant >= 0) {
        double solution1 = (-b + sqrt(discriminant))/(2*a);
        double solution2 = (-b - sqrt(discriminant))/(2*a);
        
        if ((solution1 > 0 && floor(solution1) == solution1) ||  (solution2 > 0 && floor(solution2) == solution2)) result = YES;
    }
    
    return result;
}


long long nCr(int n, int r) {
    if (r == 0 || r == n) return 1;
    
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
    }
    
    return numerator / denominator;
}


long long hcf(long long n1, long long n2) {
    long long tmp;
    
    n1 = llabs(n1);
    n2 = llabs(n2);
    
    while (n1 > 0) {
        tmp = n1;
        n1 = n2 % n1;
        n2 = tmp;
    }
    
    return n2;
}