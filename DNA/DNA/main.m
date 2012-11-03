//
//  main.m
//  DNA
//
//  Created by Meriados on 03.11.12.
//  Copyright (c) 2012 Meriados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    
    Cell* cell1 = [[Cell alloc] init];
    Cell* cell2 = [[Cell alloc] init];
    
    int ham = [cell1 hammingDistanceWithCell:cell2];
    NSLog(@"Расстояние Хэмминга после заполнения: %i", ham);
    
    // переводим в проценты
    int percent = ham * 100 / MAX_LEN;
    
    [cell1 mutateWith:percent];
    [cell2 mutateWith:percent];
    
    ham = [cell1 hammingDistanceWithCell:cell2];
    NSLog(@"Расстояние Хэмминга после изменения: %i", ham);
    
    cell1 = nil;
    cell2 = nil;
  }
    return 0;
}

