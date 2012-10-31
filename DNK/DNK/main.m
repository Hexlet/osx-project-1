//
//  main.m
//  DNK
//
//  Created by Администратор on 10/25/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate:(int)X;
@end

@implementation Cell (mutator) 
    int rnd,b,d;
    NSString *chr;

- (void) mutate:(int)X
{
    if ((X<=100)&&(X>=0))
    {
        self.arnd = [[NSMutableArray alloc] initWithCapacity:100];
        
        for (b=0; b<100; b++) {
            [self.arnd insertObject:@"NO" atIndex:b];
        }
        
        for (d=X; d>0; d--)
        {
            rnd = arc4random() %100;
            
            while (self.arnd[rnd]==@"YES")
            {
               rnd = arc4random() %100;
            }
            
            [self.arnd replaceObjectAtIndex:rnd withObject:@"YES"];
            chr = self.DNA[rnd];
            
            do
            {
                self.DNA[rnd]=self.chars[arc4random() %4];
            } while (self.DNA[rnd] == chr);
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *obj1, *obj2;
        obj1 = [[Cell alloc] init];
        obj2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance is:%i",[obj1 hammingDistance:obj2]);
        [obj1 mutate:arc4random() %101];
        [obj2 mutate:arc4random() %101];
        NSLog(@"Hamming distance is:%i",[obj1 hammingDistance:obj2]);
    }
    return 0;
}

