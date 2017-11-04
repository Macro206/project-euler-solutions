//
//  Solutions.m
//  Project Euler 3
//
//  Created by Matteo G. Pozzi on 25/02/2016.
//  Copyright © 2016 Matteo G. Pozzi. All rights reserved.
//

#import "Solutions.h"

void problem13() {
    
    NSArray *numberStrings = @[@"37107287533902102798797998220837590246510135740250",
                               @"46376937677490009712648124896970078050417018260538",
                               @"74324986199524741059474233309513058123726617309629",
                               @"91942213363574161572522430563301811072406154908250",
                               @"23067588207539346171171980310421047513778063246676",
                               @"89261670696623633820136378418383684178734361726757",
                               @"28112879812849979408065481931592621691275889832738",
                               @"44274228917432520321923589422876796487670272189318",
                               @"47451445736001306439091167216856844588711603153276",
                               @"70386486105843025439939619828917593665686757934951",
                               @"62176457141856560629502157223196586755079324193331",
                               @"64906352462741904929101432445813822663347944758178",
                               @"92575867718337217661963751590579239728245598838407",
                               @"58203565325359399008402633568948830189458628227828",
                               @"80181199384826282014278194139940567587151170094390",
                               @"35398664372827112653829987240784473053190104293586",
                               @"86515506006295864861532075273371959191420517255829",
                               @"71693888707715466499115593487603532921714970056938",
                               @"54370070576826684624621495650076471787294438377604",
                               @"53282654108756828443191190634694037855217779295145",
                               @"36123272525000296071075082563815656710885258350721",
                               @"45876576172410976447339110607218265236877223636045",
                               @"17423706905851860660448207621209813287860733969412",
                               @"81142660418086830619328460811191061556940512689692",
                               @"51934325451728388641918047049293215058642563049483",
                               @"62467221648435076201727918039944693004732956340691",
                               @"15732444386908125794514089057706229429197107928209",
                               @"55037687525678773091862540744969844508330393682126",
                               @"18336384825330154686196124348767681297534375946515",
                               @"80386287592878490201521685554828717201219257766954",
                               @"78182833757993103614740356856449095527097864797581",
                               @"16726320100436897842553539920931837441497806860984",
                               @"48403098129077791799088218795327364475675590848030",
                               @"87086987551392711854517078544161852424320693150332",
                               @"59959406895756536782107074926966537676326235447210",
                               @"69793950679652694742597709739166693763042633987085",
                               @"41052684708299085211399427365734116182760315001271",
                               @"65378607361501080857009149939512557028198746004375",
                               @"35829035317434717326932123578154982629742552737307",
                               @"94953759765105305946966067683156574377167401875275",
                               @"88902802571733229619176668713819931811048770190271",
                               @"25267680276078003013678680992525463401061632866526",
                               @"36270218540497705585629946580636237993140746255962",
                               @"24074486908231174977792365466257246923322810917141",
                               @"91430288197103288597806669760892938638285025333403",
                               @"34413065578016127815921815005561868836468420090470",
                               @"23053081172816430487623791969842487255036638784583",
                               @"11487696932154902810424020138335124462181441773470",
                               @"63783299490636259666498587618221225225512486764533",
                               @"67720186971698544312419572409913959008952310058822",
                               @"95548255300263520781532296796249481641953868218774",
                               @"76085327132285723110424803456124867697064507995236",
                               @"37774242535411291684276865538926205024910326572967",
                               @"23701913275725675285653248258265463092207058596522",
                               @"29798860272258331913126375147341994889534765745501",
                               @"18495701454879288984856827726077713721403798879715",
                               @"38298203783031473527721580348144513491373226651381",
                               @"34829543829199918180278916522431027392251122869539",
                               @"40957953066405232632538044100059654939159879593635",
                               @"29746152185502371307642255121183693803580388584903",
                               @"41698116222072977186158236678424689157993532961922",
                               @"62467957194401269043877107275048102390895523597457",
                               @"23189706772547915061505504953922979530901129967519",
                               @"86188088225875314529584099251203829009407770775672",
                               @"11306739708304724483816533873502340845647058077308",
                               @"82959174767140363198008187129011875491310547126581",
                               @"97623331044818386269515456334926366572897563400500",
                               @"42846280183517070527831839425882145521227251250327",
                               @"55121603546981200581762165212827652751691296897789",
                               @"32238195734329339946437501907836945765883352399886",
                               @"75506164965184775180738168837861091527357929701337",
                               @"62177842752192623401942399639168044983993173312731",
                               @"32924185707147349566916674687634660915035914677504",
                               @"99518671430235219628894890102423325116913619626622",
                               @"73267460800591547471830798392868535206946944540724",
                               @"76841822524674417161514036427982273348055556214818",
                               @"97142617910342598647204516893989422179826088076852",
                               @"87783646182799346313767754307809363333018982642090",
                               @"10848802521674670883215120185883543223812876952786",
                               @"71329612474782464538636993009049310363619763878039",
                               @"62184073572399794223406235393808339651327408011116",
                               @"66627891981488087797941876876144230030984490851411",
                               @"60661826293682836764744779239180335110989069790714",
                               @"85786944089552990653640447425576083659976645795096",
                               @"66024396409905389607120198219976047599490197230297",
                               @"64913982680032973156037120041377903785566085089252",
                               @"16730939319872750275468906903707539413042652315011",
                               @"94809377245048795150954100921645863754710598436791",
                               @"78639167021187492431995700641917969777599028300699",
                               @"15368713711936614952811305876380278410754449733078",
                               @"40789923115535562561142322423255033685442488917353",
                               @"44889911501440648020369068063960672322193204149535",
                               @"41503128880339536053299340368006977710650566631954",
                               @"81234880673210146739058568557934581403627822703280",
                               @"82616570773948327592232845941706525094512325230608",
                               @"22918802058777319719839450180888072429661980811197",
                               @"77158542502016545090413245809786882778948721859617",
                               @"72107838435069186155435662884062257473692284509516",
                               @"20849603980134001723930671666823555245252804609722",
                               @"53503534226472524250874054075591789781264330331690"];
    
    
    
    unsigned long long chunk_1 = 0;
    
    for (NSString *string in numberStrings) {
        chunk_1 += [[string substringWithRange:NSMakeRange(40, 10)] longLongValue];
    }
    
    int carry_1 = chunk_1 / pow(10, 10);
    
    
    unsigned long long chunk_2 = 0;
    
    for (NSString *string in numberStrings) {
        chunk_2 += [[string substringWithRange:NSMakeRange(30, 10)] longLongValue];
    }
    chunk_2 += carry_1;
    
    int carry_2 = chunk_2 / pow(10, 10);
    
    
    unsigned long long chunk_3 = 0;
    
    for (NSString *string in numberStrings) {
        chunk_3 += [[string substringWithRange:NSMakeRange(20, 10)] longLongValue];
    }
    chunk_3 += carry_2;
    
    int carry_3 = chunk_3 / pow(10, 10);
    
    
    unsigned long long chunk_4 = 0;
    
    for (NSString *string in numberStrings) {
        chunk_4 += [[string substringWithRange:NSMakeRange(10, 10)] longLongValue];
    }
    chunk_4 += carry_3;
    
    int carry_4 = chunk_4 / pow(10, 10);
    
    
    unsigned long long chunk_5 = 0;
    
    for (NSString *string in numberStrings) {
        chunk_5 += [[string substringWithRange:NSMakeRange(0, 10)] longLongValue];
    }
    chunk_5 += carry_4;
    
    unsigned long long answer = chunk_5 / 100;
    
    printf("Problem 13: %llu\n", answer);
}


