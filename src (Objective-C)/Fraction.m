//
//  Fraction.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 14/03/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "Fraction.h"
#import "MathsFunctions.h"

Fraction makeFraction(long long n, long long d) {
    Fraction newFraction;
    newFraction.numerator   = n;
    newFraction.denominator = d;
    
    return newFraction;
}

Fraction simplifyFraction(Fraction fraction) {
    Fraction newFraction = {fraction.numerator, fraction.denominator};
    
    if (newFraction.numerator == 1 || newFraction.denominator == 1) return newFraction;
    
    long long factor = hcf(newFraction.numerator, newFraction.denominator);
    
    newFraction.numerator   /= factor;
    newFraction.denominator /= factor;
    
    return newFraction;
}

Fraction reciprocal(Fraction fraction) {
    Fraction newFraction;
    newFraction.numerator   = fraction.denominator;
    newFraction.denominator = fraction.numerator;
    
    return newFraction;
}

BOOL fractionsAreEquivalent(Fraction fraction1, Fraction fraction2) {
    Fraction fraction3 = simplifyFraction(fraction1);
    Fraction fraction4 = simplifyFraction(fraction2);
    
    if (fraction3.numerator == fraction4.numerator && fraction3.denominator == fraction4.denominator) return YES;
    else return NO;
}


Fraction addFractions(Fraction fraction1, Fraction fraction2) {
    Fraction newFraction;
    
    newFraction.numerator = (fraction1.numerator * fraction2.denominator) + (fraction1.denominator * fraction2.numerator);
    newFraction.denominator = fraction1.denominator * fraction2.denominator;
    
    return newFraction;
}

