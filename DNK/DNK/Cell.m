//
//  Cell.m
//  DNK
//
//  Created by admin on 06.11.12.
//
//

#import "Cell.h"

@implementation Cell

-(id) init{    
    int n;
    self = [super init];
    if(self){
        _DNA = [NSMutableArray array];
        for(int i=0;i<100;i++){
            n = arc4random()%4;
            
            if(n == 0)
                [_DNA addObject:@"A"];
            else if(n == 1)
                [_DNA addObject:@"T"];
            else if(n == 2)
                [_DNA addObject:@"G"];
            else if(n == 3)
                [_DNA addObject:@"C"];
        }
            
        
    }
    return self;
}

-(int) hammingDistance:cell{
    int hd=0;
    for(int i=0; i<[_DNA count]; i++){
        if([_DNA objectAtIndex:i] != [[cell DNA] objectAtIndex:i])  hd++;
    }
    return hd;
}

-(void) print{
        NSLog(@"%@",_DNA);
}

@end
