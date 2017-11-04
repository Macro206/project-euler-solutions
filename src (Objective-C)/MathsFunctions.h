//
//  MathsFunctions.h
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 02/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

BOOL isPrime(long long n);
NSArray * primeNumbers();
NSArray * primeNumbers_10000();
NSArray * generatePrimes(long long n);
NSString * primeFactorisation(long long a, long long b);
NSArray * primeFactors(long long n);

long long factorial(long long n);

BOOL isPandigital(long long n);
BOOL isPentagonal(long long n);
BOOL isHexagonal (long long n);

long long nCr(int n, int r);

long long hcf(long long n1, long long n2);