//
//  Cell+Mutator.m
//  DNAproject
//
//  Created by Lilumi Odi on 05.11.12.
//  Copyright (c) 2012 Lilumi Odi. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell 

- (id)init {
   return [self initWithLenght:100]; 
}

- (id)initWithLenght:(int)length {
    if (length<=0) return nil;
    if ( self = [super init]) {
            _DNA = [NSMutableArray arrayWithCapacity:length];
            for (int i=0; i<length; i++) {
                [_DNA insertObject:[self randomCharacterExcluding:nil] atIndex:i];
            }
        
    }
    
    return self;
}


- (NSString* ) randomCharacterExcluding: (NSString*) exclude {
    NSMutableArray *arrayOfChars = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    [arrayOfChars removeObject:exclude];
    NSString * value = [arrayOfChars objectAtIndex:arc4random() % [arrayOfChars count]];
    return value;
}

- (int) hammingDistance:(Cell *)aCell {
    int ham = 0, i;
    NSInteger length = [[self DNA] count];
    length = MIN([self.DNA count], [aCell.DNA count]);
    for (i=0; i<length; i++) {
        if ([[self.DNA objectAtIndex:i] isEqualToString:[aCell.DNA objectAtIndex:i]]==NO) ham++;
    }
    return ham;
}

- (NSString *) description {
    return [_DNA componentsJoinedByString:@""];
}


@end


@implementation Cell (Mutator)

- (void) mutate:(int) p {
    
    if (0<=p && p<=100) {
        
        int n = round([self.DNA count] * p/100); //вычисляем кол-во елементов, что нужно будеть поменять в ДНК
        if (n>=1) {
        NSInteger l=[_DNA count], i=0;
        NSMutableArray * indexArray = [NSMutableArray array], * sortedArray = [NSMutableArray array];
        for (i=0; i<l; i++) {
            [sortedArray addObject:[NSNumber numberWithInteger:i]];
        }
        
        for (i=0; i<n; i++) {
            int pos = arc4random()%l;
            indexArray[i]=sortedArray[pos];
            [sortedArray removeObjectAtIndex:pos];
            l--;
            
        }
        
        for (i=0; i<n; i++) {
            NSInteger index=[[indexArray objectAtIndex:i] integerValue];
            [self.DNA replaceObjectAtIndex:index withObject:[self randomCharacterExcluding:[self.DNA objectAtIndex:index ] ]];
        }

        } else NSLog(@"Нечего менять, так как количество процентов меньше 1 единицы из ДНК");
    
  } else NSLog(@"Значение процентов не может быть больше 100%% или меньше нуля");
        
}

@end