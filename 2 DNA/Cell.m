//
//  Cell.m
//  2 _DNA
//
//  Created by Vf on 30.10.12.
//  Copyright (c) 2012 Vf. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    int i = 0;
    // Набор допустимых генов
    NSString *s = @"ATGС";

    self.genomeLength = 10;
    
    if(self){
        _DNA = [NSMutableArray arrayWithCapacity:_genomeLength];
        for (i = 0; i<_genomeLength; ++i) {
            // Выбираем случайную подстроку длины 1 из s и вставляем в массив DNA:
            [_DNA insertObject: [s substringWithRange: NSMakeRange(arc4random()%4, 1)] atIndex:i];
        }
    }
    
    return self;
}

- (id) initWithGenomeLength:(UInt)genLen {
    self = [super init];
    
    int i = 0;
    NSString *s = @"ATGС";
    
    self.genomeLength = genLen;
    
    if(self){
        _DNA = [NSMutableArray arrayWithCapacity:_genomeLength];
        for (i = 0; i<_genomeLength; ++i) {
            [_DNA insertObject: [s substringWithRange: NSMakeRange(arc4random()%4, 1)] atIndex:i];
        }
    }
    
    return self;
}

- (void) show{
    int i = 0;
    NSString *s = @"";

    for(i = 0; i<_genomeLength; i++){
        s = [s stringByAppendingString:[_DNA objectAtIndex:i]];
    }
    NSLog(@"%@",s);
}

- (int) hammingDistance:(Cell*)otherCell{
    int distance = 0;
    int i = 0;

    for(i = 0; i<_genomeLength; ++i){
        // Сравниваем NSString'и
        if([_DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i]){
            ++distance;
        }
    }
    
    return distance;
}

@end
