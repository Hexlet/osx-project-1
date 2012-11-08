//
//  Cell.m
//  DNA
//
//  Created by ed on 02.11.12.
//  Copyright (c) 2012 ed. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    
    gen = @[@"A",@"T",@"G",@"C"];
    
    if(self)
    {
        self.dna = [[NSMutableArray alloc]initWithCapacity:100];
        
        for(int i = 0; i < 100; ++i)
            
        [self.dna addObject:[gen objectAtIndex:arc4random()%4]];
    }
     
    
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int count = 0;
    for (int i=0;i<100;i++)
    {
        if ( ![[_dna objectAtIndex:i] isEqual:[cell.dna objectAtIndex:i]] ) count++;
    }
    return count;
}

@end




@implementation Cell (mutator)


- (void)mutate:(int)x
{
    
    int n = (int)floor(_dna.count*x/100); // n количество ячеек которые нужно заменить от x %
    NSString  *mLeter = [gen objectAtIndex:arc4random()%4]; // буква на которую будем менять
   
    
    for (int i = 0; i < n; i++)   {
        int m = arc4random()%_dna.count; // выбираем случайный индекс
        NSString *leter = [_dna objectAtIndex:m]; // определяем букву по индексу

       
        if ([leter isEqual:mLeter]) {
            [_dna replaceObjectAtIndex:m withObject:mLeter];
        } else {
            [_dna replaceObjectAtIndex:m withObject:mLeter];
        } 

    }
    
}

@end


