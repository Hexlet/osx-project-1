//
//  Cell.h
//  DNA
//
//  Created by Vadim Iskuchekov on 02.11.12.
//  Copyright (c) 2012 Egregors. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
    NSMutableArray *DNA; // массив с ДНК
    NSArray *Nucleotides; // массив с нуклеотидами 
    
}

- (int)hammingDistance: (Cell *) inCell;  // возвращаем количество не совпавших нуклеотидов

@end

@interface Cell (mutator)

-(void)mutate:(int)x; 

@end
