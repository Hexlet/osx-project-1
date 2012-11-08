//
//  Cell.m
//  DNK
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

//Array of possible DNA values
static NSArray *DnaTypes;


//Overloaded init
-(id) init{
    //Call base init method
     if ((self = [super init])) {
    
         [self InitVariables];
    
         [self fillDna];
    }
    return self;
}

//Fill DNA array with random values
-(void) fillDna{
    for (int dnaIndex = 0; dnaIndex < _DNACount; dnaIndex++) {
        
        [_DNA addObject: [self randomDnaType]];
    }
}

- (void)InitVariables {
    //Count of DNA in Cell
    _DNACount = 100;
    //Cell's DNA array
    _DNA = [[NSMutableArray alloc] initWithCapacity:_DNACount];
    //Possible DNA values
    DnaTypes= [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
}

//Returns random DNA value one of specified in DnaTypes array
-(NSString*) randomDnaType{
    int randomInt = arc4random() % [DnaTypes count];
    return [DnaTypes objectAtIndex:randomInt];
}

//Calculate hamming distance
- (int)hammingDistance:(Cell*) cell{
    int hammingDistance = 0;
    for (int dnaIndex = 0; dnaIndex < _DNACount; dnaIndex ++) {
        //compare cell's DNAs at the same index
        if ([[_DNA objectAtIndex:dnaIndex] isNotEqualTo:[[cell DNA] objectAtIndex:dnaIndex]]) {
            //if not equal - increment hammingDistance
            hammingDistance++;
        }
    }
    return hammingDistance;
}

@end
