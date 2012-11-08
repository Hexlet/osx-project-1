//
//  Cell+Mutator.m
//  DNA
//
//  Created by Екатерина Полищук on 06.11.12.
//
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) x {
    
    @try {
        [self mutateWithExctption: x];
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@",exception);
    }
}

-(void) mutateWithExctption: (int) x {
    
    if (x < 0 || x > 100) @throw [NSException exceptionWithName:@"InvalidNumbersOfPercent" reason: @"Can't mutate less or more 100 percent of genes" userInfo:nil];
    
    int symbolsCount = x * [self maxSetSymbols] / 100;
    
    NSMutableArray *changesList = [[NSMutableArray alloc] init];
    BOOL flag = NO;
    
    // про нелинейную сложность уже слышала, но других вариантов решения пока нет. я новичок в
    // программировании, поэтому с другими алгоритмами пока туго
    
    while (symbolsCount) {
        
        NSNumber* numberChanging = [NSNumber numberWithInt: arc4random_uniform([self maxSetSymbols])];
        
        for (NSNumber* n in changesList) {
            if (n == numberChanging) {
                flag = YES;
                break;
            }
        }
        
        if (!flag) {
            int symbolOfSet = arc4random_uniform([self nucleotidesCount]);
            
            if (![[[self DNA] objectAtIndex: [numberChanging intValue]] isEqual:
                  [[self nucleotides] objectAtIndex:symbolOfSet]]) {
                
                [changesList addObject: numberChanging];
                [[self DNA] replaceObjectAtIndex: [numberChanging intValue]
                                      withObject:[[self nucleotides] objectAtIndex:symbolOfSet]];
                
                --symbolsCount;
            }
        }
        
        flag = NO;
    }
}

@end

