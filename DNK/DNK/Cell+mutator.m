//
//  Cell+mutator.m
//  DNK
//


#import "Cell+mutator.h"

//create categoty with name "mutator"
@implementation Cell (mutator)

-(void) mutate:(int) percent{
    if(percent<0 || percent>100){
    
        NSLog(@"Can't mutate %d percent of DNA!", percent);
        return;
    }
    if (percent == 0){
        return;
    }
    
    [self mutatePartOfDna:percent];//mutate part of array
    
}

-(void) mutatePartOfDna:(int) percent{
    //Array of items's indexes in DNA array which were not chnaged yet
    NSMutableArray *availableIndexes = [[NSMutableArray alloc] initWithCapacity:[self DNACount]];
    for (int i = 0; i < [self DNACount]; i++) {
        [availableIndexes addObject:[NSNumber numberWithInt:i]];
    }
    
    //calculate count of items to update
    long itemsCount = lroundf( ((float)[self DNACount] * percent)/100);
    //Repeat untill change all needed percentage of items
    for(int i = 0; i < itemsCount; i++)
    {
        //Count of items in DNA array which were not changed
        NSNumber* notChangedItemsCount = [NSNumber numberWithLong: [availableIndexes count]];
        //Get a random item index from not changed indexes array
        NSNumber*randomIndexPosition = [self randomDnaIndexInRange: notChangedItemsCount];
        //Get a random item value from not changed indexes array
        //which is equal item index in DNA array
        int randomIndex = [[availableIndexes objectAtIndex:[randomIndexPosition intValue]] intValue];
        //generate new DNA type
        NSString* newDnaType = [self randomDnaType];
        //get current DNA type in array at index
        NSString* oldDnaType = [[self DNA] objectAtIndex:randomIndex];
        //Check DNA have new value
        while ([newDnaType isEqualToString: oldDnaType]) {
            newDnaType =  [self randomDnaType];
        }
        //Change DNA type
        [self changeDna: newDnaType atIndex:randomIndex];
        
        //remove current item index from available indexes array
        [availableIndexes removeObjectAtIndex:[randomIndexPosition intValue]] ;
    }
}


//Chage item in DNA array at specified index
-(void) changeDna:(NSString*) newDnaType atIndex:(int) index{
    //replace new random item at specified index
    [[self DNA] replaceObjectAtIndex:index  withObject: newDnaType];
}

//Get random index for DNA array
-(NSNumber*) randomDnaIndexInRange:(NSNumber*) range{
    return [NSNumber numberWithInt: arc4random() % [range intValue]];
}


@end
