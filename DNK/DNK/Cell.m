//
//  Cell.m
//  DNK
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

//Array of possible DNA values
NSMutableArray *DnaTypes;


//Overloaded init
-(id) init{
    [self InitVariables];
    
    [self fillDna];
    
    //Call base init method
    return [super init];
}

//Fill DNA array with random values
-(void) fillDna{
    for (int dnaIndex = 0; dnaIndex <= _DNACount; dnaIndex++) {
        
        [_DNA addObject: [self randomDnaType]];
    }
}

- (void)InitVariables {
    //Count of DNA in Cell
    _DNACount = 100;
    //Cell's DNA array
    _DNA = [[NSMutableArray alloc] initWithCapacity:_DNACount];
    //Possible DNA values
    DnaTypes= [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
}

//Returns random DNA value one of specified in DnaTypes array
-(NSString*) randomDnaType{
    //get randaom value between 0 and (4-1) = 3 (four DNA types)
    int randomInt = arc4random() % ([DnaTypes count] -1);
    return [DnaTypes objectAtIndex:randomInt];
}

//Calculate hamming distance
- (int)hammingDistance:(Cell*) cell{
    int hammingDistance = 0;
    for (int dnaIndex = 0; dnaIndex <= _DNACount; dnaIndex ++) {
        //compare cell's DNAs at the same index
        if ([[_DNA objectAtIndex:dnaIndex] isEqualToString:[[cell DNA] objectAtIndex:dnaIndex]]) {
            //if equal - increment hammingDistance
            hammingDistance++;
        }
    }
    return hammingDistance;
}

@end