void problem14() {
    
    int answer = 0;
    int maxSteps = 0;
    
    for (int n = 1; n < 1000000; ++n) {
        long long m = n;
        int steps = 1;
        
        while (m != 1) {
            if (m % 2 == 0) {m = m/2;}
            else            {m = 3*m + 1;}
            ++steps;
        }
        
        if (steps > maxSteps) {
            maxSteps = steps;
            answer = n;
        }
    }
    
    printf("Problem 14: %i\n", answer);
    
}


void problem15() {
    
    // Right = 0, down = 1
    // Doesn't work in case gridSize=1
    
    NSDate *startDate = [NSDate date];
    
    long long gridSize = 20;
    int *route = calloc(gridSize*2, sizeof(int)); route[0] = 1;
    __block long long numberOfRoutes = 0;
    //__block long long routesChecked  = 0;
    __block int totalRight = 0;
    __block int totalDown  = 0;
    
    __block void (^problem15_helper)(int) = ^(int depth) {
        if (depth < (gridSize*2)) {
            if (route[depth-1] != 1) {++totalRight;}
            if (route[depth-1] == 2) {--totalDown;}
            route[depth-1] = 1;
            if (totalRight <= gridSize) {
                if (totalRight + totalDown == (gridSize*2)-1) ++numberOfRoutes;
                else problem15_helper(depth+1);
            }
            
            route[depth-1] = 2; --totalRight; ++totalDown;
            if (totalDown  <= gridSize) {
                if (totalRight + totalDown == (gridSize*2)-1) ++numberOfRoutes;
                else problem15_helper(depth+1);
            }
            
            route[depth-1] = 0; --totalDown;
        }
    };
    
    ++totalRight;
    problem15_helper(2);
    numberOfRoutes *= 2;
    
    NSTimeInterval timeToComplete = [[NSDate date] timeIntervalSinceDate:startDate];
    
    printf("Time to complete: %f\n", timeToComplete);
    //printf("Routes checked: %f\n", (100*routesChecked/pow(2, gridSize*2)));
    printf("Problem 15: %lli\n", numberOfRoutes);
}

