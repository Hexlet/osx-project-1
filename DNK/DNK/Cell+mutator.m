//
//  Cell+mutator.m
//  DNK
//


#import "Cell+mutator.h"

//create categoty with name "mutator"
@implementation Cell (mutator)

-(void) mutate:(int) percent{
    if (percent == 100){//if 100%
        [self mutateAllDna];//mutate all array
    }
    else {
        [self mutatePartOfDna:percent];//mutate part of array
    }
}

//Refill all DNA array
-(void) mutateAllDna{
    //Remove all items
    [[self DNA] removeAllObjects];
    //Fill DNA array with new values
    [self fillDna];
}

-(void) mutatePartOfDna:(int) percent{
    //Array for saving indexes which were already used
    NSMutableArray *changedIndexes = [[NSMutableArray alloc] init];
    //Percent of already changed items in array(in case if array length no equal 100)
    float changedPercent = 0;
    //Count of already changed items in array
    int changedCount = 0;
    //Repeat untill change all needed percentage of items
    while (changedPercent < percent) {
        //Get new random index of item in DNA array
        //(use NSNumber instead of int to be able to put item in array)
        NSNumber *randomIndex = [self randomDnaIndex];
        //Check if we changed item for this index already
        if (![changedIndexes containsObject:randomIndex]) {
            //generate new DNA type
            NSString* newDnaType = [self randomDnaType];
            //get current DNA type in array at index
            NSString* oldDnaIndex = [[self DNA] objectAtIndex:[randomIndex intValue]];
            while ([newDnaType isEqualToString: oldDnaIndex]) {
                newDnaType =  [self randomDnaType];
            }
            //Add this index in saving array
            [changedIndexes addObject:randomIndex];
            [self changeDna: newDnaType atIndex:[randomIndex intValue]];
            //increase changed items count
            changedCount++;
            //recalculate changed percent, round the vaue
            changedPercent = lroundf(((float)changedCount / [self DNACount]) * 100);
        }
    }
}

//Chage item in DNA array at specified index
-(void) changeDna:(NSString*) newDnaType atIndex:(int) index{
    //remove item at specified index
    [[self DNA ] removeObjectAtIndex: index];
    //insert new random item at specified index
    [[self DNA] insertObject:[self randomDnaType] atIndex: index];
}

//Get random index for DNA array
-(NSNumber*) randomDnaIndex{
    return [NSNumber numberWithInt: arc4random() % ([self DNACount] -1)];
}

@end
