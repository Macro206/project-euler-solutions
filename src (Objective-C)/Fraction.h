//
//  Fraction.h
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 14/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <gmp.h>

typedef struct {
    long long numerator;
    long long denominator;
} Fraction;

Fraction makeFraction(long long n, long long d);
Fraction simplifyFraction(Fraction fraction);
Fraction reciprocal(Fraction fraction);
BOOL fractionsAreEquivalent(Fraction fraction1, Fraction fraction2);

Fraction addFractions(Fraction fraction1, Fraction fraction2);