void problem15_shortcut() {
    long long gridSize = 20;
    
    long long *numeratorFactors   = calloc(gridSize, sizeof(long long));
    long long *denominatorFactors = calloc(gridSize, sizeof(long long));
    
    long long numerator   = 1;
    long long denominator = 1;
    
    for (long long c = gridSize + 1; c <= gridSize * 2; ++c) {
        numeratorFactors[c-gridSize-1] = c;
    }
    
    for (long long c = 1; c <= gridSize; ++c) {
        denominatorFactors[c-1] = c;
    }
    
    for (long long i = 0; i < gridSize; ++i) {
        for (long long j = 0; j < gridSize; ++j) {
            for (long long f = 2; f <= denominatorFactors[j]; ++f) {
                if (numeratorFactors[i] % f == 0 & denominatorFactors[j] % f == 0) {
                    numeratorFactors[i]   /= f;
                    denominatorFactors[j] /= f;
                }
            }
        }
    }
    
    for (long long i = 0; i < gridSize; ++i) {
        numerator   *= numeratorFactors[i];
        denominator *= denominatorFactors[i];
    }
    
    long long answer = numerator/denominator;
    
    printf("Problem 15 (Shortcut): %lli\n", answer);
}


void problem16() {
    
    // N.B. May not work for c != 1000
    
    long long chunkSize = 17;
    
    NSMutableArray *chunks = [NSMutableArray array];
    [chunks addObject:@"1"];
    NSMutableArray *carryArray  = [NSMutableArray array];
    [carryArray addObject:@"0"];
    
    for (long long c = 1; c <= 1000; ++c) {
        for (int i = 0; i < chunks.count; ++i) {
            long long n = [chunks[i] longLongValue];
            n *= 2;
            NSString *numberString = [NSString stringWithFormat:@"%lli", n];
            if (numberString.length <= chunkSize) {
                chunks[i] = numberString;
            }
            else {
                chunks[i] = [numberString substringFromIndex:(numberString.length-chunkSize)];
                NSString *digits = [numberString substringWithRange:NSMakeRange(0, numberString.length-chunkSize)];
                if (i == chunks.count-1) {
                    [chunks addObject:digits];
                    [carryArray addObject:@"0"];
                    break;
                }
                else {
                    carryArray[i+1] = digits;
                }
            }
        }
        
        for (int i = 0; i < chunks.count; ++i) {
            long long chunkValue = [chunks[i] longLongValue];
            long long carryValue = [carryArray[i] longLongValue];
            
            chunkValue += carryValue;
            
            chunks[i] = [NSString stringWithFormat:@"%lli", chunkValue];
            carryArray[i] = @"0";
        }
    }
    
    long long totalSum = 0;
    
    for (NSString *chunk in chunks) {
        for (int i = 0; i < chunk.length; ++i) {
            long long digit = [[chunk substringWithRange:NSMakeRange(i, 1)] longLongValue];
            totalSum += digit;
        }
    }
    
    printf("Problem 16: %lli\n", totalSum);
}


