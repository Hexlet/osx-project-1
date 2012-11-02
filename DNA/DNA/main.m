//
//  main.m
//  DNA
//
//  Created by Axel on 30.10.12.
//  Copyright (c) 2012 Axel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)percent;
@end
@implementation Cell (mutator)

-(void) mutate:(int)percent{
    if((percent > 0) && (percent <= 100)){
        int count = percent / 100.0 * [self.DNA count], index = 0;
        NSString *s;
        
        for(int i = 0; i < count; i++){
            //Выбераем элемент для замены
            if([self.tmpArr count] > 0){
                do{
                    index = arc4random()%[self.DNA count];
                }while ([self.tmpArr containsObject:[NSString localizedStringWithFormat:@"%i", index]]);
            }else{
                index = arc4random()%[self.DNA count];
            }
            //Генерируем букву
            do{
                s = [Cell genLatter];
            }while ([self.DNA objectAtIndex:index] == s);
            
            [self.DNA replaceObjectAtIndex:index withObject:s];
            [self.tmpArr addObject:[NSString localizedStringWithFormat:@"%i", index]];
        }
        [self.tmpArr removeAllObjects];
    }else{
        NSLog(@"An invalid value");
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance: %li", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:13];
        [cell2 mutate:83];
        
        NSLog(@"Hamming distance after mutate: %li", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

