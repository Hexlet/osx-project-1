//
//  main.m
//  DNK
//
//  Created by Aliullov Vlad on 06.11.12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)

-(void)mutate:(int) proc;

@end

@implementation Cell (Mutator)

-(void) mutate:(int) proc {
    NSMutableArray* dna = [self getDNA];
    
    NSUInteger len = [dna count];
    int mutateProgress=len*proc/100;
   //NSLog(@"mutable=%i",mutateProgress);
    
    NSMutableArray* mdna = [NSMutableArray arrayWithCapacity:mutateProgress];
    
  
    while (mutateProgress) {
        
        int i = arc4random_uniform(len);
        NSString  *new_value = [Cell getRandomNucl];
        
        if ([dna[i] length]==1 && ![dna[i] isEqualToString:new_value]) {
            dna[i] = [new_value stringByAppendingString:@"M"];
            [mdna addObject:[NSNumber numberWithInt:i]];
            --mutateProgress;
        }
    }//while
    
    len = [mdna count];
    for(int i = 0;i<len;i++ ){
        long k=[mdna[i] integerValue];
        dna[k] = [dna[k] substringToIndex:1];
    
    }

}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cell = [[Cell alloc] init];
        NSLog(@"----Cell 1-----");
        [cell print];
        
        NSLog(@"----Cell 2-----");
        Cell* cell2 = [[Cell alloc] init];
        [cell2 print];
        
        NSLog(@"----Hamming Distance Cell1 VS Cell 2-----");
        NSLog(@"%i",[cell hammingDistance:cell2]);
        
        NSLog(@"MUTATION...");
        
        [cell mutate:30];
        NSLog(@"----Mutant Cell 1-----");
        [cell print];
        
        NSLog(@"----Mutant Cell 2-----");
        [cell2 mutate:30];
        [cell2 print];
        
        NSLog(@"----Hamming Distance Cell1 VS Cell 2-----");
        NSLog(@"%i",[cell hammingDistance:cell2]);
        

        
    }
    return 0;
}