void problem17() {
    NSArray *units = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine"];
    NSArray *teens = @[@"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen"];
    NSArray *tens  = @[@"ten", @"twenty", @"thirty", @"forty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety"];
    
    NSUInteger totalLength = 0;
    
    for (int n = 1; n <= 999; ++n) {
        NSString *numberString = [NSString stringWithFormat:@"%i", n];
        NSMutableString *alphabeticRepresentation = [NSMutableString string];
        
        if (numberString.length == 1) {
            alphabeticRepresentation = units[n-1];
        }
        else {
            NSUInteger tenPosition = numberString.length - 2;
            int ten  = [[numberString substringWithRange:NSMakeRange(tenPosition, 1)] intValue];
            int unit = [[numberString substringWithRange:NSMakeRange(tenPosition+1, 1)] intValue];
            
            if (numberString.length == 3) {
                int hundred = [[numberString substringWithRange:NSMakeRange(0, 1)] intValue];
                [alphabeticRepresentation appendString:[NSString stringWithFormat:@"%@hundred", units[hundred-1]]];
            }
            
            if (numberString.length == 3 && (unit != 0 || ten != 0)) [alphabeticRepresentation appendString:@"and"];
            
            if (ten == 1) {
                if (unit == 0) [alphabeticRepresentation appendString:tens[0]];
                else           [alphabeticRepresentation appendString:teens[unit-1]];
            }
            else {
                if (ten  != 0) [alphabeticRepresentation appendString:tens[ten-1]];
                if (unit != 0) [alphabeticRepresentation appendString:units[unit-1]];
            }
        }
        
        totalLength += alphabeticRepresentation.length;
    }
    
    NSString *oneThousand = @"onethousand";
    
    totalLength += oneThousand.length;
    
    printf("Problem 17: %lu\n", totalLength);
}


void problem18() {
    
    NSArray *stringsArray = @[@"75",
                              @"95 64",
                              @"17 47 82",
                              @"18 35 87 10",
                              @"20 04 82 47 65",
                              @"19 01 23 75 03 34",
                              @"88 02 77 73 07 63 67",
                              @"99 65 04 28 06 16 70 92",
                              @"41 41 26 56 83 40 80 70 33",
                              @"41 48 72 33 47 32 37 16 94 29",
                              @"53 71 44 65 25 43 91 52 97 51 14",
                              @"70 11 33 28 77 73 17 78 39 68 17 57",
                              @"91 71 52 38 17 14 91 43 58 50 27 29 48",
                              @"63 66 04 68 89 53 67 30 73 16 69 87 40 31",
                              @"04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"];
    
    
    NSMutableArray *numbersArray = [NSMutableArray array];
    
    for (NSString *string in stringsArray) {
        [numbersArray addObject:[string componentsSeparatedByString:@" "]];
    }
    
    NSUInteger triangleSize = stringsArray.count;
    
    int *path = calloc(triangleSize, sizeof(int));
    
    __block int maxSum = 0;
    
    __block void (^problem18_helper)(int) = ^(int depth) {
        int n = (depth == 1 ? 0 : path[depth-2]);
        int lim = (depth == 1 ? 0 : n+1);
        for (int i = n; i <= lim; ++i) {
            path[depth-1] = i;
            if (depth < triangleSize) {
                problem18_helper(depth+1);
            }
            else {
                int totalSum = 0;
                
                for (int j = 0; j < triangleSize; ++j) {
                    int index = path[j];
                    totalSum += [((NSArray *)numbersArray[j])[index] intValue];
                }
                if (totalSum > maxSum) {maxSum = totalSum;}
            }
        }
    };
    
    problem18_helper(1);
    
    printf("Problem 18: %i\n", maxSum);
}


void problem19() {
    
    int totalDays = 1;
    int answer = 0;
    
    int day = 1;
    int month = 1;
    int year = 1900;
    
    while (!(day == 31 && month == 12 && year == 2000)) {
        if (day == 1 && (totalDays % 7) == 0 && year != 1900) {
            ++answer;
        }
        
        ++totalDays;
        ++day;
        
        if (day > 28 && month == 2) {
            if ((year != 1900) && (year % 4 == 0)) {
                if (day == 30) {
                    day = 1;
                    ++month;
                }
            }
            else {
                day = 1;
                ++month;
            }
        }
        else if (day > 30) {
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                if (day == 32) {
                    day = 1;
                    ++month;
                }
            }
            else {
                day = 1;
                ++month;
            }
        }
        
        if (month == 13) {
            month = 1;
            ++year;
        }
    }
    
    printf("Problem 19: %i\n", answer);
}


