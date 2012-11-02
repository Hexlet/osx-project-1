//
//  main.m
//  Lab_DNK_Shpilevoy
//
//  Created by Stanislav Shpilevoy on 01.11.12.
//  Copyright (c) 2012 Stanislav Shpilevoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        
        int raznica = [cell1 hammingDistance:cell2];
        NSLog(@"Разница между мутацией %d", raznica);
        
        [cell1 mutate: 60];
        [cell2 mutate: 90];
        raznica = [cell1 hammingDistance:cell2];
        NSLog(@"Разница между мутацией %d", raznica);
        
    }
    return 0;
}

