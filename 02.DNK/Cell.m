//
//  Cell.m
//  02.DNK
//
//  Created by Lert on 10/30/12.
//  Copyright (c) 2012 HEXLET. All rights reserved.
//

#import "Cell.h"

//private store dnk
@interface Cell()
@property (nonatomic,strong) NSMutableArray* dnk;
@property (nonatomic,strong) NSArray* dnk_gen;
@end


@implementation Cell
@synthesize dnk=_dnk;
@synthesize dnk_gen = _dnk_gen;
-(id)init
{
    self = [super init];
    if(self)
    {
        //no rly needed to init array here, official practise do it in getter
    }
    return self;
}
-(id)initWithCapacity:(NSUInteger)count andGens:(NSArray*) dnk_gen
{
    self = [self init];
    if(self)
    {
        self.dnk = [[NSMutableArray alloc] initWithCapacity:count];
        self.dnk_gen = [NSArray arrayWithArray:dnk_gen];
        for(int i = 0; i < count; ++i)
        {
            [self.dnk addObject:[ self.dnk_gen objectAtIndex:(random() % [self.dnk_gen count]) ] ];
        }
    }
    return self;

}
//lazy instantiation
-(NSMutableArray*)dnk
{
    if(!_dnk)
    {
        _dnk = [[NSMutableArray alloc] initWithCapacity:100]; //default capacity
        for(int i = 0; i < 100; ++i) // IF NULL nothing happen
        {
            [_dnk addObject:[ self.dnk_gen objectAtIndex:(random() % [self.dnk_gen count]) ]];
        }
    }
    return _dnk;
}
-(NSArray*)dnk_gen
{
    if(!_dnk_gen)
    {
       _dnk_gen = [[NSArray alloc] initWithObjects:@"A",@"T",@"G", @"C", nil ]; //default values
    }
    return _dnk_gen;
    
}

-(NSString*)description
{
    return [NSString stringWithFormat:@" DNK = %@", self.dnk];
}

-(void)mutate:(NSUInteger)percent
{
    assert(percent <100);
    //create temp array with elem numbers, randomize it, then get first percent from size elements, and change them
    NSUInteger size = [_dnk count];
    int tmp_array[ size ];
    for(int i = 0; i <size; ++i)
    {
        tmp_array[i]=i;
    }
    for(int i = 0; i <size ; ++i)
    {
        int i1 = rand()%size;
        int i2 = rand()%size;
        int temp = tmp_array[i1];
        tmp_array[i1]=tmp_array[i2];
        tmp_array[i2]=temp;
    }
    for(int i =0; i < size/100 * percent; ++i)
    {
        [self.dnk replaceObjectAtIndex:tmp_array[i] withObject: [ self.dnk_gen objectAtIndex:(random() % [self.dnk_gen count]) ]];
    }
    
}
-(NSUInteger)hammingDistance:(Cell *)obj
{
    NSUInteger selfSize = [self.dnk count];
    NSUInteger objSize = [obj.dnk count];
    NSUInteger distance = selfSize >= objSize ? selfSize - objSize : objSize - selfSize ;
    NSUInteger check_interval = selfSize >= objSize ? objSize  : selfSize ;
    for(NSUInteger i=0; i < check_interval; ++i)
    {
        if (! [ [self.dnk objectAtIndex:i ] isEqualToString: [obj.dnk objectAtIndex: i] ])
        {
            ++distance;
        }
    }
    return distance;
}
@end
