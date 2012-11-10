//
//  main.m
//  ProjectOne_DNK
//
//  Created by Максим on 30.10.12.
//  Copyright (c) 2012 CarelessApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell ()

@end

@interface Cell (mutator)
-(int)mutate: (Cell *)persent: (id)secondArray;
@end

@implementation Cell (mutator)
-(int)mutate: (Cell *)persent: (id)secondArray{
    int i=0;
    int _errorRows = 0;
    
    NSArray *lettersArray = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    
    do {
        int randomIndex = arc4random() %4;
        [secondArray replaceObjectAtIndex:i withObject:[lettersArray objectAtIndex:randomIndex]];
        
        if ([[secondArray objectAtIndex:i] isEqualTo:[persent.DNA objectAtIndex:i]]){
        }
        else {
            _errorRows = _errorRows+1;
        }
    }
    while (_errorRows != 80);
    NSLog(@"ошибок %i",_errorRows);
    return _errorRows;
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell = [[Cell alloc]init];
        
        NSMutableArray *DNAArray = [NSMutableArray arrayWithCapacity:100];
        NSArray *lettersArray = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        int i;
        for (i = 0; i <100; i++) {
            int randomIndex = arc4random() %4;
            [DNAArray insertObject:lettersArray[randomIndex] atIndex:i];
            
        }
        [cell hammingDistance:DNAArray];
        [cell mutate:cell :DNAArray];
    }
    return 0;
}