void problem20() {
    // N.B. May not work for c != 100
    
    long long chunkSize = 16;
    
    NSMutableArray *chunks = [NSMutableArray array];
    [chunks addObject:@"1"];
    NSMutableArray *carryArray  = [NSMutableArray array];
    [carryArray addObject:@"0"];
    
    for (long long c = 1; c <= 100; ++c) {
        for (int i = 0; i < chunks.count; ++i) {
            long long n = [chunks[i] longLongValue];
            n *= c;
            NSString *numberString = [NSString stringWithFormat:@"%lli", n];
            if (numberString.length <= chunkSize) {
                chunks[i] = numberString;
            }
            else {
                chunks[i] = [numberString substringFromIndex:(numberString.length-chunkSize)];
                NSString *digits = [numberString substringWithRange:NSMakeRange(0, numberString.length-chunkSize)];
                if (i == chunks.count-1) {
                    [chunks addObject:digits];
                    [carryArray addObject:@"0"];
                    break;
                }
                else {
                    carryArray[i+1] = digits;
                }
            }
        }
        
        for (int i = 0; i < chunks.count; ++i) {
            long long chunkValue = [chunks[i] longLongValue];
            long long carryValue = [carryArray[i] longLongValue];
            
            chunkValue += carryValue;
            NSString *numberString = [NSString stringWithFormat:@"%lli", chunkValue];
            
            chunks[i] = numberString;
            carryArray[i] = @"0";
        }
    }
    
    long long totalSum = 0;
    
    for (NSString *chunk in chunks) {
        for (int i = 0; i < chunk.length; ++i) {
            long long digit = [[chunk substringWithRange:NSMakeRange(i, 1)] longLongValue];
            totalSum += digit;
        }
    }
    
    printf("Problem 20: %lli\n", totalSum);
}


void problem21() {
    
    int answer = 0;
    
    __block int (^sumOfFactors)(int) = ^int(int n) {
        int sum = 1;
        
        for (int c = 2; c <= sqrt(n); ++c) {
            if (n % c == 0) {
                sum += c;
                if (c != (n/c)) sum += n/c;
            }
        }
        
        return sum;
    };
    
    for (int i = 1; i < 10000; ++i) {
        int sum_i = sumOfFactors(i);
        for (int j = 1; j < 10000; ++j) {
            int sum_j = sumOfFactors(j);
            
            if (i == sum_j && j == sum_i && i != j) answer += i;
        }
    }
    
    printf("Problem 21: %i\n", answer);
}


void problem22() {
    // N.B. Location of names file
    
    NSString *namesString = [NSString stringWithContentsOfFile:@"/Users/Matteo/Documents/Xcode Projects/Project Euler 3/Project Euler 3/p022_names.txt" encoding:NSUTF8StringEncoding error:nil];
    NSArray *stringsArray = [namesString componentsSeparatedByString:@","];
    NSMutableArray *names = [NSMutableArray array];
    
    for (NSString *string in stringsArray) {
        [names addObject:[string stringByReplacingOccurrencesOfString:@"\"" withString:@""]];
    }
    
    [names sortUsingComparator:^NSComparisonResult(NSString *string1, NSString *string2) {
        return [string1 compare:string2];
    }];
    
    long long answer = 0;
    
    for (long long i = 0; i < names.count; ++i) {
        NSString *name = names[i];
        long long total = 0;
        
        for (int j = 0; j < name.length; ++j) {
            total += ([name characterAtIndex:j]-64);
        }
        
        total *= (i+1);
        
        answer += total;
    }
    
    printf("Problem 22: %lli\n", answer);
}


void problem23() {
    
    __block int (^sumOfFactors)(int) = ^int(int n) {
        int sum = 1;
        
        for (int c = 2; c <= sqrt(n); ++c) {
            if (n % c == 0) {
                sum += c;
                if (c != (n/c)) sum += n/c;
            }
        }
        
        return sum;
    };
    
    NSMutableArray *abundantNumbers = [NSMutableArray array];
    
    for (int c = 1; c <= 28123; ++c) {
        int sum = sumOfFactors(c);
        
        if (sum > c) {
            [abundantNumbers addObject:[NSNumber numberWithInt:c]];
        }
    }
    
    int *feasibleNumbers = calloc(28123, sizeof(int));
    
    for (int i = 0; i < abundantNumbers.count; ++i) {
        for (int j = i; j < abundantNumbers.count; ++j) {
            int value = [(NSNumber *)abundantNumbers[i] intValue] + [(NSNumber *)abundantNumbers[j] intValue];
            feasibleNumbers[value-1] = value;
        }
    }
    
    int answer = 0;
    
    for (int n = 1; n <= 28123; ++n) {
        if (feasibleNumbers[n-1] == 0) {
            answer += n;
        }
    }
    
    printf("Problem 23: %i\n", answer);
}


