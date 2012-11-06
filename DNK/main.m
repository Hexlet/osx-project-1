//
//  main.m
//  DNK
//
//  Created by admin on 06.11.12.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)x;
@end

@implementation Cell (mutator)

-(void) mutate:(int)x{
    int n,m;
    x = x*[[self DNA] count]/100;
    NSMutableArray *d = [[NSMutableArray alloc] initWithArray:[self DNA]];
    for (int i=0; i<x; i++) {
        n = arc4random()%[[self DNA] count];
        if ([[self DNA] objectAtIndex:n] == [d objectAtIndex:n]) {
            do{
            m = arc4random()%4;            
            if(m == 0) [[self DNA] replaceObjectAtIndex:n withObject:@"A"];
            else if(m == 1) [[self DNA] replaceObjectAtIndex:n withObject:@"T"];
            else if(m == 2) [[self DNA] replaceObjectAtIndex:n withObject:@"G"];
            else if(m == 3) [[self DNA] replaceObjectAtIndex:n withObject:@"C"];
            } while([[self DNA] objectAtIndex:n] == [d objectAtIndex:n]);
        }
        else i--;
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell,*cell_two;
        cell = [[Cell alloc] init];
        cell_two = [[Cell alloc]init];
        // insert code here...
        //[cell print];
        //[cell_two print];
        int hd = [cell hammingDistance:cell_two];
        NSLog(@"ns = %i",hd);
        [cell mutate:50];
        [cell_two mutate:20];
        hd = [cell hammingDistance:cell_two];
        NSLog(@"ns = %i",hd);
        //[cell print];
        //[cell_two print];
    }
    return 0;
}

