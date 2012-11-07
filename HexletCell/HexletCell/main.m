//
//  main.m
//  HexletCell
//
//  Created by Артем Прохоров on 06.11.12.
//  Copyright (c) 2012 Артем Прохоров. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutator:(int)X;
@end

@implementation Cell (mutator)

-(void) mutator:(int)X {
    
}

@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        [cell1 print];
    }
    return 0;
}

