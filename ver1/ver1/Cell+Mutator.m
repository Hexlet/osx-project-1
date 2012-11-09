//
//  Cat+Mutator.m
//  ver1
//
//  Created by Denis Sazonov on 11/9/12.
//  Copyright (c) 2012 Denis Sazonov. All rights reserved.
//

#import "Cell+Mutator.h"
#import "Constants.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent{
    if (percent<0) percent=0;
    if (percent>100) percent=100;
    
    int i=0;
    
    NSMutableArray *cache = [[NSMutableArray alloc] init];
    for (i=0;i<percent;i++){
        
        while (true){
            int j = arc4random()%100;
            
            //check: did we change it already?
            if ([cache containsObject:[NSNumber numberWithInt:j]]) {

  //              NSLog(@"We already have this number in cache %i",j);
                continue; //skip if we already changed this cell
            }
            
            
            unichar ch =  [DNA_CHAIN characterAtIndex:arc4random()%4];

            NSString* str = [NSString stringWithFormat:@"%C", ch];
            
            if ([[[self dna] objectAtIndex:j] isEqual:str]) continue;
            
            
            //wa have unique symbol on new place
            [[self dna] replaceObjectAtIndex:j withObject:str];
            
            //add number in cache
//            NSLog(@"add number in cache %i",j);
            [cache addObject:[NSNumber numberWithInt:j]];
            break; //exit from neverend loop
        }
    }
    
    
}
@end