void problem24() {
    
    NSArray *initialArrangement = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    NSMutableArray *remaining = initialArrangement.mutableCopy;
    NSMutableArray *workingCopy = [NSMutableArray array];
    
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
    
    for (int i = 0; i < arrangements.count; ++i) {
        if (i == 999999) {
            printf("Problem 24: ");
            for (int j = 0; j < initialArrangement.count; ++j) {
                printf("%s", [arrangements[i][j] cStringUsingEncoding:NSUTF8StringEncoding]);
            }
            printf("\n");
        }
    }
    
}


void problem25() {
    
    BigInt *previousNumber = [[BigInt alloc] initWithString:@"1"];
    BigInt *currentNumber  = [[BigInt alloc] initWithString:@"1"];
    
    int n = 2;
    
    while ([currentNumber numberOfDigits] < 1000) {
        BigInt *newNumber = [currentNumber add:previousNumber];
        
        previousNumber = currentNumber;
        currentNumber  = newNumber;
        
        ++n;
    }
    
    printf("Problem 25: %i\n", n);

}


void problem26() {
    
    int answer = 0;
    NSInteger maxLoopLength = 0;
    NSInteger chunkLength = 3;
    
    for (int d = 2; d < 1000; ++d) {
        NSMutableString *resultString = [NSMutableString stringWithString:@"0."];
        int remainder = 1;
        NSInteger loopLength = 0;
        NSInteger location = NSNotFound;
        
        while (remainder != 0) {
            int nextNumber = (remainder * 10) / d;
            remainder = (remainder * 10) % d;
            [resultString appendString:[NSString stringWithFormat:@"%i", nextNumber]];
            
            if (loopLength == 0) {
                NSString *workingCopy = [resultString substringToIndex:(resultString.length-chunkLength)];
                
                location = [workingCopy rangeOfString:[resultString substringWithRange:NSMakeRange(resultString.length-chunkLength, chunkLength)]].location;
                if (location != NSNotFound) {
                    loopLength = resultString.length - chunkLength - location;
                }
            }
            else if (resultString.length == (location + (3*loopLength) + 1)) {
                NSString *string1 = [resultString substringWithRange:NSMakeRange(location, loopLength)];
                NSString *string2 = [resultString substringWithRange:NSMakeRange(location+loopLength, loopLength)];
                
                if ([string1 isEqualToString:string2]) {
                    if (loopLength > maxLoopLength) {
                        maxLoopLength = loopLength;
                        answer = d;
                    }
                }
                break;
            }
        }
    }
    
    printf("Problem 26: %i\n", answer);
    
}


void problem27() {
    
    int maxLen = 0;
    int ab = 0;
    
    for (int a = -999; a < 999; ++a) {
        for (int b = -999; b < 999; ++b) {
            
            int n = 0;
            int len = 0;
            
            while (1) {
                int result = (n*n) + (a*n) + b;
                
                if (isPrime(result)) ++len;
                else break;
                
                ++n;
            }
            
            if (len > maxLen) {
                maxLen = len;
                ab = a * b;
            }
        }
    }
    
    printf("Problem 27: %i\n", ab);
}


void problem28() {
    
    int spiralSize = 1001;
    
    int diagonalSum = 0;
    
    for (int c = 1; c <= spiralSize; c+=2) {
        diagonalSum += (c*c);
        if (c != 1) {
            diagonalSum += ((c*c) - ((c/2)*2));
            diagonalSum += ((c*c) - ((c/2)*4));
            diagonalSum += ((c*c) - ((c/2)*6));
        }
    }
    
    printf("Problem 28: %i\n", diagonalSum);
    
}


void problem29() {
    int lim = 100;
    
    NSMutableArray *numbers = [NSMutableArray array];
    
    for (long long a = 2; a <= lim; ++a) {
        for (long long b = 2; b <= lim; ++b) {
            NSString *primeFactorisationString = primeFactorisation(a, b);
            
            [numbers addObject:primeFactorisationString];
        }
    }
    
    NSMutableArray *finalArray = [NSMutableArray array];
    
    for (int i = 0; i < numbers.count; ++i) {
        if (![finalArray containsObject:numbers[i]]) {
            [finalArray addObject:numbers[i]];
        }
    }
    
    printf("Problem 29: %li\n", finalArray.count);
}
