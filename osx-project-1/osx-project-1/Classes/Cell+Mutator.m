//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Roman TS on 11/3/12.
//  Copyright (c) 2012 Roman TS. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(NSUInteger) percent {
    
    @try {
        if (percent>=101) [NSException raise:@"Invalid percent value." format:@"Foo of %ld is invalid. Should be value between 0 and 100.", percent];
        
        NSUInteger countOfItemsToChange = percent*0.01*[self.DNA  count];
//        create list of numbers
        NSMutableArray * listOfItemsToChange = [[NSMutableArray alloc] init];
        for (NSUInteger numberOfItem=0; numberOfItem<[self.DNA count];numberOfItem++){
            
            NSNumber * number =[[NSNumber alloc] initWithInteger:numberOfItem];
            [listOfItemsToChange addObject: number];
            
        }
        
        
        
        NSUInteger mutatedMarkersCount=0;
        while (mutatedMarkersCount<countOfItemsToChange){
            
            //        get randomIndex and indexValue by randomIndex. I shall change DNA marker with indexValue.
            NSUInteger indexToChange=arc4random()%[listOfItemsToChange count];
            NSNumber *indexValue = [listOfItemsToChange objectAtIndex:indexToChange];
            
            //        generate new random DNA's marker
            NSString *newDNAItemValue = [self generateNewMarkerExclude:[self.DNA objectAtIndex:[indexValue integerValue]]];
            
            //        replace exist DNA marker with new marker by indexValue
            [self.DNA replaceObjectAtIndex:[indexValue integerValue] withObject:newDNAItemValue];
            
            //        remove indexValue object from listOfItemsToChange
            [listOfItemsToChange removeObjectAtIndex:indexToChange];
            //        increment count of mutation
            mutatedMarkersCount++;
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"You have an exception in the code. DNA will not mutate. Exception: %@", [exception debugDescription]);
    }
    
}

@end
